package wz.mapper;

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

}
