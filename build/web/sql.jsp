<%-- 
    Document   : sql
    Created on : 2018-12-9, 9:24:21
    Author     : Kmitle
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="conn" class="sql.sqlBean" scope="page"/>
<jsp:useBean id="s" class="list.netclass" scope="page"/>
<jsp:setProperty name="conn" property="url" value="jdbc:derby://localhost:1527/sample"/>
<jsp:setProperty name="s" property="*"/>
<%
    String action = s.getAction();
    if(action==null || action.equals("")){
        try{
            String sid = s.getSid();
            String name = s.getName();
            String rank = s.getRank();
            String sql = "insert into NETCLASS(SID,NAME,RANK) values('"+sid+"','"+name+"','"+rank+"')";
            conn.executeUpdate(sql);
        }
        finally{
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else if(action.equals("delete")){
        try{
            String sid = s.getSid();
            String sql = "delete from NETCLASS where sid='"+sid+"'";
            conn.executeUpdate(sql);
        }finally{
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else if(action.equals("update")){
        try{
            String sid = s.getSid();
            String name = s.getName();
            String rank = s.getRank();
            String sql = "update NETCLASS set name='"+name+"',rank='"+rank+"' where sid='"+sid+"'";
            conn.executeUpdate(sql);
        }
        finally{
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>
