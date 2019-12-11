<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/11/30
  Time: 下午5:40
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

        })
    </script>

</head>

<body>
<!--
首页布局
-->
<div class="row">

    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
    </div>

    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <img src="images/icons/guitar.jpeg" class="img-circle" alt="吉他图标" height="70px" width="70px">
    </div>

    <div class="">
    </div>

    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pull-right">
        <h2 class=" text-warning">wz.com</h2>
    </div>
</div>

<div class="row">
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
                    <a href="#">施工ing</a>
                </li>
                <li>
                    <a href="#">施工ing</a>
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

            <form class="navbar-form navbar-left" role="search" action="result" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control"/>
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
                            <a href="#"><span class="text-primary">联系站长</span></a>
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
</div>


<div class="container">
    <div class="row">

        <div class="col-xs-0 col-sm-4 col-md-4 col-lg-4">

        </div>

        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <div class="form-group">
                <div style="padding: 30px 30px 10px;">
                    <form class="bs-example bs-example-form" role="form" method="post" action="/login">
                        <fieldset  id="disable" disabled>
                            <div class="input-group">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span>
                                <input type="text" class="form-control" placeholder="请输入用户名" name="name"/>
                            </div>
                            <br>
                            <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-globe"></span>
                                    </span>
                                <input type="text" class="form-control" placeholder="请输入密码" name="password"/>
                            </div>
                            <br>
                            <div class="input-group">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-tree-conifer"></span></span>
                                <input type="text" class="form-control" placeholder="请输入验证码" name="code"/>
                            </div>
                            <br/>
                            <div class="row">

                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <button type="submit" class="btn btn-large btn-block btn-success">登录</button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <button type="button" class="btn btn-large btn-block btn-primary">注册新账号</button>
                                </div>

                            </div>
                            <br>
                        </fieldset>

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
                <p>
                    本站仅作为个人使用，还望上线后，各位黑客大佬们能高抬贵手，里面除了一些歌曲以及吉他谱之外，什么都没了。
                </p>
                <p class="text-warning">
                    目前用户相关功能仍处于测试阶段，请直接点击下方按钮，进入首页即可！
                </p>
                <p class="text-info">
                    即将上线的功能：用户注册/登录功能，曲谱收藏功能，留言板功能，评论区功能
                </p>
                <p>
                    <a class="btn btn-success btn-large" href="/main.jsp">进入首页</a>
                </p>

            </div>
        </div>
    </div>
    <div class="row clearfix">
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
                <a class="btn" href="main.jsp">View details »</a>
            </p>
        </div>
        <div class="col-md-4 column">
            <h2>
                Who care
            </h2>
            <p>
                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna
                mollis euismod. Donec sed odio dui.
            </p>
            <p>
                <a class="btn" href="main.jsp">View details »</a>
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
                <a class="btn" href="main.jsp">View details »</a>
            </p>
        </div>


    </div>
</div>
<div class="row bg-primary">
    <h4 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h4>
</div>
</body>

</html>
