<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/6
  Time: 上午12:31
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
        $(document).ready(function name(params) {
            $.ajax({
                //
                url: "/search",
                data: {str: '<%=request.getAttribute("str")%>'},
                type: "post",

                dataType: "json",

                success: function (data) {
                    for (var i = 0; i < data["songs"].length; i++) {
                        var songs_name = "<td class='text-danger'>" + data["songs"][i]["name"] + "</td>";
                        var songs_sname = "<td>" + data["songs"][i]["sname"] + "</td>";
                        var songs_view = "<td><a class='btn btn-primary' href=/page?id=" + data["songs"][i]["id"] + "&pages=" + data['songs'][i]['number'] + "&format=" + data['songs'][i]['format'] + ">查看</a>" + "</td>";
                        var songs_download = "<td><a class='btn btn-success'>下载</a></td>";
                        $("#songs").append("<tr>" + songs_name + songs_sname + songs_view + songs_download + "</td>");
                    }

                    for (var i = 0; i < data["singers"].length; i++) {
                        var singers_id = data["singers"][i]["id"];
                        var singers = "<a class='btn btn-success' href='singer_song?id=" + singers_id + "'>" + data["singers"][i]["name"] + "</a>";
                        $("#singers").append(singers);
                    }
                    // alert(data["songs"].length);
                    // $("#songs_text").text(data["songs"].length);
                    // $("#singer_text").text(data["singers"].length)
                    if (parseInt(data["songs"].length) == 0) {
                        $("#songs_text").text("曲谱（无结果）");
                        $("#songs_text").addClass("text-danger");
                        $("#songs_text").siblings().remove();
                        $("#songs_text").remove();
                    }
                    if (parseInt(data["singers"].length) == 0) {
                        $("#singer_text").text("歌手（无结果）");
                        $("#singer_text").addClass("text-danger");
                        $("#singer_text").siblings().remove();
                        $("#singer_text").remove();
                    }

                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    document.write("error");
                    document.write(XMLHttpRequest.status);
                    document.write(XMLHttpRequest.readyState);
                    document.write(textStatus);
                }

            })

        })
    </script>
</head>

<body>
<div class="container">
    <div class="row">
        <h3 class="text-success">搜索结果</h3>
        <br/>
        <br/>
    </div>
    <div class="row">
        <h4 class="text-info" id="songs_text">曲谱</h4>
        <hr/>
        <table class="table">
            <thead>
            <tr>
                <th>歌曲名</th>
                <th>歌手</th>
                <th>吉他谱</th>
                <th>音乐资源</th>
            </tr>
            </thead>
            <tbody id="songs">
            </tbody>
        </table>

    </div>
    <hr/>
    <div class="row">
        <h4 class="text-info" id="singer_text">歌手</h4>
        <hr/>

        <table class="table">
            <thead>
            <tr>
                <th>歌手名</th>
            </tr>
            </thead>

            <tbody id="singers">
            <br/>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>