<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.nilesh.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   User user = (User) session.getAttribute("currentUser");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File List</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
          background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9);
            margin: 0;
            padding: 0;
            background-color: #333333
        }
        .center-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            padding-top: 2em;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 1em;
            text-align: center;
            width: 100%;
        }
        .file-block {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 1em;
            margin: 0.5em;
            width: 300px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .file-details {
            padding: 0.5em;
        }
        .file-download {
            text-align: center;
            margin-top: 1em;
        }
        .download-button {
            display: inline-block;
            padding: 0.5em 1em;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .download-button:hover {
            background-color: #0056b3;
        }
        .home-link {
            display: block;
            margin-top: 2em;
            color: #007bff;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>
      <!-- nav bar -->

        <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
            <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 40px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Management Portal</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a id="back" class="nav-link" href="profile.jsp"> <span class="fa fa-hand-peace-o"></span> Home  <span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item active">
                        <a id="back" class="nav-link" href="webChat.jsp"> <span class="fa fa-arrow-left"></span> Back  </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">


                    <li class="nav-item">
                        <a id="prof" class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a id="out" class="nav-link" href="LogoutServlet"> <span class="fa fa-hand-o-up"></span> Logout</a>
                    </li>
                    <li class="nav-item">
                        <a id="con" class="nav-link" href="contact_us.jsp"> <span class="fa fa-address-book-o"></span> Contact Us</a>
                    </li>

                </ul>
            </div>
        </nav>

        <!-- End of Nav Bar-->
    <div class="center-content">
    <div class="title">Media Gallery Download Centre</div>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>
        <%
            con = com.nilesh.DatabaseConnection.getConnection();
            String sql = "select * from file";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        
        <div class="file-block">
            <div class="file-details">
                <p>ID: <%=rs.getInt(1)%></p>
                <p>First Name: <%=rs.getString(2)%></p>
                <p>Description: <%=rs.getString(3)%></p>
                <p>File Name: <%=rs.getString(4)%></p>
                <p>File Path: <%=rs.getString(5)%></p>
                <p>Added Date: <%=rs.getTimestamp(6)%></p>
            </div>
            <div class="file-download">
                <a class="download-button" href="DownloadServlet?fileName=<%=rs.getString(4)%>">Download</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
 
</body>
</html>
