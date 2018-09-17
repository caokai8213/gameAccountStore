package cn.com.service;

import cn.com.entity.Product;
import cn.com.entity.ProductVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class ProductServiceTest {
    @Autowired private  ProductService productService;

    @Test
    public void select() throws Exception {
        List<Product> products = productService.selectOrderByCreateTime();
        for(Product s :products){
            System.out.println(s.toString());
        }

    }
    @Test
    public void selectProductVo() throws Exception {
        List<ProductVo> productVos = productService.selectProductVo();
        for(ProductVo s :productVos){
            System.out.println(s.toString());
        }
    }
    @Test
    public void selectProductVoById() throws Exception {
        String productId="1";
        ProductVo productVo = productService.selectProductVoByProductId(productId);
            System.out.println("=============="+productVo.toString());
    }
    @Test
    public void update() throws Exception {
        Product product=new Product();
        product.setProductId(Long.parseLong("119"));
        product.setProductState("2");
        int flag = productService.updateProductState(product);
        System.out.println("=============="+flag);
    }
    @Test
    public void selectbysearch() throws Exception {

        List<ProductVo> caokai = productService.selectProductVoBysearch("魔兽世界");
        for(ProductVo s:caokai){
            System.out.println(s.toString());
        }
    }
    @Test
    public void selectbyidstate() throws Exception {
        Product product=new Product();
        product.setProducerId(Integer.parseInt("10"));
        product.setProductState("1");
        List<ProductVo> productVos = productService.selectProductVoByidstate(product);
        for(ProductVo s:productVos){
            System.out.println("========================="+s.toString());
        }
    }
    @Test
    public void selectByExample() throws Exception {
        Product product=new Product();
        product.setGameId(Long.parseLong("44"));
        List<Product> products = productService.selectByExample(product,null,null,"2");
        for(Product s:products){
            System.out.println("========================="+s.toString());
        }
    }
}