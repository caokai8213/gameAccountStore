package cn.com.service.impl;

import cn.com.entity.Game;
import cn.com.entity.GameArea;
import cn.com.service.GameService;
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
public class GameServiceImplTest extends TestCase {
    @Autowired
    private GameService gameService;
    @Test
    public void selectAllGame() throws Exception {
        List<Game> gameAreas = gameService.selectAllGame();
        System.out.println(gameAreas.toString());
    }
    @Test
    public void selectGameArea() throws Exception {
        List<GameArea> gameAreas = gameService.selectGameArreaByGameId("1");
        System.out.println(gameAreas.toString());
    }
}