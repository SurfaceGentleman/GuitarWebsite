package wz.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import wz.pojo.Bookmark;

import java.util.Date;
import java.util.List;

public interface BookMapper {

    @Delete("delete from bookmark where id=#{0}")
    int delBookmark(int id);

    @Insert("insert into bookmark values (null, #{0}, #{1}, #{2})")
    int insBookmark(int sid, Date date, int uid);

    List<Bookmark> selBookmarkByUserIdPage(int id, int pageStart, int pageSize);

    @Select("select count(*) from bookmark where uid = #{0}")
    int selCountByUid(int uid);

    @Select("select count(*)  from bookmark where uid=#{0} and sid=#{1}")
    int selByUidAndSid(int uid, int sid);


}
