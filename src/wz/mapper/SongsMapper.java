package wz.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import wz.pojo.Songs;

import java.util.List;

public interface SongsMapper {

    //选出歌曲信息（包含歌手名）
    List<Songs> selBySid(int id);

    List<Songs> selByName(@Param("name") String name);

    @Select("select s.id id, s.name name, s.format format, singers.name sname, s.number number from songs s left join singers on s.sid = singers.id limit 13")
    List<Songs> selHot();

    //选择所有
    @Select("select * from songs")
    List<Songs> selAll();

    //获取元素个数
    @Select("select count(*) from songs")
    int selCount();

    //分页
    List<Songs> selByPage(int pageStart, int pageSize);

    @Delete("delete from songs where id=#{0}")
    int delById(int id);

}
