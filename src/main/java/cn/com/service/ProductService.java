package cn.com.service;

import cn.com.entity.Product;
import cn.com.entity.ProductExample;
import cn.com.entity.ProductVo;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

public interface ProductService
{
    /*新增商品*/
    int insert(Product product);
    List<Product> selectOrderByCreateTime();
    List<ProductVo> selectProductVo();
    List<ProductVo> selectProductVoBysearch(String search);
    ProductVo selectProductVoByProductId(String productID);
    int updateProductState(Product product);
    List<ProductVo> selectProductVoByidstate(Product product);
    int delete(String id);
    List<Product> selectByExample(Product product, String minPrice, String maxPrice, String flag);
}
