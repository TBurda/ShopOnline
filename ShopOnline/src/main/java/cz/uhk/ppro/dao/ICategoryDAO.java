package cz.uhk.ppro.dao;

import java.util.List;

public interface ICategoryDAO {
    public List getCategories();

    public void save(String name);

    public List getNonEmptyCategories();
}
