<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/21
  Time: 下午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        function changeCode() {
            var src = " getVerifyCode?" + new Date().getTime(); //加时间戳，防止浏览器利用缓存
            $('#code').attr("src", src);
        }

    </script>
    <script>
        var valids = [false, false, false];
        $(document).ready(function name(params) {

            $("#name").blur(function name(params) {
                var name = $("#name").val();
                $("#name_info").show();
                valids[0] = confirm_input(name, 0);
                if (valids[0] == false) {
                    $("#name_info").text("输入错误(2-16位,只能由字母，数字，中文组成)");
                    $("#name_info").addClass("text-danger");
                    $("#name_info").removeClass("text-success");
                } else {
                    $("#name_info").text("输入正确");
                    $("#name_info").removeClass("text-danger");
                    $("#name_info").addClass("text-success");
                }
            })

            $("#password").blur(function name(params) {
                var password = $("#password").val();
                $("#password_info").show();
                valids[1] = confirm_input(password, 1);
                if (valids[1] == false) {
                    $("#password_info").text("输入错误(2-16位,只能由字母，数字组成)");
                    $("#password_info").addClass("text-danger");
                    $("#password_info").removeClass("text-success");
                } else {
                    $("#password_info").text("输入正确");
                    $("#password_info").removeClass("text-danger");
                    $("#password_info").addClass("text-success");
                }
            })

            $("#confirm").blur(function name(params) {
                var password = $("#password").val();
                var comfirm_p = $("#confirm").val();
                $("#confirm_info").show();
                valids[2] = (password == comfirm_p && password.length != 0);
                if (valids[2]) {
                    $("#confirm_info").text("输入正确");
                    $("#confirm_info").removeClass("text-danger");
                    $("#confirm_info").addClass("text-success");

                } else {
                    $("#confirm_info").text("输入错误(必须与密码相同)");
                    $("#confirm_info").addClass("text-danger");
                    $("#confirm_info").removeClass("text-success");
                }
            })

        })

        function varify() {
            for (var i = 0; i < valids.length; i++) {
                if (valids[i] == false) {
                    return false;
                }
            }
            return true;
        }
        function confirm_input(str, number) {
            var reg = /^[a-zA-Z0-9_]{2,16}$/;
            var reg_ch = /^[a-zA-Z0-9_\u4e00-\u9fa5]{2,16}$/;
            var result = reg.test(str);
            //若为用户名字符串
            if (number == 0) {
                result = reg_ch.test(str);
            }
            return result;
        }

        function reg() {
            if (varify()){
                $(this).submit();
            }else {
                alert("您的输入有误");
                return false;
            }
        }

    </script>
</head>
<body>
<div class="row">
    <div class="col-xs-0 col-sm-1 col-md-1 col-lg-1">
    </div>
    <div class="col-xs-2 col-sm-3 col-md-3 col-lg-3">
        <img src="images/icons/guitar.jpeg" class="img-circle" alt="吉他图标" height="70px" width="70px">
    </div>
    <div class="">

    </div>
    <div class="col-xs-0 col-sm-4 col-md-4 col-lg-4 pull-right">
        <h2 class=" text-warning"><a href="main">返回主页</a></h2>
    </div>

</div>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle
                        navigation
                    </span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><span class="text-success">吉他谱分享</span></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">

            <li class="dropdown">
                <a href="/mess/show" class="dropdown-toggle " data-toggle="dropdown"><span
                        class="text-danger">留言板</span><strong
                        class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="/mess/show">默认留言板</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <strong><span class="text-primary">关于站长</span></strong>
                    <strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="https://node.kg.qq.com/personal?uid=65949a8622243183"><span class="text-success">进入站长的全民k歌</span></a>
                    </li>
                    <li>
                        <a href="#" id="call"><span class="text-primary">联系站长(微信:wzLikeMusicAndHack)</span></a>
                    </li>
                    <li>
                        <a href="#"><span class="text-warning">站长单身，性取向正常，喜欢学习，爱好计算机，音乐，心理学，目前仍在奋斗中</span></a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="http://www.baidu.com"><span class="text-danger">退出</span></a>
                    </li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-left" role="search" action="result_page" method="post">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="请输入歌曲名或歌手名"/>
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>

        <%
            Object object = session.getAttribute("user");
            if (object != null) {
        %>

        <a href="/user_info?name=${sessionScope.user.name}">
            <img class="img-circle navbar-right"
                 src="images/users/photo/${sessionScope.user.photo}" width="50px" height="50px">
        </a>

        <% } else {%>
        <a href="/">
            <img class="img-circle navbar-right"
                 src="images/users/photo/null.jpg" width="50px" height="50px">
        </a>

        <%}%>

        <ul class="nav navbar-nav navbar-right">

            <li>
                <a href="/bookShow"><span class="text-warning">收藏夹</span></a>
            </li>
            <li>
                <a href="/go_modify"><span class="text-info">修改个人信息</span></a>
            </li>
            <li><a href="/LogOut"><span class="text-danger">退出</span></a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span>当前用户:</span>
                    <%
                        if (object == null) {
                    %>

                    <strong><span class="text-muted">请点击头像登录!</span></strong>

                    <%} else {%>
                    <strong><span class="text-success">${sessionScope.user.name}</span></strong>
                    <%}%>
                </a>
            </li>

        </ul>
    </div>
</nav>

<h3 class="text-center text-info">欢迎注册</h3>


<div class="col-xs-0 col-sm-4 col-md-4 col-lg-4">

</div>


<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    <form class="bs-example bs-example-form" role="form" method="post" action="reg">
        <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </span>
            <input autocomplete="off" id="name" required type="text" class="form-control"
                   placeholder="请输入用户名(2-16位,只能由字母，数字，中文组成)"
                   name="name"/>

        </div>
        <h5 id="name_info" hidden="true" class="text-danger"></h5>
        <br>
        <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-globe"></span>
                    </span>
            <input autocomplete="off" id="password" required type="password" class="form-control"
                   placeholder="请输入密码(2-16位,只能由字母，数字组成)" name="password"/>

        </div>
        <h5 id="password_info" hidden="true" class="text-danger"></h5>
        <br>
        <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-globe"></span>
                    </span>
            <input id="confirm" required autocomplete="off" type="password" class="form-control"
                   placeholder="请再次输入密码(必须和密码输入一致)"
                   name="password_confirm"/>
        </div>
        <h5 id="confirm_info" hidden="true" class="text-danger"></h5>
        <br>
        <div class="input-group">

            <input required name="validCode" placeholder="请输入验证码" autocomplete="off">
            <img id="code" onclick="changeCode()" src="getVerifyCode">

        </div>
        <br/>
        <div class="row">

            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <button onclick="reg()" class="btn btn-large btn-block btn-success">注册</button>
            </div>

        </div>
        <br>
    </form>
</div>
<div class="row navbar-fixed-bottom">
    <h5 class="text-center" style="color: black;">陕ICP备19025814</h5>
    <h6 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h6>
</div>
</body>
</html>
