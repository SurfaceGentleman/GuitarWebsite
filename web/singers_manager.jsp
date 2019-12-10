<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/10
  Time: 下午6:52
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
<body>

<div class="container">
    <h3 class="text-success">歌手信息</h3>
    <h5 class="text-danger">(每页显示12条, 共${PageInfo.total}页，当前在第${PageInfo.pageNumber}页)</h5>
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

        <c:forEach items="${PageInfo.list}" var="s">
            <tr>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.photo}</td>
                <td><a class='btn btn-warning' href=/del_singer?id=${s.id}>删除</a></td>
                <td><a class='btn btn-info' href=/change_singer?id=${s.id}>修改</a></td>
            </tr>
        </c:forEach>


        </tbody>

    </table>
    <div class="row">
        <a class="btn btn-default" href="singers?pageNumber=${PageInfo.pageNumber-1}&pageSize=${PageInfo.pageSize}"
                <c:if
                        test="${PageInfo.pageNumber<=1}"> onclick="javacript:return false;"</c:if>>上一页</a>
        <a class="btn btn-default" href="/singers?pageNumber=${PageInfo.pageNumber+1}&pageSize=${PageInfo.pageSize}"
                <c:if
                        test="${PageInfo.pageNumber>=PageInfo.total}"> onclick="javacript:return false;" </c:if> >下一页</a>
    </div>
</div>
</body>
</html>
