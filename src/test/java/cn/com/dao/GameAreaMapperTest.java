package cn.com.dao;

import cn.com.entity.GameArea;
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
public class GameAreaMapperTest extends TestCase {
    @Autowired
    GameAreaMapper gameAreaMapper;
    @Test
    public void deleteByPrimaryKey() throws Exception {
    }

    @Test
    public void insert() throws Exception {
    }

    @Test
    public void insertSelective() throws Exception {
    }

    @Test
    public void selectByPrimaryKey() throws Exception {
        GameArea gameArea = gameAreaMapper.selectByPrimaryKey(Long.parseLong("6002"));
       System.out.println(gameArea.toString());
    }

    @Test
    public void updateByPrimaryKeySelective() throws Exception {
    }

    @Test
    public void updateByPrimaryKey() throws Exception {
    }

    @Test
    public void selectAllGameArea() throws Exception {
        List<GameArea> gameAreas = gameAreaMapper.selectAllGameArea();
        System.out.println(gameAreas.toString());
    }

}