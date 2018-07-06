package cz.uhk.ppro.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import cz.uhk.ppro.entity.Product;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import cz.uhk.ppro.dao.IOrderDao;
import cz.uhk.ppro.dao.IProductDAO;
import cz.uhk.ppro.model.CartInfo;
import cz.uhk.ppro.model.CustomerInfo;
import cz.uhk.ppro.model.OrderDetailInfo;
import cz.uhk.ppro.model.OrderInfo;
import cz.uhk.ppro.entity.Order;
import cz.uhk.ppro.entity.OrderDetail;
import cz.uhk.ppro.model.CartLineInfo;
import cz.uhk.ppro.model.PaginationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.TypedQuery;


@Transactional
public class OrderDAOImpl implements IOrderDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private IProductDAO productDAO;

    private int getMaxOrderNum() {

        String sql = "Select max(o.orderNum) from " + Order.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        TypedQuery query = session.createQuery(sql);

        Integer value = (Integer) query.getSingleResult();
        if (value == null) {
            return 0;
        }
        return value;
    }


    public void saveOrder(CartInfo cartInfo) {
        Session session = sessionFactory.getCurrentSession();

        int orderNum = this.getMaxOrderNum() + 1;
        Order order = new Order();

        order.setId(UUID.randomUUID().toString());
        order.setOrderNum(orderNum);
        order.setOrderDate(new Date());
        order.setAmount(cartInfo.getAmountTotal());

        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        order.setCustomerName(customerInfo.getName());
        order.setCustomerEmail(customerInfo.getEmail());
        order.setCustomerPhone(customerInfo.getPhone());
        order.setCustomerAddress(customerInfo.getAddress());

        session.persist(order);

        List<CartLineInfo> lines = cartInfo.getCartLines();

        for (CartLineInfo line : lines) {
            OrderDetail detail = new OrderDetail();
            detail.setId(UUID.randomUUID().toString());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuanity(line.getQuantity());

            String code = line.getProductInfo().getCode();
            Product product = this.productDAO.findProduct(code);
            detail.setProduct(product);

            session.persist(detail);
        }

        cartInfo.setOrderNum(orderNum);
    }


    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage) {
        String sql = "Select new " + OrderInfo.class.getName()
                + "(ord.id, ord.orderDate, ord.orderNum, ord.amount, "
                + " ord.customerName, ord.customerAddress, ord.customerEmail, ord.customerPhone) " + " from "
                + Order.class.getName() + " ord "
                + " order by ord.orderNum desc";
        Session session = this.sessionFactory.getCurrentSession();

        Query query = session.createQuery(sql);

        return new PaginationResult<OrderInfo>(query, page, maxResult, maxNavigationPage);
    }

    public Order findOrder(String orderId) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Order.class);
        crit.add(Restrictions.eq("id", orderId));
        return (Order) crit.uniqueResult();
    }


    public OrderInfo getOrderInfo(String orderId) {
        Order order = this.findOrder(orderId);
        if (order == null) {
            return null;
        }
        return new OrderInfo(order.getId(), order.getOrderDate(),
                order.getOrderNum(), order.getAmount(), order.getCustomerName(),
                order.getCustomerAddress(), order.getCustomerEmail(), order.getCustomerPhone());
    }


    public List<OrderDetailInfo> listOrderDetailInfos(String orderId) {
        String sql = "Select new " + OrderDetailInfo.class.getName()
                + "(d.id, d.product.code, d.product.name , d.quanity,d.price,d.amount) "
                + " from " + OrderDetail.class.getName() + " d "
                + " where d.order.id = :orderId ";

        Session session = this.sessionFactory.getCurrentSession();
        TypedQuery<OrderDetailInfo> query = session.createQuery(sql);
        query.setParameter("orderId", orderId);
        List<OrderDetailInfo> result = query.getResultList();
        return result;
    }

}