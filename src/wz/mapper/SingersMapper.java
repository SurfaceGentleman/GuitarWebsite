package wz.mapper;

import org.apache.ibatis.annotations.*;
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

    //插入歌手
    //    insert into singers
    //    values (default, '站长', '', '');
    @Insert("insert into singers values(default, #{0}, #{1}, #{2})")
    int insSinger(String name, String introduce, String photo);

    //修改歌手信息
    //update singers set name='wz', introduce='sg', photo=photo where id=12;
    @Update("update singers set name=#{0}, introduce=#{1}, photo=#{2} where id=#{3}")
    int updSinger(String name, String introduce, String photo, int id);
}
