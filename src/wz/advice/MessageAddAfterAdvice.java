package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;
import java.util.Date;

public class MessageAddAfterAdvice implements AfterReturningAdvice {

    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        Logger logger = Logger.getLogger(MessageAddAfterAdvice.class);
        //public int insMessage(int uid, String message, Date date, int bid)
        int uid = (int)objects[0];
        String message = (String)objects[1];
        if ((int) o != 0){
            logger.info(uid + "在" + new Date().toString() + "发表了留言:" + message);
        }else {
            logger.info(uid + "在" + new Date().toString() + "发表留言失败!");
        }
    }
}
