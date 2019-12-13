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
            var pageSize = 2;
            var pageNumber = 1;
            var name = '<%=request.getAttribute("name")%>';

            $.ajax({
                //
                url: "page_search",
                data: {name: name, pageSize: pageSize, pageNumber: pageNumber},
                type: "post",

                dataType: "json",

                success: function (data) {
                    for (var i = 0; i < data["PageInfo"]["list"].length; i++) {
                        var songs_name = "<td class='text-danger'>" + data["PageInfo"]["list"][i]["name"] + "</td>";
                        var songs_sname = "<td>" + data["PageInfo"]["list"][i]["sname"] + "</td>";
                        var songs_view = "<td><a class='btn btn-primary' href=/page?id=" + data["PageInfo"]["list"][i]["id"] + "&pages=" + data["PageInfo"]['list'][i]['number'] + "&format=" + data["PageInfo"]['list'][i]['format'] + ">查看</a>" + "</td>";
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
                                    var songs_view = "<td><a class='btn btn-primary' href=/page?id=" + data["PageInfo"]["list"][i]["id"] + "&pages=" + data["PageInfo"]['list'][i]['number'] + "&format=" + data["PageInfo"]['list'][i]['format'] + ">查看</a>" + "</td>";
                                    var songs_download = "<td><a class='btn btn-success'>下载</a></td>";

                                    $("#result").append("<tr>" + songs_name + songs_sname + songs_view + songs_download + "</tr>");
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

<div class="container">
    <h3>与<span class="text-success">"<%=request.getAttribute("name")%>"</span>相关的搜索结果</h3>

</div>

<br>

<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
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
