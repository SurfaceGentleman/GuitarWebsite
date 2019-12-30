package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;
import wz.pojo.Admin;

import java.lang.reflect.Method;
import java.util.Date;

public class AdminLoginAfterAdvice implements AfterReturningAdvice {
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {

        Logger logger = Logger.getLogger(AdminLoginAfterAdvice.class);
        Admin admin = (Admin)objects[0];
        if (o != null) {
            logger.info(admin.getName() + "在" + new Date().toString() + "登陆成功");
        } else {
            logger.info(admin.getName() + "在" + new Date().toString() +  "登陆失败");
        }
    }
}
