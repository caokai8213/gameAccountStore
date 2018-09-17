package cn.com.controller;



import cn.com.entity.*;
import cn.com.service.GameService;
import cn.com.service.MessageService;
import cn.com.service.OrderService;

import cn.com.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.filefilter.OrFileFilter;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.rmi.PortableRemoteObject;
import javax.security.auth.Subject;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private MessageService messageService;
    @RequestMapping(value = "/user/order/add",method = RequestMethod.GET)
    public ModelAndView insertOrder(@RequestParam("productId")String productId){
        ModelAndView mv=new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println("======="+productId);
        ProductVo productVo = productService.selectProductVoByProductId(productId);
        System.out.println("======="+productVo.toString());
        PrincipalCollection principals =  SecurityUtils.getSubject().getPrincipals();
        User user =(User)principals.getPrimaryPrincipal();
        System.out.println(user.toString());
        if(user.getUserId()==productVo.getProducerId()){
            mv.addObject("flag","1");
           mv.addObject("message","不能购买自己发布的账号,查看其它账号");
            mv.setViewName("result");
        }else if("4".equals(productVo.getProductState())||"5".equals(productVo.getProductState())){
         mv.addObject("flag",1);
         mv.addObject("message","商品已出售,查看其它账号");
         mv.setViewName("result");
        }else{
            Order order =new Order();
            String orderNo = "" ;
            UUID uuid = UUID.randomUUID();
            String sdf = new SimpleDateFormat("yyyyMMdd").format(new Date());
            orderNo = uuid.toString().substring(0, 3);
            orderNo =  "X"+sdf +orderNo ;
            System.out.println(orderNo);
            order.setOrderId(orderNo);
            Date date=new Date(System.currentTimeMillis());
            order.setCreateTime(date);
            order.setOrderState("1");
            order.setBuyerId(user.getUserId());
            order.setProductId(productVo.getProductId());
            System.out.println(order.toString());
            orderService.add(order);
            Product product =new Product();
            product.setProductId(productVo.getProductId());
            product.setProductState("4");
            productService.updateProductState(product);
            mv.addObject("flag",3);
            mv.addObject("orderNo",orderNo);
            mv.addObject("price",productVo.getProductPrice());
            mv.addObject("message","下单成功");
            mv.addObject("user",user);
            mv.setViewName("result");
        }
       return mv;
    }
    /*购买订单*/
    @RequestMapping(value = "/user/order/buylist",method = RequestMethod.GET)
    public ModelAndView buyerlist(@RequestParam("state")String state, @RequestParam(required=true,defaultValue="1")Integer page, @RequestParam(value = "gameName",required = false)String gameName){
     ModelAndView mv=new ModelAndView();
     Map<String,Object> map=new HashMap<>();
     Order order=new Order();
     PrincipalCollection principals =  SecurityUtils.getSubject().getPrincipals();
     User user =(User)principals.getPrimaryPrincipal();
     order.setBuyerId(user.getUserId());
        if (!"all".equals(state)) {
            order.setOrderState(state);
        }
     if(gameName!=null&&!"".equals(gameName)){
         map.put("gameName",gameName);
     }
        PageHelper.startPage(page, 5);
        List<OrderVo> orderVos = orderService.selectOrderBuyerByState(order, map);
        PageInfo<OrderVo> p = new PageInfo<>(orderVos);
        mv.addObject("page", p);
        mv.addObject("orderVos",orderVos);
        mv.addObject("state",state);
        mv.setViewName("user/buyerOrder");
     return mv;
    }
    /*假支付和取消订单*/
    @RequestMapping(value = "/user/order/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(@RequestParam(value = "id")String id,@RequestParam(value = "type")String type) throws IOException {
//        System.out.println("===========================");
//        System.out.println(id+type);
        Message message=new Message();
        Date date=new Date(System.currentTimeMillis());
        message.setMessageType("系统");
        message.setMessageTitle("您的商品被购买啦");
        message.setCreateTime(date);
        message.setMessageState("1");
        Order order = orderService.selectByid(id);
        ProductVo productVo = productService.selectProductVoByProductId(order.getProductId().toString());
        Product product=new Product();
        product.setProductId(order.getProductId());
        if ("zf".equals(type)){
            order.setOrderState("2");
            product.setProductState("5");
            message.setUserId(productVo.getProducerId());
            message.setMessageContent("  <p class=\"propmt-info mt12\">尊敬的用户:<br>\n" +
                    "\t\t<span class=\"text-indent\">\n" +
                    "                    亲爱的用户，您发布的商品"+productVo.getProductName()+"已被购买\n" +
                    "                    </span>\n" +
                    "</p>");
            messageService.insert(message);
        }else if("qx".equals(type)){
            product.setProductState("2");
            order.setOrderState("3");
        }
        //修改商品状态
        productService.updateProductState(product);
        int flag = orderService.update(order);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        if("zf".equals(type)){
            map.put("success","支付成功");
            map.put("error","支付失败");
        }
        if("qx".equals(type)){
            map.put("success","取消成功");
            map.put("error","取消失败");
        }

        return map;
    }

    /*删除订单*/
    @RequestMapping(value = "/user/order/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delete(@RequestParam(value = "id")String id) throws IOException {
        Map<String,Object> map=new HashMap<>();
        System.out.println("===========================");
        int flag = orderService.deleteOrder(id);
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }
    //卖家我的订单
    @RequestMapping(value = "/user/order/sellerlist",method = RequestMethod.GET)
    public ModelAndView sellerlist(@RequestParam("state")String state, @RequestParam(required=true,defaultValue="1")Integer page, @RequestParam(value = "gameName",required = false)String gameName){
        ModelAndView mv=new ModelAndView();
        Map<String,Object> map=new HashMap<>();
        Order order=new Order();
        PrincipalCollection principals =  SecurityUtils.getSubject().getPrincipals();
        User user =(User)principals.getPrimaryPrincipal();
        map.put("producerId",user.getUserId());
        if (!"all".equals(state)) {
            order.setOrderState(state);
        }
        if(gameName!=null&&!"".equals(gameName)){
            map.put("gameName",gameName);
        }
        PageHelper.startPage(page, 5);
        List<OrderVo> orderVos = orderService.selectOrderSellerByState(order, map);
        PageInfo<OrderVo> p = new PageInfo<>(orderVos);
        mv.addObject("page", p);
        mv.addObject("orderVos",orderVos);
        mv.addObject("state",state);
        mv.setViewName("user/sellerOrder");
        return mv;
    }
    //管理查看所有订单
    @RequestMapping(value = "/manage/order",method = RequestMethod.GET)
    public ModelAndView list(@RequestParam(required=true,defaultValue="1")Integer page, @RequestParam(value = "gameId",required = false)String gameId, @RequestParam(value = "ostate",required = false)String ostate, @RequestParam(value = "stime",required = false)String stime, @RequestParam(value = "etime",required = false)String etime){
        ModelAndView mv=new ModelAndView();
        Map<String,Object> map=new HashMap<>();
        map.put("gameId",gameId);
        map.put("ostate",ostate);
        if(stime!=null){
            map.put("stime",stime.replace("*"," "));
        }
        if(etime!=null){
            map.put("etime",etime.replace("*"," "));
        }
        PageHelper.startPage(page, 5);
        List<OrderVo> orderVos = orderService.selectVo(map);
        PageInfo<OrderVo> p = new PageInfo<>(orderVos);
        mv.addObject("page", p);
        mv.addObject("orderVos",orderVos);
        mv.addObject("gameId",gameId);
        mv.addObject("ostate",ostate);
        mv.addObject("stime",stime);
        mv.addObject("etime",etime);
        mv.setViewName("manage/order/orderindex");
        return mv;
    }
    /*查询订单状态列表选择时*/
    @RequestMapping(value="/manage/orderstatelist",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> orderstatelist(){
        Map<String, Object> map =new HashMap<>();
        List<OrderState> orderStates = orderService.selectAll();
        for(OrderState o:orderStates){
            map.put(o.getOrderStateId(),o);
        }
        return map;
    }
}
