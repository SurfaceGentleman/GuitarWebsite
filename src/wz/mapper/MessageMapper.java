package wz.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import wz.pojo.Message;

import java.util.Date;
import java.util.List;

public interface MessageMapper {
    //insert into messages values (default, 10001, '今天的天气不错哦', '2019-10-22', 1);
    @Insert("insert into messages values (default, #{0}, #{1}, #{2}, #{3})")
    int insMessage(int uid, String content, Date date, int bid);

    //测试查询
    @Select("select m.id, content, time, m.bid, name, u.vip, photo from messages m left join users u on m.uid = u.id")
    List<Message> selAll();

    //获取元素个数
    @Select("select count(*) from messages")
    int selCount();

    //分页查询
    @Select("select m.id, content, time, m.bid, name, u.vip, photo , status from messages m left join users u on m.uid = u.id limit #{0}, #{1}")
    List<Message> selByPage(int pageStart, int pageSize);

}
