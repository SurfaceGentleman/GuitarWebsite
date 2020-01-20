package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;
import java.util.Date;

public class UserModifyAfterAdvice implements AfterReturningAdvice {
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        //public int updUser(int id, String name, String password_new, String photo, String about)
        String name = (String) objects[1];
        String about = (String) objects[4];
        Logger logger = Logger.getLogger(UserModifyAfterAdvice.class);
        int result = (int) o;

        logger.info(name + "在" + new Date().toString() + "更新了资料:" + about);


    }
}
