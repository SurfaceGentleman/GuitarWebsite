package wz.mapper;

import org.apache.ibatis.annotations.*;
import wz.pojo.Songs;

import java.util.List;

public interface SongsMapper {

    @Select("select * from songs where id = #{0}")
    Songs selById(int id);

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

    //插入歌曲
    //insert into songs values (default, '呵呵', 3, null, null);
    @Insert("insert into songs values (default, #{0}, #{1}, null, null)")
    int insSong(String name, int sid);

    //更新吉他谱
    //update songs set number = 1, format = 'hehe' where id = 5;
    @Update("update songs set number = #{0}, format = #{1} where id = #{2}")
    int updGuitar(int number, String format, int id);

    //更新歌曲信息
    //update songs set name = 'aa', sid = 4, number=number, format=format where id = 5;
    @Update("update songs set name = #{0}, sid = #{1}, number=number, format=format where id = #{2}")
    int updSong(String name, int sid, int id);

    //分页查询
    List<Songs> selByPageSong(String name, int pageStart, int pageSize);
    //获取页数
    //@Select("select count(*) from songs s left join singers on s.sid = singers.id where ")
    int selPageCount(String name);

}
