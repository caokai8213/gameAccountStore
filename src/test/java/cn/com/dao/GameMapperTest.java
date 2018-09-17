package cn.com.dao;

import cn.com.entity.Game;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class GameMapperTest extends TestCase {
    @Autowired
    private GameMapper gameMapper;
    @Test
    public void selectAllGameBySearch() throws Exception {
        List<Game> a = gameMapper.selectAllGameBySearch("qq");
        for(Game list:a){
            System.out.println(list.toString());
        }

    }
    @Test
    public void selectHotGame() throws Exception {
        List<Game> a = gameMapper.selectHotGame();
        for(Game list:a){
            System.out.println(list.toString());
        }

    }
}