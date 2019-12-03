package wz.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Value;
import wz.pojo.Songs;

import java.util.List;

public interface SongsMapper {
    List<Songs> selBySid(int id);

    List<Songs> selByName(@Param("name") String name);
}
