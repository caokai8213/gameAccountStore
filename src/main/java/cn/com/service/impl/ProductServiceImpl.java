package cn.com.service.impl;

import cn.com.dao.ProductMapper;
import cn.com.entity.Product;
import cn.com.entity.ProductExample;
import cn.com.entity.ProductVo;
import cn.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService
{
  @Autowired private ProductMapper productMapper;


  @Override
  public int insert(Product product) {
    return productMapper.insert(product);
  }

  @Override
  public List<Product> selectOrderByCreateTime() {
    ProductExample example=new ProductExample();
    example.setOrderByClause("create_time DESC");
    ProductExample.Criteria criteria = example.createCriteria();
//    List list=new LinkedList();
//    list.add("1");
//    list.add("3");
//    criteria.andProductStateNotIn(list);
    criteria.andProductStateEqualTo("2");
    return productMapper.selectByExample(example);
  }

  @Override
  public List<ProductVo> selectProductVo() {
    return productMapper.selectProductVo();
  }

  @Override
  public List<ProductVo> selectProductVoBysearch(String search) {
    return productMapper.selectProductVoBySearch(search);
  }

  @Override
  public ProductVo selectProductVoByProductId(String productID) {
    return productMapper.selectProductVoByProductId(Long.parseLong(productID));
  }

  @Override
  public int updateProductState(Product product) {
    ProductExample example=new ProductExample();
    ProductExample.Criteria criteria = example.createCriteria();
    criteria.andProductIdEqualTo(product.getProductId());
    return productMapper.updateByExampleSelective(product,example);
  }

  @Override
  public List<ProductVo> selectProductVoByidstate(Product product) {
    return productMapper.selectProductVoByidstate(product);
  }

  @Override
  public int delete(String id) {
    return productMapper.deleteByPrimaryKey(Long.parseLong(id));
  }

  @Override
  public List<Product> selectByExample(Product product, String minPrice, String maxPrice, String flag) {
    ProductExample example=new ProductExample();
    ProductExample.Criteria criteria = example.createCriteria();
    if(product.getGameId()!=null){
      criteria.andGameIdEqualTo(product.getGameId());
    }
    if(product.getAreaId()!=null){
      criteria.andAreaIdEqualTo(product.getAreaId());
    }
    if("1".equals(flag)){
      example.setOrderByClause("product_price desc");
    }
    if("2".equals(flag)){
      example.setOrderByClause("product_price asc");
    }
    if(minPrice!=null&&maxPrice!=null&&!"".equals(minPrice)&&!"".equals(maxPrice)){
      BigDecimal min=new BigDecimal(minPrice);
      BigDecimal max=new BigDecimal(maxPrice);
      criteria.andProductPriceBetween(min,max);
    }
    //之前想的是不能搜索出未审核和审核失败的
//    List list=new LinkedList();
//    list.add("1");
//    list.add("3");
//    criteria.andProductStateNotIn(list);
    //但应该是待出售的才能被找到
    criteria.andProductStateEqualTo("2");
    return productMapper.selectByExample(example);
  }
}
