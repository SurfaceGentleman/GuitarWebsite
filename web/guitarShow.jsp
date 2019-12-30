<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/11/30
  Time: 下午7:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {

            var page_number = '<%=request.getAttribute("pages")%>';
            page_number = parseInt(page_number);
            for (var i = 1; i <= page_number; i++) {
                var path = "songs/<%=request.getAttribute("id")%>/music/<%=request.getAttribute("id")%>_" + i + ".<%=request.getAttribute("format")%>";
                $("#pages").append("<img class='img-responsive' src=" + path + ">");
            }

        })
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
            <li>
                <a href="#">建设ing</a>
            </li>
            <li>
                <a href="#"><span class="text-primary">用户相关功能(正在建设)</span></a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle " data-toggle="dropdown"><span class="text-danger">留言板(即将上线)</span><strong
                        class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">Action</a>
                    </li>
                    <li>
                        <a href="#">Another action</a>
                    </li>
                    <li>
                        <a href="#">Something else here</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">Separated link</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">One more separated link</a>
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


        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">建设ing</a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <strong><span class="text-primary">关于我</span></strong>
                    <strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="https://node.kg.qq.com/personal?uid=65949a8622243183"><span class="text-success">进入站长的全民k歌</span></a>
                    </li>
                    <li>
                        <a href="#" id="call"><span class="text-primary">联系站长</span></a>
                    </li>
                    <li>
                        <a href="#"><span class="text-warning">站长单身，但不谈对象，性取向正常，仍在奋斗中</span></a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="http://www.baidu.com"><span class="text-danger">退出</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>


<div class="row">


    <div class="col-xs-0 col-sm-2 col-md-2 col-lg-2">

    </div>

    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" id="pages">
        <%--        <img src="/songs/<%=request.getAttribute("path")%>/<%=request.getAttribute("path")%>1.jpg" class="img-responsive" alt="Image">--%>
        <%--    </div>--%>
    </div>


</div>


</body>

</html>