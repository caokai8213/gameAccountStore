package cn.com.service;

import cn.com.entity.Game;
import cn.com.entity.GameArea;
import org.springframework.stereotype.Service;

import java.util.List;
public interface GameService {
    List<Game> selectAllGame();
    List<Game> selectStateGame();
    int insert(Game game);
    Game selectGameById(String id);
    GameArea selectGameAreaById(String id);
    int update(Game game);
    int update(GameArea gameArea);
    int updateByPrimaryKeySelective(Game game);
    int updateByPrimaryKeySelective(GameArea gameArea);
    List<GameArea> selectAllGameArea();
    List<GameArea> selectGameArreaByGameId(String id);
    int insert(GameArea gameArea);
    int deleteGame(String  id);
    int deleteGameArea(String id);
    List<Game> selectAllGameBySearch(String search);
    List<Game> selectHotGame();
    List<GameArea> selectGameAreaStateByGameId(String id);
}
