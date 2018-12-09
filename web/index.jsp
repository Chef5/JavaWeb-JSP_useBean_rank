<%-- 
    Document   : index.jsp
    Created on : 2018-12-9, 8:37:27
    Author     : Kmitle
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="conn" class="sql.sqlBean" scope="page"/>
<jsp:setProperty name="conn" property="url" value="jdbc:derby://localhost:1527/sample"/>
<%
    ResultSet rs = null;
    String sql = "select * from NETCLASS order by rank desc";
    rs = conn.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>网络 NB 排行榜！</title>
    </head>
    <body>
        <h1>useBean NB 排行榜！</h1>
        <h2>useBean 最新排行榜</h2>
        <table border="1">
            <tr><th>学号</th><th>姓名</th><th>NB指数</th><th>删除操作</th><th>修改操作</th></tr>
            <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getString("sid") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("rank") %></td>
                <td><a href="sql.jsp?action=delete&sid=<%=rs.getString("sid") %>">删除</a></td>
                <td><a href="update.jsp?sid=<%=rs.getString("sid") %>">修改</a></td>
            </tr>
            <% } %>
        </table>
        <hr>
        <h3>增加人选</h3>
        <form action="sql.jsp" method="post">
            学号：<input type="text" name="sid" /><br>
            姓名：<input type="text" name="name" /><br>
            NB指数：<input type="text" name="rank" /><br>
            <input type="submit" value="提交" /><br>
        </form>
    </body>
    <% 
        conn.close();
    %>
</html>
