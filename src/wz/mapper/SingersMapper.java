package wz.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import wz.pojo.Singers;

import java.util.List;

public interface SingersMapper {

    //模糊查询
    List<Singers> selByName(@Param("name") String name);

    @Select("select * from singers limit 13")
    List<Singers> selHot();

    //选择所有
    List<Singers> selAll();

    //获取元素个数
    @Select("select count(*) from singers")
    int selCount();

    //分页
    List<Singers> selByPage(int pageStart, int pageSize);

    @Delete("delete from singers where id=#{0}")
    int delById(int id);
}
