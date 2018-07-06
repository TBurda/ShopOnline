package cz.uhk.ppro.dao;

import cz.uhk.ppro.entity.Product;
import cz.uhk.ppro.model.PaginationResult;
import cz.uhk.ppro.model.ProductInfo;

public interface IProductDAO {



    public Product findProduct(String code);

    public ProductInfo findProductInfo(String code) ;


    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage  );

    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage, String likeName);

    public void save(ProductInfo productInfo);

}
