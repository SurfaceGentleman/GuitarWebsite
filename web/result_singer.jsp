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
    <title>Document</title>
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
    <div class="col-xs-0 col-sm-2 col-md-2 col-lg-2 pull-right">
        <h2 class=" text-warning">wz.com</h2>
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
        <a class="navbar-brand" href="#"><span class="text-success">wz吉他网</span></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li>
                <a href="#">施工中</a>
            </li>
            <li>
                <a href="#">施工中</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong
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
        <form class="navbar-form navbar-left" role="search" action="/result" method="post">
            <div class="form-group">
                <input type="text" name="str" class="form-control" placeholder="请输入歌曲名或歌手名"/>
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>


        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">Link</a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">关于我<strong
                        class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#"><span class="text-primary">进入站长的全民k歌</span></a>
                    </li>
                    <li>
                        <a href="#" id="call"><span class="text-primary">联系站长</span></a>
                    </li>
                    <li>
                        <a href="#"><span class="text-primary">站长单身，但不谈对象，性取向正常，仍在奋斗中</span></a>
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
<div class="container">
    <div class="row">
        <h4 class="text-success">歌手相关吉他谱</h4>
    </div>

    <div class="row text-danger">
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
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <b>${s.name}</b>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    ${s.sname}
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <a href="/page?id=${s.id}&pages=${s.number}&format=${s.format}">查看曲谱</a>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <a href="">下载</a>
            </div>
        </c:forEach>

        <hr>


    </div>

    <br/>
</div>
</div>


</body>

</html>