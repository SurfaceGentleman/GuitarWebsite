package wz.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import wz.pojo.Users;
import wz.service.UsersService;
import wz.util.IpUtil;
import wz.util.VerifyCodeUtil;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.regex.Pattern;

@Controller
public class UserController {

    @Resource
    private UsersService usersService;




    @RequestMapping("LogOut")
    public String userQuit(HttpServletRequest request) {
        request.getSession().setAttribute("user", null);
        return "redirect:/";
    }

    //注册功能
    @RequestMapping("reg")
    public String reg(HttpServletRequest request, String name, String password, String password_confirm, @RequestParam(defaultValue = "") String validCode) {
        //验证码检测
        String code = (String) request.getSession().getAttribute("code");

        if (VerifyCodeUtil.validCode(request, code)) {
            System.out.println("验证码正确");
        } else {
            System.out.println("错误");
            return "error.jsp";
        }

        System.out.println(name + ":" + password + password_confirm);

        //获取ip地址
        String ip = IpUtil.getIpAddr(request);

        //用户输入检测,正则表达式匹配
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9]{2,16}$");
        Pattern patternCh = Pattern.compile("^[a-zA-Z0-9\\u4e00-\\u9fa5]{2,16}$");
        if (patternCh.matcher(name).find() && pattern.matcher(password).find() && password.equals(password_confirm)) {
            if (usersService.selByName(name) != null) {
                request.setAttribute("info", "用户名已被使用！");
                return "index.jsp";
            }
            int insResult = usersService.insUsers(name, password, ip);
            System.out.println("符合规范");
            request.setAttribute("info", "注册成功");
            return "index.jsp";
        } else {
            request.setAttribute("info", "注册失败！您的输入有误");
            System.out.println("不符合规范");
            return "index.jsp";
        }

    }

    @RequestMapping("login")
    public String login(HttpServletRequest request, String name, String password, @RequestParam(defaultValue = "") String validCode) {
        //验证码检测
        String code = (String) request.getSession().getAttribute("code");
        if (VerifyCodeUtil.validCode(request, validCode)) {
            System.out.println("验证码正确");
        } else {
            System.out.println("错误");
            request.setAttribute("error", "验证码错误！");
            return "error.jsp";
        }
        Users user = usersService.UserLogin(name, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
        } else {
            request.setAttribute("error", "用户名或密码不存在！");
            return "error.jsp";
        }


        return "redirect:main";
    }

    @RequestMapping("getVerifyCode")
    public void getVerificationCode(HttpServletResponse response, HttpServletRequest request) {
        try {
            int width = 200;
            int height = 69;
            BufferedImage verifyImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            //生成对应宽高的初始图片
            String randomText = VerifyCodeUtil.drawRandomText(width, height, verifyImg);
            //单独的一个类方法，出于代码复用考虑，进行了封装。
            //功能是生成验证码字符并加上噪点，干扰线，返回值为验证码字符
            request.getSession().setAttribute("code", randomText);
            response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别
            OutputStream os = response.getOutputStream(); //获取文件输出流
            ImageIO.write(verifyImg, "png", os);//输出图片流
            os.flush();
            os.close();//关闭流

        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    @RequestMapping("user_info")
    public String userInfo(HttpServletRequest request, @RequestParam(defaultValue = "") String name) {
        Users user = usersService.selByName(name);
        if (null == user) {
            request.setAttribute("error", "该用户不存在！并且您已被禁止访问(微笑)，正常操作一定是不会走到这的");
            request.getSession().setAttribute("forbid", "true");
            return "error.jsp";
        } else {
            request.setAttribute("user", user);
            return "info.jsp";
        }
    }

    @RequestMapping("user_modify")
    public String updUser(HttpServletRequest request, HttpServletResponse response, String name, String password, String password_new, MultipartFile photo, String about) throws IOException {

        //判断是否有session
        System.out.println(request.getSession().getAttribute("user"));
        if (request.getSession().getAttribute("user") == null) {
            System.out.println("hehe");
            request.setAttribute("error", "您尚未登录！");
            return "error.jsp";
        }
        Users user = (Users) request.getSession().getAttribute("user");


        //验证输入合法性
        //用户输入检测,正则表达式匹配
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9]{2,16}$");
        Pattern patternCh = Pattern.compile("^[a-zA-Z0-9\\u4e00-\\u9fa5]{2,16}$");
        if (patternCh.matcher(name).find() && pattern.matcher(password_new).find()) {

            System.out.println("符合规范");
            //判断用户是否存在
            System.out.println(user.getPassword() + password);

            if (user.getPassword().equals(password)) {
                //验证图片
                String fileName = photo.getOriginalFilename();
                String suffix = fileName.substring(fileName.lastIndexOf("."));
                String path = request.getServletContext().getRealPath("images/users/photo/") + user.getId() + suffix;
                if (suffix.equalsIgnoreCase(".png") || suffix.equalsIgnoreCase(".jpeg") || suffix.equalsIgnoreCase(".gif") || suffix.equalsIgnoreCase(".jpg")) {
                    FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path));
                } else {
                    request.setAttribute("error", "您上传的图片有误!");
                    return "error.jsp";
                }
                usersService.updUser(user.getId(), name, password_new, user.getId() + suffix, about);
                Users users = usersService.selByName(user.getName());
                request.getSession().setAttribute("user", null);
                request.setAttribute("info", "修改成功，请重新登录");
            } else {
                request.setAttribute("error", "您的密码输入有误！");
                return "error.jsp";
            }
            return "index.jsp";
        } else {
            request.setAttribute("error", "您的新密码输入有误！");
            return "error.jsp";
        }
    }

}