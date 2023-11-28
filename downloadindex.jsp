<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%   User user = (User) session.getAttribute("currentUser");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> File Upload/Download</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9);
            margin: 0;
            padding: 0;
         
        }
        .container {
           
            justify-content: center;
            align-items: center;
            position: fixed;
            left:750px;
            top:300px;
      
        }
        .form-container {
            width: 400px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container input[type="text"],
        .form-container input[type="file"],
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        .form-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .view-list-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .view-list-btn:hover {
            background-color: #0056b3;
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
    <div class="container">
        <div class="form-container">
            <h2>Media Upload Details</h2>
            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="firstname" value="<%= session.getAttribute("firstname") %>">
                <input type="text" required="" name="description" placeholder="Description">
                <input type="file" required="" name="file">
                <input type="submit" value="Submit">
            </form>
            <a class="view-list-btn" href="file-list.jsp">View List</a>
        </div>
    </div>
</body>
</html>
