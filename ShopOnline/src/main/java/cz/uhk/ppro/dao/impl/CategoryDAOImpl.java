package cz.uhk.ppro.dao.impl;

import cz.uhk.ppro.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import cz.uhk.ppro.dao.ICategoryDAO;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class CategoryDAOImpl implements ICategoryDAO {


    @Autowired
    private SessionFactory sessionFactory;


    public List<Category> getCategories() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Category");
        return  query.getResultList();
    }

    public void save(String name) {
        this.sessionFactory.getCurrentSession().save(new Category(name));
        this.sessionFactory.getCurrentSession().flush();
    }

    public List getNonEmptyCategories(){
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createNativeQuery("SELECT c.ID, c.name FROM categories c JOIN products p ON c.ID = p.CATEGORY_ID GROUP by c.Name Order BY c.Name");
        return  query.getResultList();
    }
}
