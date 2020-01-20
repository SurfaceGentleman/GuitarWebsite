package wz.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import wz.pojo.Users;

public interface UsersMapper {

    @Insert("insert into users values(0,#{0},#{1},default,null,0,null,#{2},null)")
    int insUser(String name, String password, String ip);

    @Select("select * from users where name=#{0} and password=#{1}")
    Users selUsers(String name, String password);

    @Select("select * from users where name =#{0}")
    Users selByName(String name);

    @Update("update users set name=#{1}, password = #{2}, photo=#{3}, about=#{4} where id=#{0}")
    int updUser(int id, String name, String password_new, String photo, String about);

}
