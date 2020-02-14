<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/1
  Time: 下午2:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {

            $("#myCarousel").carousel({
                interval: 2000
            });

            $("#backMusic").mouseenter(function () {
                $(this).css({opacity: .4});
            })
            $("#backMusic").mousedown(function () {
                $(this).css({opacity: 1});
            })


            //处理主页相关数据
            $.ajax({
                //
                url: "hot",
                data: {},
                type: "post",

                dataType: "json",

                success: function (data) {

                    for (var i = 0; i < data["songs"].length; i++) {

                        var songs_name = "<div class='col-xs-3 col-sm-3 col-md-3 col-lg-3'><b>" + data["songs"][i]["name"] + "</b></div>";
                        var songs_sname = "<div class='col-xs-3 col-sm-3 col-md-3 col-lg-3'>" + "<a class='text-success' href='singer_song?id=" + data["songs"][i]["id"] + "'>" + data["songs"][i]["sname"] + "</a>" + "</div>";
                        var songs_view = "<div class='col-xs-3 col-sm-3 col-md-3 col-lg-3'><a href=page?id=" + data["songs"][i]["id"] + "&pages=" + data["songs"][i]["number"] + "&format=" + data['songs'][i]['format'] + ">查看</a>" + "</div>";
                        var songs_download = "<div class='col-xs-3 col-sm-3 col-md-3 col-lg-3'><a class='text-warning' href='bookins?sid=" +  + data['songs'][i]['id'] + "'>收藏</a></div>";
                        $("#songs").append("<div class='text-danger row'>" + songs_name + songs_sname + songs_view + songs_download + "</div><hr/>");

                    }

                    for (var i = 0; i < data["singers"].length; i++) {
                        var singers_name = data["singers"][i]["name"];
                        var singers_id = data["singers"][i]["id"];
                        var singers_photo = data["singers"][i]["photo"];
                        var dis_singers = "<div class='col-sm-2 col-xs-4'><div class='thumbnail'><img width='150px' height='150px' src='/images/singers/" + singers_photo + "' class='img-circle'><div class='caption'><h4 class='text-center'>" + singers_name + "</h4><p class='text-center'><a href=singer_song?id=" + singers_id + " class='btn btn-success'>查看</a></p></div></div></div>";
                        $("#singers").append(dis_singers);
                    }

                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("网络异常，请检查网络状况");
                    document.write(XMLHttpRequest.status);
                    document.write(XMLHttpRequest.readyState);
                    document.write(textStatus);
                }

            })
            //处理留言板相关数据
            $.ajax({
                //
                url: "board_show",
                data: {},
                type: "post",

                dataType: "json",

                success: function (data) {

                    for (var i = 0; i < data["boards"].length; i++) {
                        var id = data["boards"][i]["id"];
                        var photo = data["boards"][i]["photo"];
                        var title = data["boards"][i]["title"];
                        var detail = data["boards"][i]["detail"];
                        var dis_board = "<div class='col-sm-3 col-md-3 col-lg-3 col-xs-12'><div class='thumbnail'><img class='img-responsive' src='images/board/" + photo + "'" + "/><div class='caption'><h3>" + title + "</h3><p>" + detail + "</p><p><a href='mess/show' class='btn btn-success' role='button'>" + "进入</a></p></div></div></div>";
                        $("#board").append(dis_board);
                    }


                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("网络异常，请检查网络状况");
                    document.write(XMLHttpRequest.status);
                }

            })

        })
    </script>
    <style type="text/css">
        #myCarousel .carousel-inner > .item > img {
            display: block;
            width: 100%;
            height: 270px;
        }
    </style>
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
<br/>


<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/轮播图/5da9a2977c4d8.jpg" alt="Third slide">

                    </div>
                    <div class="item">
                        <img href="" src="images/轮播图/cdf3b58923f9f4e71a78266862c1cd60.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img href="" src="images/轮播图/43ce832f60e22653e3721793be6d812f.jpg" alt="First slide">

                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

            <div class="well">
                <h3 class="text-success">关于本站</h3>
                <p class="lead">
                    本站的前端，后端，数据库模块均由本人编写。若使用时遇到了问题,或者有改进意见,欢迎到<a href="/mess/show" class="text-danger">留言板</a>反馈，站长联系方式在菜单栏中。
                </p>
                <blockquote>
                    <p>
                        万分感谢帮忙提供UI建议,功能测试,鼓励我的大伙伴们。
                    </p>
                </blockquote>
            </div>

        </div>
    </div>
</div>


<br/>

<div class="container">


    <div class="row">
        <h4 class="text-danger">热门歌手</h4>

    </div>


    <div class="row" id="singers">

    </div>

    <div class="row" id="songs">
        <h4 class="text-success">热门曲谱</h4>
        <hr/>
    </div>
    <br>
    <br>
    <div class="row" id="board">
        <h4 class="text-primary">留言板</h4>
        <hr/>
    </div>
    <br>
    <div class="row">
        <h4 class="text-primary">收藏夹</h4>
        <hr/>

        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12">
            <div class="thumbnail">
                <img class="img-responsive" src="images/book/樱桃.svg">
                <div class="caption">
                    <h3>收藏夹</h3>
                    <p>这是您的收藏夹！</p>
                    <p>
                        <a href="/bookShow" class="btn btn-success" role="button">
                            进入
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</div>


<br/>
<div class="row bg-primary">
    <h5 class="text-center" style="color: black;">陕ICP备19025814</h5>
    <h6 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h6>
</div>
</body>

</html>
