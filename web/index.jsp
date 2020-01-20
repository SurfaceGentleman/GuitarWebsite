<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2020/1/13
  Time: 下午5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>

    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script>
        function changeCode() {
            var src = " getVerifyCode?" + new Date().getTime(); //加时间戳，防止浏览器利用缓存
            $('#code').attr("src", src);
        }
    </script>
</head>

<body>
<!--
首页布局
-->
<div class="row">
    <div class="col-xs-0 col-sm-1 col-md-1 col-lg-1">
    </div>
    <div class="col-xs-2 col-sm-3 col-md-3 col-lg-3">
        <img src="images/icons/guitar.jpeg" class="img-circle" alt="吉他图标" height="70px" width="70px">
    </div>
    <div class="">

    </div>
    <div class="col-xs-0 col-sm-4 col-md-4 col-lg-4 pull-right">
        <h2 class=" text-warning"><a href="main">SurfaceGentleman.info</a></h2>
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


<div class="container">
    <c:if test="${not empty info}">
        <h2 class="text-center text-warning">
                ${info}
        </h2>
    </c:if>
    <h3 class="text-center text-primary">欢迎登陆(如有密码遗失，请联系站长qq:1226568176)</h3>
    <div class="row">

        <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3">

        </div>

        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <div class="form-group">
                <div style="padding: 30px 30px 10px;">
                    <form class="bs-example bs-example-form" role="form" method="post" action="login">

                        <div class="input-group">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span>
                            <input type="text" required class="form-control" placeholder="请输入用户名" name="name"/>
                        </div>
                        <br>
                        <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-globe"></span>
                                    </span>
                            <input type="password" required class="form-control" placeholder="请输入密码" name="password"/>
                        </div>
                        <br>
                        <div class="input-group">

                            <input required name="validCode" placeholder="请输入验证码" autocomplete="off">
                            <img id="code" onclick="changeCode()" src="getVerifyCode">
                        </div>
                        <br/>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <button type="submit" class="btn btn-large btn-block btn-success">登录</button>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <a class="btn btn-large btn-block btn-primary" href="go_reg">注册新账号</a>
                            </div>

                        </div>
                        <br>
                    </form>
                </div>

            </div>


        </div>
    </div>
</div>


<div style="height: 20px;">

</div>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

            <div class="jumbotron">
                <h2 class="text-primary">
                    欢迎访问本站
                </h2>

                <p class="text-warning">
                    目前用户相关功能已开放，如果遇到问题请联系站长(qq:1226568176)！
                </p>
                <p>
                    <a class="btn btn-success btn-lg" href="main">进入首页(游客模式)</a>
                </p>
                <p class="text-info">
                    已上线的功能：曲谱收藏功能，留言板功能
                </p>
                <p>
                    本站仅作为个人使用，还望上线后，各位黑客大佬们能高抬贵手，里面除了一些歌曲以及吉他谱之外，什么都没了。
                </p>
            </div>
        </div>
    </div>
    <div class="row clearfix">

        <div class="col-md-4 column">
            <h2>
                留言板
            </h2>
            <p>
                欢迎给站长留言哦！
            </p>
            <p>
                我深深地恋慕着你，甚至超出了自己的想象，因此每当遇见你，便陷入窒息般的痛苦中
            </p>
            <p>
                <a class="btn" href="main">进入主页</a>
            </p>
        </div>
        <div class="col-md-4 column">
            <h2>
                最新吉他谱
            </h2>
            <p>
                请点击“进入首页”按钮进行访问
            </p>
            <p>
                <a class="btn" href="main">进入主页</a>
            </p>
        </div>
        <div class="col-md-4 column">
            <h2>
                茨威格《断头王后》
            </h2>
            <p>
                She was still too young to know that life never gives anything for nothing, and that a price is always
                exacted for what fate bestows.
            </p>
            <p>
                她那时候还太年轻,不知道所有命运赠予的礼物,早已在暗中标好了价格.
            </p>
            <p>
                <a class="btn" href="main">进入主页</a>
            </p>
        </div>
    </div>
</div>
<div class="row bg-primary">
    <h5 class="text-center" style="color: black;">陕ICP备19025814</h5>
    <h6 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h6>
</div>

</body>

</html>
