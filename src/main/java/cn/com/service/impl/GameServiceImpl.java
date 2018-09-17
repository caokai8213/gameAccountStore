package cn.com.service.impl;

import cn.com.dao.GameAreaMapper;
import cn.com.dao.GameMapper;
import cn.com.entity.Game;
import cn.com.entity.GameArea;
import cn.com.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GameServiceImpl implements GameService{
   @Autowired
   private GameMapper gameMapper;
   @Autowired
   private  GameAreaMapper gameAreaMapper;

    @Override
    public List<Game> selectAllGame() {
       return gameMapper.selectAllGame();
    }

    @Override
    public List<Game> selectStateGame() {
        return gameMapper.selectStateGame();
    }

    @Override
    public int insert(Game game) {

        return gameMapper.insert(game);
    }

    @Override
    public Game selectGameById(String id) {
        return gameMapper.selectByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public GameArea selectGameAreaById(String id) {
        return gameAreaMapper.selectByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public int update(Game game) {
        return gameMapper.updateByPrimaryKey(game);
    }

    @Override
    public int update(GameArea gameArea) {
        return gameAreaMapper.updateByPrimaryKey(gameArea);
    }

    @Override
    public int updateByPrimaryKeySelective(Game game) {
        return gameMapper.updateByPrimaryKeySelective(game);
    }

    @Override
    public int updateByPrimaryKeySelective(GameArea gameArea) {
        return gameAreaMapper.updateByPrimaryKeySelective(gameArea);
    }

    @Override
    public List<GameArea> selectAllGameArea() {
        return gameAreaMapper.selectAllGameArea();
    }

    @Override
    public List<GameArea> selectGameArreaByGameId(String id) {
       return gameAreaMapper.selectGameAreaByGameId(Long.parseLong(id));
    }

    @Override
    public int insert(GameArea gameArea) {
        return gameAreaMapper.insert(gameArea);
    }

    @Override
    public int deleteGame(String id) {
        return gameMapper.deleteByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public int deleteGameArea(String id) {
        return gameAreaMapper.deleteByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public List<Game> selectAllGameBySearch(String search) {
        return gameMapper.selectAllGameBySearch(search);
    }

    @Override
    public List<Game> selectHotGame() {
        return gameMapper.selectHotGame();
    }

    @Override
    public List<GameArea> selectGameAreaStateByGameId(String id) {
        return gameAreaMapper.selectGameAreaByGameId(Long.parseLong(id));
    }
}
