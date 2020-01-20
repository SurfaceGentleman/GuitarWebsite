<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/11
  Time: 下午5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>异常</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    您的操作异常或服务器繁忙！网站搭建不易，还望相互理解
    <br/>
    错误原因:<strong class="text-danger"><%=request.getAttribute("error")%></strong>
<hr>
    <a href="/main">返回首页</a>
</body>
</html>
