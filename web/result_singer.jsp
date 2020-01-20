<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/9
  Time: 下午7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>歌手曲谱</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
    <div class="row">
        <h4 class="text-success">歌手相关吉他谱</h4>
    </div>

    <div class="row ">
        <br/>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-primary">
            <b>歌曲名</b>
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-primary">
            歌手名
        </div>
        <br/>
        <c:forEach items="${songs}" var="s">
            <hr>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <b>${s.name}</b>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        ${s.sname}
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <a href="page?id=${s.id}&pages=${s.number}&format=${s.format}">查看曲谱</a>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <a href="/bookins?sid=${s.id}" class="text-warning">收藏</a>
                </div>
            </div>
        </c:forEach>

        <hr>


    </div>

    <br/>
</div>
</div>


</body>

</html>
