package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.BoardMapper;
import wz.pojo.Board;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BoardService {
    @Resource
    private BoardMapper boardMapper;

    public List<Board> show(){
        return boardMapper.selAll();
    }
}
