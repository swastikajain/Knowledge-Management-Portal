<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.mysql.cj.conf.ConnectionPropertiesTransform"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
    String query_id = request.getParameter("query_id");
    String commenter_name =  user.getName();
    String comment_text = request.getParameter("comment_text");

  

   
    Connection connection = ConnectionProvider.getConnection();
    String insertQuery = "INSERT INTO comments (query_id, commenter_name, comment_text) VALUES (?, ?, ?)";

    try {
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, (query_id));
        preparedStatement.setString(2, commenter_name);
        preparedStatement.setString(3, comment_text);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    
        
        response.sendRedirect("displaydata.jsp"); // Redirect back to the original post page
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
