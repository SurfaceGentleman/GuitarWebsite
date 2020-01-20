package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.MessageMapper;
import wz.pojo.Message;
import wz.pojo.PageInfo;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class MessageService {

    @Resource
    private MessageMapper messageMapper;

    public int insMessage(int uid, String message, Date date, int bid) {
        return messageMapper.insMessage(uid, message, date, bid);
    }
    //test
    public List<Message> show(){
        return messageMapper.selAll();
    }
    //获得总数

    //分页浏览
    public PageInfo pageShow(int pageSize, int pageNumber){
        PageInfo pi = new PageInfo();
        int total = messageMapper.selCount();
        List<Message> list = messageMapper.selByPage(pageSize * (pageNumber - 1), pageSize);
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setList(list);
        pi.setTotal(total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
        System.out.println(pi);
        return pi;
    }
}
