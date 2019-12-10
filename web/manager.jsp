<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/4
  Time: 下午10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
        $(document).ready(function name(params) {
            $.ajax({
                //
                url: "/all",
                data: {},
                type: "post",

                dataType: "json",

                success: function (data) {

                    for (var i = 0; i < data["songs"].length; i++) {

                        var songs_name = "<td>" + data["songs"][i]["name"] + "</td>";
                        var songs_id = "<td>" + data["songs"][i]["id"] + "</td>";
                        var songs_sid = "<td>" + data["songs"][i]["sid"] + "</td>";
                        var songs_number = "<td>" + data["songs"][i]["number"] + "</td>";
                        var songs_del = "<td><a class='btn btn-danger' href=/del_song?id=" + data["songs"][i]["id"] + ">删除</a>" + "</td>";
                        var songs_format = "<td>" + data["songs"][i]["format"] + "</td>";
                        var songs_change = "<td><a class='btn btn-info' href=/change_song?id=" + data["songs"][i]["id"] + ">修改</a>" + "</td>";
                        $("#songs").append("<tr>" + songs_id + songs_name + songs_sid + songs_number + songs_format + songs_del + songs_change + "</tr>");

                    }

                    for (var i = 0; i < data["singers"].length; i++) {
                        var singers_name = "<td>" + data["singers"][i]["name"] + "</td>";
                        var singers_id = "<td>" + data["singers"][i]["id"] + "</td>";
                        var singers_photo = "<td>" + data["singers"][i]["photo"] + "</td>";
                        var singers_del = "<td><a class='btn btn-danger' href=/del_singer?id=" + data["singers"][i]["id"] + ">删除</a>" + "</td>";
                        var singers_change = "<td><a class='btn btn-info' href=/change_singer?id=" + data["singers"][i]["id"] + ">修改</a>" + "</td>";
                        $("#singers").append("<tr>" + singers_id + singers_name + singers_photo + singers_del + singers_change + "<tr/>");
                    }

                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("网络异常，请检查网络状况");
                    document.write(XMLHttpRequest.status);
                    document.write(XMLHttpRequest.readyState);
                    document.write(textStatus);
                }
            })

            $("#user").click(function () {
                $(this).addClass("bg-success");
                $("#music").removeClass("bg-success");
                $("#music_infor").hide(500);
                $("#user_infor").show(500);
            });
            $("#music").click(function () {
                $(this).addClass("bg-success");
                $("#user").removeClass("bg-success");
                $("#music_infor").show(500);
                $("#user_infor").hide(500);
            });

            $("#back").click(function name(params) {
                $("#music_infor").toggle(500);
                if ($(this).text() == "折叠菜单") {

                    $(this).text("展开菜单");
                } else {
                    $(this).text("折叠菜单");
                }
            });


            //添加音乐相关
            $('#add_music_btn').click(function name(params) {
                $('#add_music_div').show(500);
            })
            $('#add_music_btn').siblings().click(function name(params) {
                $('#add_music_div').hide(500);
            })
            //根据页数显示文件数

            $("input[type='radio']").change(function name(params) {

                //获取radio的值
                var pages = $("input[type='radio']:checked").val();
                //清除所有的input_file
                $("input[type='file']").remove();

                for (var i = pages; i >= 1; i--) {
                    var inputs = "<input type='file' id='page" + i + '\'' + ">";
                    $("#pages_div").append(inputs);
                }

            })

        })

    </script>
</head>

<body>
<ul class="nav nav-pills">
    <li class="active">
        <a href="#">管理员界面
            <span class="badge"></span>
        </a>
    </li>
    <li>
        <a href="#"></a>
    </li>
    <li>
        <a href="#">回首页
            <span class="badge">back</span>
        </a>
    </li>
    <li id="music">
        <a href="#"><span class="glyphicon glyphicon-headphones">音乐管理</span>
            <span class="badge">music</span>
        </a>
    </li>
    <li id="user">
        <a href="#"><span class="text-success glyphicon glyphicon-user">用户管理</span>
            <span class="badge">user</span>
        </a>
    </li>
    <li id="singer">
        <a href="#"><span class="text-warning glyphicon glyphicon-user">歌手管理</span>
            <span class="badge">singer</span>
        </a>
    </li>
</ul>
<br>


<div class="container" id="music_infor" hidden="true">

    <div class="row">
        <!-- 音乐的子菜单 -->
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/modify.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>修改音乐信息</h3>
                    <a href="#" class="btn btn-primary" role="button">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/add.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>添加新音乐</h3>
                    <a href="#" class="btn btn-success" role="button" name="in" id="add_music_btn">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/delete.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>删除音乐</h3>
                    <a href="#" class="btn btn-danger" role="button" name="in">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/search.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>查询音乐信息</h3>
                    <a href="#" class="btn btn-info" role="button" name="in">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
    </div>


</div>


<div class="container" id="user_infor">


    <div class="row">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/modify.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>修改用户信息</h3>
                    <a href="#" class="btn btn-primary" role="button">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/add.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>添加新用户</h3>
                    <a href="#" class="btn btn-success" role="button">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/delete.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>删除用户</h3>
                    <a href="#" class="btn btn-danger" role="button">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="images/icons/search.svg" class="img-responsive" alt="通用的占位符缩略图">
                <div class="caption">
                    <h3>查询用户信息</h3>
                    <a href="#" class="btn btn-info" role="button">
                        输入
                    </a>
                    <a href="#" class="btn btn-default" role="button">
                        折叠
                    </a>
                    </p>
                </div>
            </div>
        </div>
    </div>


</div>


<div class="container" id="add_music_div" hidden="true">


    <div class="row">


        <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3">

        </div>


        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <h3 class="text-warning">添加音乐</h3>

            <form role="form">
                <div class="form-group">

                    <div class="input-group">
                        <span class="input-group-addon">音乐名</span>
                        <input type="text" class="form-control" id=""/>
                    </div>


                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">路径</span>
                        <input type="text" class="form-control" id=""/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">歌手id</span>
                        <input type="text" class="form-control" id=""/>
                    </div>
                </div>

                <div id="pages_div">
                    <p class="help-block">
                        吉他谱页数
                    </p>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="1" checked> 1
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="2"> 2
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="3" checked> 3
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="4"> 4
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="5" checked> 5
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="add_music_page_number" value="6" checked> 6
                    </label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
                <button class="btn btn-default" id="back">展开菜单</button>
            </form>
        </div>


    </div>
</div>

<div class="container">
    <h3 class="text-success">音乐信息</h3>
</div>

<div class="container">

    <table class="table table-hover">
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>sid</th>
            <th>number</th>
            <th>format</th>
            <th class="text-danger">删除</th>
            <th class="text-primary">修改</th>
        </tr>
        </thead>
        <tbody id="songs">
        </tbody>
    </table>

</div>


<div class="container">
    <h3 class="text-success">歌手信息</h3>
</div>


<div class="container">

    <table class="table table-hover">

        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>photo</th>
            <th class="text-danger">删除</th>
            <th class="text-primary">修改</th>
        </tr>
        </thead>

        <tbody id="singers">
        </tbody>

    </table>

</div>


</body>

</html>