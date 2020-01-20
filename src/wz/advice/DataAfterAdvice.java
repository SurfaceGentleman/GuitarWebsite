package wz.advice;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;

public class DataAfterAdvice implements AfterReturningAdvice {
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
//        System.out.println("执行数据通知");
//        Logger logger = Logger.getLogger(DataAfterAdvice.class);
//        String str = "参数为：";
//        for (Object object : objects) {
//            str += object.toString() + " ";
//        }
//        logger.info("执行了：" + method);
//        logger.info(str);
    }
}
