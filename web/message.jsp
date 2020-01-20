<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2020/1/15
  Time: 上午11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>留言板</title>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
    <div class="col-xs-0 col-sm-1 col-md-1 col-lg-1">
    </div>
    <div class="col-xs-2 col-sm-3 col-md-3 col-lg-3">
        <img src="../images/icons/guitar.jpeg" class="img-circle" alt="吉他图标" height="70px" width="70px">
    </div>
    <div class="">

    </div>
    <div class="col-xs-0 col-sm-4 col-md-4 col-lg-4 pull-right">
        <h2 class=" text-warning"><a href="/main">SurfaceGentleman.info</a></h2>
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
        <form class="navbar-form navbar-left" role="search" action="/result_page" method="post">
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
                 src="../images/users/photo/${sessionScope.user.photo}" width="50px" height="50px">
        </a>

        <% } else {%>
        <a href="/">
            <img class="img-circle navbar-right"
                 src="../images/users/photo/null.jpg" width="50px" height="50px">
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
<h3 class="text-center text-primary">留言板</h3>

<div class="container">

    <c:forEach var="m" items="${PageInfo.list}">
        <c:if test="${m.status == 0}">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <img class="img-circle" src="../images/users/photo/${m.photo}" width="50px"
                             height="50px"/>
                    </div>

                    <div class="col-lg-pull-1 col-xs-7 col-sm-4 col-md-4 col-lg-4 pull-left">
                        <h4 class="text-success"><a class="text-success" href="../user_info?name=${m.name}">${m.name}</a>&nbsp;
                            <c:if test="${m.vip < 1}">
                                <small class="label label-default">vip(未拥有)</small>
                            </c:if>
                            <c:if test="${m.vip == 1}">
                                <small class="label label-success">vip${m.vip}</small>
                            </c:if>
                            <c:if test="${m.vip == 2}">
                                <small class="label label-primary">vip${m.vip}</small>
                            </c:if>
                            <c:if test="${m.vip == 3}">
                                <small class="label label-info">vip${m.vip}</small>
                            </c:if>
                            <c:if test="${m.vip == 4}">
                                <small class="label label-warning">vip${m.vip}</small>
                            </c:if>
                            <c:if test="${m.vip == 5}">
                                <small class="label label-danger">vip${m.vip}(这是站长)</small>
                            </c:if>
                        </h4>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p><strong>${m.content}
                        </strong>
                        </p>
                    </div>
                </div>

                <div class="row">

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <span class="text-muted">第${m.id}楼</span>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <span class="text-muted pull-right">发表日期:
                        <fmt:formatDate value="${m.time}" pattern="yyyy-MM-dd HH:mm:ss" />
                    </span>
                    </div>
                </div>
                <hr>
            </div>
        </c:if>
        <c:if test="${m.status != 0}">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <img class="img-circle" src="../images/users/photo/${m.photo}" width="50px"
                             height="50px"/>
                    </div>

                    <div class="col-lg-pull-1 col-xs-7 col-sm-4 col-md-4 col-lg-4 pull-left">
                        <h4 class="text-danger"><a class="text-danger" href="../user_info?name=${m.name}">${m.name}</a>&nbsp;

                                <small>（该用户已被系统禁言）</small>

                        </h4>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="lead"><strong class="text-danger">××××××××××××××××××××××××××××××××××××××××××××××××
                        </strong>
                        </p>
                    </div>
                </div>

                <div class="row">

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <span class="text-muted">第${m.id}楼</span>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <span class="text-muted pull-right">发表日期:
                        <fmt:formatDate value="${m.time}" pattern="yyyy-MM-dd HH:mm:ss" />
                    </span>
                    </div>
                </div>
                <hr>
            </div>
        </c:if>

    </c:forEach>

    <div class="row center-block">
        <ul class="pagination">
            <li><a href="show?pageNumber=${PageInfo.pageNumber-1}&pageSize=${PageInfo.pageSize}"
                    <c:if
                            test="${PageInfo.pageNumber<=1}"> onclick="javacript:return false;"</c:if>>&laquo;</a></li>
            <c:forEach end="${PageInfo.total}" var="i" begin="1" step="1">
                <li><a href="show?pageNumber=${i}">${i}</a></li>
            </c:forEach>
            <li><a href="show?pageNumber=${PageInfo.pageNumber+1}&pageSize=${PageInfo.pageSize}"
                    <c:if
                            test="${PageInfo.pageNumber>=PageInfo.total}"> onclick="javacript:return false;" </c:if>>&raquo;</a></li>
            <li><span>共${PageInfo.total}页，当前在第${PageInfo.pageNumber}页</span></li>
        </ul>

    </div>

    <form action="ins" method="post">
        <h4>请输入您的留言</h4>
        <textarea name="message" id="commit" class="form-control" rows="3" required="required"></textarea>
        <input type="hidden" name="bid" value="1">
        <button type="submit" class="btn btn-success">提交</button>
    </form>

</div>
<br/>
<div class="row bg-primary">
    <h5 class="text-center" style="color: black;">陕ICP备19025814</h5>
    <h6 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h6>
</div>
</body>
</html>
