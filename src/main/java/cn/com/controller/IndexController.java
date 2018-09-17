package cn.com.controller;

import cn.com.entity.Game;
import cn.com.entity.Product;
import cn.com.service.GameService;
import cn.com.service.OrderService;
import cn.com.service.ReportService;
import cn.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@SuppressWarnings({"ALL", "AlibabaUndefineMagicConstant"})
@Controller
public class IndexController {
    @Autowired
    private GameService gameService;

    /**
     * @return
     */
    @RequestMapping(value="/index/hotgame",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long, Object> gamehot(){
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<Game> games = gameService.selectHotGame();
        for (Game a:games){
           // System.out.println(a.toString());
            map.put(a.getId(),a);
        }
        return map;
    }
    //主页游戏推荐
    @SuppressWarnings("AlibabaUndefineMagicConstant")
    @RequestMapping(value="/index/gpmdamerecommend",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long, Object> gameRecommend(){
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<Game> games = gameService.selectStateGame();
        //noinspection AlibabaUndefineMagicConstant
        for (int i=0;i<12;i++){
//            System.out.println(a.toString());
            map.put(games.get(i).getId(),games.get(i));
        }
        return map;
    }
    //游戏专区查询所有游戏
    @RequestMapping(value="/index/allGame",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long , Object> allgameRecommend(){
       // System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
        Map<Long, Object> map =new HashMap<>();
        //查询状态为正常的游戏
        List<Game> games = gameService.selectStateGame();
        for (int i=0;i<games.size();i++){
//            System.out.println(a.toString());
            map.put(games.get(i).getId(),games.get(i));
        }
        return map;
    }


}
