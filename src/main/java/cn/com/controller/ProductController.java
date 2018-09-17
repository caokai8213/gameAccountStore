package cn.com.controller;

import cn.com.entity.*;
import cn.com.service.GameService;
import cn.com.service.MessageService;
import cn.com.service.ProductService;
import cn.com.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    private GameService gameService;
    @Autowired
    private ProductService productService;
    @Autowired
    private MessageService messageService;
    /*上传图片并回填存放的位置以便新增修改时保存地址到数据库*/
    @RequestMapping("/product/update/photo")
    @ResponseBody
    public Map<String, Object> updatePhoto(HttpServletRequest request, HttpServletResponse response, @RequestParam("myFile") MultipartFile myFile){
        Map<String, Object> json = new HashMap<String, Object>();
        System.out.println("==========================");
        try {
            //输出文件后缀名称
            System.out.println(myFile.getOriginalFilename());
            //获得上传前的名字
            String name = FilenameUtils.getBaseName(myFile.getOriginalFilename());
            //加上uuid随机数，确保不会重复
            String uuid = UUIDUtils.getUUID();
            name+="-"+uuid;
            String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
            //保存图片       File位置 （全路径）   /upload/fileName.jpg
            String url = request.getSession().getServletContext().getRealPath("/images/productpic");
            //相对路径
            String path = "/"+name + "." + ext;
            File file = new File(url);
            if(!file.exists()){
                file.mkdirs();
            }
            myFile.transferTo(new File(url+path));
            json.put("success", "/images/productpic"+path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json ;
    }
    /*发布查询游戏列表选择时*/
    @RequestMapping(value="/product/queryGameList",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long, Object> lista(){
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<Game> games = gameService.selectStateGame();
        for (Game a:games){
           // System.out.println(a.toString());
            map.put(a.getId(),a);}
        return map;
    }
    /*发布查询区服列表选择时*/
    @RequestMapping(value="/product/queryAreaList",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long, Object> listb(@RequestParam("gameId")String gameId){
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<GameArea>  gameAreas= gameService.selectGameAreaStateByGameId(gameId);
        for (GameArea a:gameAreas){
            // System.out.println(a.toString());
            map.put(a.getId(),a);}
        return map;
    }
    /*后台查询所有商品时*/
    @RequestMapping(value="/manage/product",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1")Integer page, Model model, @RequestParam(value = "search",required = false)String search){
        PageHelper.startPage(page, 5);
        List<ProductVo> products;
        if(search==null||"".equals(search)){
            products= productService.selectProductVo();
        }
        else{
            products = productService.selectProductVoBysearch(search);
        }
        PageInfo<ProductVo> p=new PageInfo<>(products);
        model.addAttribute("page", p);
        model.addAttribute("search",search);
        model.addAttribute("products",products);
        return "/manage/product/productindex";
    }
    /*新增商品*/
    @RequestMapping(value = "/product/addproduct",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addProduct(@RequestBody Product product) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        Date date = new Date(System.currentTimeMillis());
        product.setCreateTime(date);
        product.setProductState("1");
        //System.out.println("================"+product.toString());
        int flag = productService.insert(product);
        System.out.println("============"+flag);
        map.put("flag",flag);
        map.put("msg","添加失败");
        return map;
    }

    //最新发布
    @RequestMapping(value="/index/lastProduct",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long , Object> lastedproduct(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Map<Long, Object> map =new HashMap<>();
        //按时间推荐商品
        List<Product> products = productService.selectOrderByCreateTime();
        if(products.size()<=5){
            for (int i=0;i<products.size();i++){
                map.put(products.get(i).getProductId(),products.get(i));
            }
        }else {
        for (int i=0;i<5;i++){
            map.put(products.get(i).getProductId(),products.get(i));
        }
        }
        return map;
    }
    //根据id查商品详情页面展示给用户
    @RequestMapping(value="/productDetail",method = RequestMethod.GET)
    public ModelAndView querybyid(@RequestParam(value="productId")String productid) {
        ModelAndView mv = new ModelAndView();
        System.out.println("=================="+productid);
        ProductVo productVo = productService.selectProductVoByProductId(productid);
        String comment = productVo.getComment();
        if(comment!=null){
        comment.replaceAll("\r\n","<br>");}
        productVo.setComment(comment);
        mv.addObject("productVo", productVo);
        mv.setViewName("shangpingdetail");
        return mv;
    }
    /*设置商品状态(同意商品或拒绝)*/
    @RequestMapping(value = "/manage/product/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(@RequestParam(value = "id")String id,@RequestParam(value = "type")String type) throws IOException {
        System.out.println("===========================");
        System.out.println(id+type);
        Product product=new Product();
        product.setProductId(Long.parseLong(id));
        ProductVo productVo = productService.selectProductVoByProductId(id);
        Integer producerId = productVo.getProducerId();
        Message message =new Message();
        message.setMessageState("1");
        message.setUserId(producerId);
        message.setMessageType("系统");
        Date date=new Date(System.currentTimeMillis());
        message.setCreateTime(date);
        if ("ty".equals(type)){
            //发送商品上架站内信
            product.setProductState("2");
            message.setMessageTitle("你的商品"+productVo.getProductName()+"上架了");
            message.setMessageContent("<p class=\"propmt-info mt12\">尊敬的用户:<br>\n" +
                    "\t\t<span class=\"text-indent\">\n" +
                    "                    亲爱的用户，您发布的"+productVo.getProductName()+"已成功上架。\n" +
                    "\t\t</span>\n" +
                    "</p>");
        }else if("jj".equals(type)){
            //发送商品被拒绝站内信
            product.setProductState("3");
            message.setMessageTitle("你的商品"+productVo.getProductName()+"被拒绝了");
            message.setMessageContent("            <p class=\"propmt-info mt12\">尊敬的用户:<br>\n" +
                    "\t\t<span class=\"text-indent\">\n" +
                    "                    亲爱的用户，您发布的"+productVo.getProductName()+"已被删除，原因是：【资料不正确】,\n" +
                    "            如需出售商品请重新发布。\n" +
                    "\t\t</span>\n" +
                    "</p>");
        }
        messageService.insert(message);
       int flag = productService.updateProductState(product);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","修改成功");
        map.put("error","修改失败");
        return map;
    }
    //根据id查商品详情页面
    @RequestMapping(value="/manage/productDetail/{id}",method = RequestMethod.GET)
    public ModelAndView queryProduct(@PathVariable("id")String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("=================="+id);
        ProductVo productVo = productService.selectProductVoByProductId(id);
        if(productVo.getComment()!=null){
        String comment = productVo.getComment();
        comment.replaceAll("\r\n","<br>");
        productVo.setComment(comment);}
        mv.addObject("productVo", productVo);
        mv.setViewName("manage/product/productview");
        return mv;
    }
/*    //根据id状态查自己的product页面
    @RequestMapping(value="/product/{state}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> notice1(@PathVariable("state")String state) {
        Map<String,Object> map=new HashMap<>() ;
        User user1 =(User) SecurityUtils.getSubject().getPrincipal();
        Integer userId = user1.getUserId();
        Product product=new Product();
        product.setProducerId(userId);
        if(!"all".equals(state)){
            product.setProductState(state);
        }
        System.out.println("=============");
        List<ProductVo> productVos = productService.selectProductVoByidstate(product);
        map.put("productVos",productVos);
        return map;
    }*/
    //根据id状态查自己的product页面,前台页面我的商品
    @RequestMapping(value="/user/product1",method = RequestMethod.GET)
    public String list1(@RequestParam("state")String state, @RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(value = "search",required = false)String search) {
        User user1 = (User) SecurityUtils.getSubject().getPrincipal();
        Integer userId = user1.getUserId();
        Product product = new Product();
        product.setProducerId(userId);
        if (!"all".equals(state)) {
            product.setProductState(state);
        }
        PageHelper.startPage(page, 5);
        List<ProductVo> products = null;
        if (search == null || "".equals(search)) {
            products = productService.selectProductVoByidstate(product);
        }
        PageInfo<ProductVo> p = new PageInfo<>(products);
        model.addAttribute("page", p);
        model.addAttribute("search", search);
        model.addAttribute("state",state);
        model.addAttribute("products", products);
        return "user/myproduct";
    }
    /*删除商品*/
    @RequestMapping(value = "/product/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delete(@RequestParam(value = "id")String id) throws IOException {
        System.out.println("===========================");
        int flag= productService.delete(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }
    //搜索页面的商品展示
    @RequestMapping(value="/product/productlist",method = RequestMethod.GET)
    public ModelAndView list2(@RequestParam(value="gameId")String gameId,@RequestParam(value="areaId",required = false)String areaId, @RequestParam(value = "flag",required = false)String flag, @RequestParam(required=true,defaultValue="1")Integer page,@RequestParam(value = "price",required = false)String price) {
        ModelAndView mv=new ModelAndView();
        String minprice=null;
        String maxprice=null;
        if(price!=null&&!"".equals(price)){
            String[] split = price.split("-");
            minprice=split[0];
            maxprice=split[1];
        }
        Game game=gameService.selectGameById(gameId);
        List<GameArea> gameAreas = gameService.selectGameArreaByGameId(gameId);
        Product product = new Product();
        product.setGameId(Long.parseLong(gameId));
        if(areaId!=null&&!"".equals(areaId)){
            product.setAreaId(Long.parseLong(areaId));
        }
        PageHelper.startPage(page, 5);
        List<Product> products =  productService.selectByExample(product,minprice,maxprice,flag);
        PageInfo<Product> p = new PageInfo<>(products);
        for (Product s: products){
            System.out.println("======="+s.toString());
        }
        mv.addObject("page", p);
        mv.addObject("price",price);
        mv.addObject("flag",flag);
        mv.addObject("game",game);
        mv.addObject("areaId",areaId);
        mv.addObject("products", products);
        mv.addObject("gameAreas",gameAreas);
        mv.setViewName("shangping");
        return mv;
    }
    //buyer页面显示账号信息
    @RequestMapping(value="/user/productDetail",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> queryProductAccount(@RequestParam("id")String id) {
        Map<String,Object> map=new HashMap<>();
        System.out.println("=================="+id);
        ProductVo productVo = productService.selectProductVoByProductId(id);
        map.put("productVo",productVo);
        return map;
    }
}
