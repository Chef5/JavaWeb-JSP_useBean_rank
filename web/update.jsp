<%-- 
    Document   : update.jsp
    Created on : 2018-12-9, 10:42:58
    Author     : Kmitle
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="conn" class="sql.sqlBean" scope="page"/>
<jsp:useBean id="s" class="list.netclass" scope="page"/>
<jsp:setProperty name="conn" property="url" value="jdbc:derby://localhost:1527/sample"/>
<jsp:setProperty name="s" property="sid" param="sid"/>
<%
    String sid = request.getParameter("sid");
    ResultSet rs = null;
    String sql = "select * from NETCLASS where sid='"+sid+"'";
    rs = conn.executeQuery(sql);
    rs.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>useBean 增加人选</h3>
        <h4>getProperty获取的sid:<jsp:getProperty name="s" property="sid"/></h4>
        <form action="sql.jsp" method="post">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="sid" value="<%=rs.getString("sid") %>"/>
            学号：<%=rs.getString("sid") %><br>
            姓名：<input type="text" name="name" value="<%=rs.getString("name") %>"/><br>
            NB指数：<input type="text" name="rank" value="<%=rs.getString("rank") %>"/><br>
            <input type="submit" value="提交" /><br>
        </form>
    </body>
    <% 
        rs.close();
        conn.close();
    %>
</html>
