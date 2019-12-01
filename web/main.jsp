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
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        #myCarousel .carousel-inner>.item>img {
            display: block;
            width: 100%;
            height: 270px;
        }
    </style>
</head>

<body>


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

<nav class="navbar navbar-default " role="navigation">
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
                <a href="#"><span class="text-danger">热门曲谱</span></a>
            </li>
            <li>
                <a href="#" class="text-danger"><span class="text-primary">热门歌手</span></a>
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
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="请输入歌手名或歌曲名" />
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>


        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">Link</a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">关于我<strong class="caret"></strong></a>
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


<br />


<div class="container">
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
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
                        <img src="images/轮播图/43ce832f60e22653e3721793be6d812f.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="images/轮播图/cdf3b58923f9f4e71a78266862c1cd60.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="images/轮播图/5da9a2977c4d8.jpg" alt="Third slide">
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





        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

            <div class="well">
                <h2 class="text-success">关于本站</h2>
                <p class="lead">
                    本站仅用作个人使用，若有侵权，请立即联系，本人将在第一时间删除相关资源。给您带来的不便，请谅解。
                </p>
                <blockquote>
                    <p>
                        Men is two men, one is awake in darkness,the other is asleep in light - Gibran
                    </p>
                </blockquote>

            </div>

        </div>
    </div>
</div>





<br />

<div class="container">


    <div class="row">
        <h4 class="text-danger">热门曲谱</h4>
    </div>


    <div class="row">
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/songs/家乡.jpg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>家乡</h3>
                    <p>赵雷</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">
                            查看曲谱
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/songs/听妈妈的话.jpg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>听妈妈的话</h3>
                    <p>周杰伦</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">
                            查看曲谱
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div href="#" class="thumbnail">
                <img src="images/icons/guitar.jpeg" class="img-circle" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>歌曲名</h3>
                    <p>歌手名</p>
                    <p>
                        <a href="#" class="btn btn-primary" role="button">
                            按钮
                        </a>
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>



<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-lg-offset-4  navbar-fixed-bottom">
    <div class="row">

        <div class="media">

            <div class="media-heading text-center">
                <audio controls="controls" autoplay="autoplay">
                    <source src="musics/鷺巣詩郎 - never meant to belong.mp3" type="audio/mp3">
                </audio>
            </div>
        </div>
    </div>


</div>

<div class="row bg-primary">
    <h4 class="text-center">Powered by:<span>SurfaceGentleman</span> All Rights Reserved</h4>
</div>
</body>

</html>
