<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2019/12/4
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<%!
    int number = 0;
    File file = new File("count.txt");
    synchronized void countPeople()
    {
        if(!file.exists())
        {
            number++;
            try{
                file.createNewFile();
                FileOutputStream out = new FileOutputStream("count.txt");
                DataOutputStream dataOut = new DataOutputStream(out);
                dataOut.writeInt(number);
                dataOut.close();
            }catch(IOException ex){}
        }
        else
            try{
                FileInputStream in = new FileInputStream("count.txt");
                DataInputStream dataIn = new DataInputStream(in);
                number = dataIn.readInt();
                number++;
                in.close();
                dataIn.close();
                FileOutputStream out = new FileOutputStream("count.txt");
                DataOutputStream dataOut = new DataOutputStream(out);
                dataOut.writeInt(number);
                out.close();
                dataOut.close();
            }catch(IOException ex){}
    }
%>
<%
    countPeople();
%>
<p>
    您是第
    <%=number %>
    个访问网站的客户。
</p>
</body>
</html>
