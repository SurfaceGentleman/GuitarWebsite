package wz.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import wz.pojo.Singers;

import java.util.List;

public interface SingersMapper {
    //N+1查询
    List<Singers> selAll();

    //模糊查询
    List<Singers> selByName(@Param("name") String name);

    @Select("select * from singers limit 13")
    List<Singers> selHot();
}
