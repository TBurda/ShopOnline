package cz.uhk.ppro.dao;

import java.util.List;

import cz.uhk.ppro.model.CartInfo;
import cz.uhk.ppro.model.OrderDetailInfo;
import cz.uhk.ppro.model.OrderInfo;
import cz.uhk.ppro.model.PaginationResult;

public interface IOrderDao {

    public void saveOrder(CartInfo cartInfo);

    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage);

    public OrderInfo getOrderInfo(String orderId);

    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

}
