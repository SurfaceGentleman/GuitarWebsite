<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/10
  Time: 下午5:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script>
    // $(document).ready(function () {
    //     $.ajax({
    //         //
    //         url: "/songs",
    //         data: {},
    //         type: "post",
    //
    //         dataType: "json",
    //
    //         success: function (data) {
    //
    //             for (var i = 0; i < data["page_songs"]["list"].length; i++) {
    //
    //                 var songs_name = "<td>" + data["page_songs"]["list"][i]["name"] + "</td>";
    //                 var songs_id = "<td>" + data["page_songs"]["list"][i]["id"] + "</td>";
    //                 var songs_sid = "<td>" + data["page_songs"]["list"][i]["sid"] + "</td>";
    //                 var songs_number = "<td>" + data["page_songs"]["list"][i]["number"] + "</td>";
    //                 var songs_del = "<td><a class='btn btn-danger' href=/del_song?id=" + data["page_songs"]["list"][i]["id"] + ">删除</a>" + "</td>";
    //                 var songs_format = "<td>" + data["page_songs"]["list"][i]["format"] + "</td>";
    //                 var songs_change = "<td><a class='btn btn-info' href=/change_song?id=" + data["page_songs"]["list"][i]["id"] + ">修改</a>" + "</td>";
    //                 $("#songs").append("<tr>" + songs_id + songs_name + songs_sid + songs_number + songs_format + songs_del + songs_change + "</tr>");
    //                 var pageNumber = data["page_songs"]["pageNumber"];
    //                 var pageSize = data["page_songs"]["pageSize"];
    //                 var total = data["page_songs"]["total"];
    //
    //                 $("#back").attr("href", "page?pageNumber=" + (pageNumber - 1));
    //                 $("#forward").attr("href", "page?pageNumber=" + (pageNumber + 1));
    //                 if (pageNumber <= 1) {
    //                     $("#back").attr("disabled", "disabled");
    //                 }
    //                 if (pageNumber >= total) {
    //                     $("#forward").attr("disabled", "disabled");
    //                 }
    //             }
    //
    //             // for (var i = 0; i < data["singers"].length; i++) {
    //             //     var singers_name = "<td>" + data["singers"][i]["name"] + "</td>";
    //             //     var singers_id = "<td>" + data["singers"][i]["id"] + "</td>";
    //             //     var singers_photo = "<td>" + data["singers"][i]["photo"] + "</td>";
    //             //     var singers_del = "<td><a class='btn btn-danger' href=/del_singer?id=" + data["singers"][i]["id"] + ">删除</a>" + "</td>";
    //             //     var singers_change = "<td><a class='btn btn-info' href=/change_singer?id=" + data["singers"][i]["id"] + ">修改</a>" + "</td>";
    //             //     $("#singers").append("<tr>" + singers_id + singers_name + singers_photo + singers_del + singers_change + "<tr/>");
    //             // }
    //
    //         },
    //
    //         error: function (XMLHttpRequest, textStatus, errorThrown) {
    //             alert("网络异常，请检查网络状况");
    //             document.write(XMLHttpRequest.status);
    //             document.write(XMLHttpRequest.readyState);
    //             document.write(textStatus);
    //         }
    //     })
    $("#back").click(function () {

    })
    $("#forward").click(function () {

    })

    })
</script>
<body>

<div class="container">
    <h3 class="text-success">音乐信息</h3>
    <h5 class="text-danger">(每页显示12条, 共${PageInfo.total}页，当前在第${PageInfo.pageNumber}页)</h5>

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

        <c:forEach items="${PageInfo.list}" var="s">
            <tr>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.sid}</td>
                <td>${s.number}</td>
                <td>${s.format}</td>
                <td><a class='btn btn-warning' href=/del_song?id=${s.id}>删除</a></td>
                <td><a class='btn btn-info' href=/change_song?id=${s.id}>修改</a></td>
            </tr>
        </c:forEach>


        </tbody>

    </table>
    <div class="row">
        <a class="btn btn-default" href="songs?pageNumber=${PageInfo.pageNumber-1}&pageSize=${PageInfo.pageSize}" <c:if
                test="${PageInfo.pageNumber<=1}"> onclick="javacript:return false;"</c:if>>上一页</a>
        <a class="btn btn-default" href="songs?pageNumber=${PageInfo.pageNumber+1}&pageSize=${PageInfo.pageSize}" <c:if
                test="${PageInfo.pageNumber>=PageInfo.total}"> onclick="javacript:return false;" </c:if> >下一页</a>
    </div>
</div>
</body>
</html>
