package wz.filter;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


public class JspFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        Logger logger = Logger.getLogger(JspFilter.class);
        String url = httpServletRequest.getRequestURI();
        if(url != null && url.endsWith(".jsp")) {

            logger.info(new Date().toString() + "有人试图直接访问jsp页面，访问的资源为：" + url);
            httpServletResponse.sendError(403, "您的操作有误(手动微笑)");
            return;
        }
        //拦截所有包含php的请求
        if(url != null && url.contains("php")){
            httpServletResponse.sendError(403, "gun！");
            logger.info(new Date().toString() + "拦截了php字符串:" + url);
            request.setAttribute("forbid", "true");
            httpServletResponse.sendError(403, "您的操作有误(手动微笑)");
            return;
        }
        //拦截所有非法用户
        if (((HttpServletRequest) request).getSession().getAttribute("forbid") != null){
            httpServletResponse.sendError(403, "您已被禁止访问");
            return;
        }


        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
