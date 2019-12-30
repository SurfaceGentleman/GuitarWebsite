<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/12
  Time: 下午7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>

        $(document).ready(function () {
            var pageSize = 12;
            var pageNumber = 1;
            var name = '<%=request.getAttribute("name")%>';
            $("#call").click(function () {
                alert("请先在首页绕过前端！");
                return false;
            })
            $.ajax({
                //
                url: "page_search",
                data: {name: name, pageSize: pageSize, pageNumber: pageNumber},
                type: "post",

                dataType: "json",

                success: function (data) {
                    $("#page_info").html("(每页显示" + pageSize + "条，共" + data["PageInfo"]["total"] +"页，当前在第"+ pageNumber +"页)");
                    for (var i = 0; i < data["PageInfo"]["list"].length; i++) {
                        var songs_name = "<td><strong>" + data["PageInfo"]["list"][i]["name"] + "</strong></td>";
                        var songs_sname = "<td>" + data["PageInfo"]["list"][i]["sname"] + "</td>";
                        var songs_view = "<td><a class='btn btn-primary' href=page?id=" + data["PageInfo"]["list"][i]["id"] + "&pages=" + data["PageInfo"]['list'][i]['number'] + "&format=" + data["PageInfo"]['list'][i]['format'] + ">查看</a>" + "</td>";
                        var songs_download = "<td><a class='btn btn-success'>下载</a></td>";
                        $("#result").append("<tr>" + songs_name + songs_sname + songs_view + songs_download + "</tr>");

                    }

                    for (var i = 1; i <= data["PageInfo"]["total"]; i++) {
                        if (1 == i) {
                            $("#page").append("<li class='active'><a href='#'>" + i + "</a></li>");
                        } else {
                            $("#page").append("<li><a href='#'>" + i + "</a></li>");
                        }

                    }
                    //$("#current").text("共" + data["PageInfo"]["total"] + "页");
                    $("#current").html("共<big class='text-warning'>" + data["PageInfo"]["total"] + "</big>页");
                    //显示分页菜单
                    $("ul li").click(function () {
                        pageNumber = $(this).text();
                        $(this).addClass('active');
                        $(this).siblings().removeClass('active');

                        $.ajax({
                            //
                            url: "page_search",
                            data: {name: name, pageSize: pageSize, pageNumber: pageNumber},
                            type: "post",

                            dataType: "json",

                            success: function (data) {
                                $("#result").empty();
                                for (var i = 0; i < data["PageInfo"]["list"].length; i++) {
                                    var songs_name = "<td class='text-danger'>" + data["PageInfo"]["list"][i]["name"] + "</td>";
                                    var songs_sname = "<td>" + data["PageInfo"]["list"][i]["sname"] + "</td>";
                                    var songs_view = "<td><a class='btn btn-primary' href=page?id=" + data["PageInfo"]["list"][i]["id"] + "&pages=" + data["PageInfo"]['list'][i]['number'] + "&format=" + data["PageInfo"]['list'][i]['format'] + ">查看</a>" + "</td>";
                                    var songs_download = "<td><a class='btn btn-success'>下载</a></td>";

                                    $("#result").append("<tr>" + songs_name + songs_sname + songs_view + songs_download + "</tr>");
                                }
                                $("#page_info").html("(每页显示" + pageSize + "条，共" + data["PageInfo"]["total"] +"页，当前在第"+ pageNumber +"页)");

                            },

                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                document.write("error");
                                document.write(XMLHttpRequest.status);
                                document.write(XMLHttpRequest.readyState);
                                document.write(textStatus);
                            }

                        })
                    })


                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    document.write("error");
                    document.write(XMLHttpRequest.status);
                    document.write(XMLHttpRequest.readyState);
                    document.write(textStatus);
                }

            });


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
                <a href="" class="dropdown-toggle" data-toggle="dropdown">
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

<div class="container">
    <h3>与<span class="text-success">"<%=request.getAttribute("name")%>"</span>相关的搜索结果</h3>
    <h5 class="text-danger" id="page_info"></h5>
</div>

<br>

<div class="container">
    <table class="table table-hover">
        <thead>
        <tr class="text-warning">
            <th>歌曲名</th>
            <th>歌手</th>
            <th>吉他谱</th>
            <th>音乐资源</th>
        </tr>
        </thead>
        <tbody id="result">
        </tbody>
    </table>
</div>

<div class="container">

    <div class="row">

        <ul class="pagination" id="page" style="padding-left: 2%">
            <li><a href="">页码：</a></li>
        </ul>
    </div>
</div>
</body>
</html>
