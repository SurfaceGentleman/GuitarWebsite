<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/14
  Time: 下午4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/jQuery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var status = '<%=request.getAttribute("status")%>';
            if (status == 'null'){
                $("#status").remove();
            }else {
                $("#status").text(status);
            }

        })
    </script>
</head>
<body style="text-align: center">
<h3 id="status" class="text-danger"></h3>
<h4 align="center" style="padding-top: 20px">本站后端管理登录</h4>
<div style="margin: 0 auto; padding-top: 15%">
    <form action="admin_login" method="post">
        <input type="text" name="name"><br>
        <input type="password" name="password"><br>
        <button type="submit">登录</button>
    </form>
</div>

</body>
</html>
