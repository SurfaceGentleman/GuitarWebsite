package wz.mapper;

import org.apache.ibatis.annotations.Select;
import wz.pojo.Board;

import java.util.List;

public interface BoardMapper {
    @Select("select * from board")
    List<Board> selAll();
}
