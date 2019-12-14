package wz.mapper;

import org.apache.ibatis.annotations.Select;
import wz.pojo.Admin;

public interface AdminMapper {

    @Select("select * from admin where name=#{name} and password=#{password}")
    Admin selById(Admin admin);

}
