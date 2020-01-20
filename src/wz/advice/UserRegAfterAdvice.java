package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;
import java.util.Date;

public class UserRegAfterAdvice implements AfterReturningAdvice {
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        //int insUser(String name, String password, String ip);
        Logger logger = Logger.getLogger(UserRegAfterAdvice.class);

        String name = (String) objects[0];
        String password = (String) objects[1];
        String ip = (String) objects[2];
        if ((int) o != 0){
            logger.info(name + "在" + new Date().toString() + "注册了账号, ip地址:" + ip);
        }else {
            logger.info(name + "在" + new Date().toString() + "注册失败, ip地址:" + ip);
        }



    }
}
