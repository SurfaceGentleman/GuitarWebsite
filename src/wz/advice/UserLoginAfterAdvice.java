package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;
import wz.pojo.Users;

import java.lang.reflect.Method;
import java.util.Date;

public class UserLoginAfterAdvice implements AfterReturningAdvice {
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        Logger logger = Logger.getLogger(UserLoginAfterAdvice.class);
        String name = (String)objects[0];
        String password = (String)objects[1];
        if (o != null) {
            logger.info(name + "在" + new Date().toString() + "登陆成功");
        } else {
            logger.info(password + "在" + new Date().toString() +  "登陆失败");
        }
    }
}
