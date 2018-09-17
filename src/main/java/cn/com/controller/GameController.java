package cn.com.controller;
import cn.com.dao.GameMapper;
import cn.com.entity.Game;
import cn.com.entity.GameArea;
import cn.com.entity.User;
import cn.com.service.GameService;
import cn.com.util.UUIDUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Controller
@RequestMapping("/manage")
public class GameController {

    @Autowired
    private GameService gameService;

    //查询游戏列表
    @RequestMapping(value="/game",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(value = "search",required = false)String search){

        PageHelper.startPage(page, 5);
        List<Game> games=null;
        if(search==null||"".equals(search)){
            games=gameService.selectAllGame();
        }
        else{
         games= gameService.selectAllGameBySearch(search);
        }
        PageInfo<Game> p=new PageInfo<>(games);
        model.addAttribute("page", p);
        model.addAttribute("search",search);
        model.addAttribute("games",games);
        return "/manage/game/gameindex";
    }
    /*查询游戏列表选择时*/
    @RequestMapping(value="/gamelist",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long, Object> lista(){
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<Game> games = gameService.selectStateGame();
        for (Game a:games){
            System.out.println(a.toString());
        map.put(a.getId(),a);}
        return map;
    }
    /*上传图片并回填存放的位置以便新增修改时保存地址到数据库*/
    @RequestMapping("/game/uplode/photo")
    @ResponseBody
    public Map<String, Object> updatePhoto(HttpServletRequest request, HttpServletResponse response, @RequestParam("myFile") MultipartFile myFile){
        Map<String, Object> json = new HashMap<String, Object>();
        //System.out.println("==========================");
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
            String url = request.getSession().getServletContext().getRealPath("/images/youxitubiao");
            //相对路径
            String path = "/"+name + "." + ext;
            File file = new File(url);
            if(!file.exists()){
                file.mkdirs();
            }
            myFile.transferTo(new File(url+path));
            json.put("success", "/images/youxitubiao"+path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json ;
    }
    /*新增游戏*/
    @RequestMapping(value = "/game/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insert(Game game){
        Map<String, Object> map = new HashMap<String, Object>();
        game.setState(1);
        System.out.println(game.getPicUrl());
        int flag = gameService.insert(game);
        System.out.println("============"+flag);
        map.put("flag",flag);
        map.put("msg","添加失败");
        return map;
    }
    /*设置游戏状态*/
    @RequestMapping(value = "/game/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(@RequestParam(value = "id")String id,@RequestParam(value = "type")String type) throws IOException {
        System.out.println("===========================");
        System.out.println(id+type);
        Game game = gameService.selectGameById(id);
        System.out.println(game);
        /*根据传来的值判断要把状态设为禁用还是启用*/
        if ("qy".equals(type)){
            game.setState(1);
        }else if("jy".equals(type)){
            game.setState(0);
        }
        int flag = gameService.update(game);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","修改成功");
        map.put("error","修改失败");
        return map;
    }
    /*删除游戏*/
    @RequestMapping(value = "/game/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delete(@RequestParam(value = "id")String id) throws IOException {
        System.out.println("===========================");
         int flag= gameService.deleteGame(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }
    /*设置服务器状态*/
    @RequestMapping(value = "/gameArea/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateArea(@RequestParam(value = "id")String id,@RequestParam(value = "type")String type) throws IOException {
        System.out.println("===========================");
        System.out.println(id+type);
        GameArea gameArea = gameService.selectGameAreaById(id);
        System.out.println(gameArea);
        /*根据传来的值判断要把状态设为禁用还是启用*/
        if ("qy".equals(type)){
            gameArea.setState(1);
        }else if("jy".equals(type)){
            gameArea.setState(0);
        }
        int flag = gameService.update(gameArea);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","修改成功");
        map.put("error","修改失败");
        return map;
    }
    /*修改页面信息回填通过游戏id查询此信息*/
    @RequestMapping(value = "/game/query",method = RequestMethod.GET)
    public ModelAndView query(@RequestParam(value = "id")String id,@RequestParam(value = "page")String page,@RequestParam(value = "search",required = false)String search) throws IOException {
        ModelAndView mav = new ModelAndView();
        //System.out.println("==========================="+id);
        Game game = gameService.selectGameById(id);
        //System.out.println("+++++++++++++++++++++++++"+game.getGameName());
        mav.addObject("game",game);
        mav.addObject("pagenum",page);
        mav.addObject("search",search);
        mav.setViewName("manage/game/update");
        return mav;
    }
    /*修改游戏信息*/
    @RequestMapping(value = "/game/update2",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateGame(Game game){
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println("++++++++++++++++++++++++++++++++++++++++++"+game.toString());
        int flag = gameService.updateByPrimaryKeySelective(game);
        System.out.println("============"+flag);
        map.put("flag",flag);
        map.put("msg","修改失败");
        return map;
    }

    /*查询游戏区列表*/
    @RequestMapping(value="/gameArea",method = RequestMethod.GET)
    public ModelAndView  gameArealist(@RequestParam(required=true,defaultValue="1")Integer page,@RequestParam(value = "id",required=false)String id ){
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 5);
        List<GameArea> gameAreas=null;
        if(id==null||"".equals(id)) {
            gameAreas= gameService.selectAllGameArea();
        }else{
            gameAreas = gameService.selectGameArreaByGameId(id);
        }
        PageInfo<GameArea> p=new PageInfo<>(gameAreas);
        //System.out.println(gameAreas);
        mav.addObject("page", p);
        mav.addObject("id",id);
        mav.addObject("gamesArea",gameAreas);
        mav.setViewName("/manage/gameArea/gameAreaindex");
        return mav;
    }
    /*新增服务器*/
    @RequestMapping(value = "/gameArea/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertGameArea(GameArea gameArea){
        Map<String, Object> map = new HashMap<String, Object>();
        gameArea.setState(1);
        int flag = gameService.insert(gameArea);
        System.out.println("============"+flag);
        map.put("flag",flag);
        map.put("msg","添加失败");
        return map;
    }
    /*修改页面信息回填通过游戏id查询此信息*/
    @RequestMapping(value = "/gameArea/query",method = RequestMethod.GET)
    public ModelAndView queryArea(@RequestParam(value = "id",required = false)String id,@RequestParam(value = "page")String page,@RequestParam(value = "areaid")String areaid) throws IOException {
        ModelAndView mav = new ModelAndView();
        GameArea gameArea = gameService.selectGameAreaById(areaid);
        List<Game> games = gameService.selectAllGame();
        //System.out.println("+++++++++++++++++++++++++"+game.getGameName());
        mav.addObject("gameArea",gameArea);
        mav.addObject("pagenum",page);
        mav.addObject("game",games);
        mav.setViewName("manage/gameArea/update");
        return mav;
    }
    @RequestMapping(value = "/gameArea/update2",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateGameArea(GameArea gameArea){
        Map<String, Object> map = new HashMap<String, Object>();
       // System.out.println("++++++++++++++++++++++++++++++++++++++++++"+gameArea.toString());
        int flag=gameService.updateByPrimaryKeySelective(gameArea);
        GameArea gameArea1 = gameService.selectGameAreaById(gameArea.getId().toString());
        System.out.println("============"+flag);
        map.put("gameid",gameArea1.getGameId());
        map.put("flag",flag);
        map.put("msg","修改失败");
        return map;
    }
    /*删除服务器*/
    @RequestMapping(value = "/gameArea/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteArea(@RequestParam(value = "id")String id) throws IOException {
        //System.out.println("===========================");
        int flag= gameService.deleteGameArea(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }

}
