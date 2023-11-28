<%@page import="com.tech.blog.entities.User"%>
<!DOCTYPE html>
<%   User user = (User) session.getAttribute("currentUser");%>
<html>
<head>
    <title>Main Menu</title>
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

        #header {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            font-size: 24px;
            opacity: 0.9;
            font-size:40px;
        }

        #menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
           
        }

        .menu-option {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 20px;
            text-align: center;
            width: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .menu-option a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            font-size: 18px;
        }

        .menu-icon {
            width: 64px;
            height: 64px;
            margin-top: 10px;
        }

        .add-members-icon {
            width: 64px;
            height: 64px;
            margin-top: 10px;
        }
        .view-members-icon {
            width: 64px;
            height: 64px;
            margin-top: 10px;
        }

        #logo {
            max-width: 200px; /* Adjust the logo size */
            margin-top: 20px;
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
    <div id="header">
         KNOWLEDGE NETWORK
    </div>

    <div id="menu-container">
        <div class="menu-option">
            <h2><a href="chat.jsp">GroupChat</a></h2>
            <img class="menu-icon" src="https://png.pngtree.com/png-vector/20191130/ourmid/pngtree-group-chat-icon-png-image_2054401.jpg" alt="Group Chat Icon">
        </div>

        <div class="menu-option">
            <h2><a href="downloadindex.jsp">Media Gallery</a></h2>
            <img class="menu-icon" src="https://png.pngtree.com/png-vector/20190508/ourmid/pngtree-gallery-vector-icon-png-image_1028015.jpg" alt="Media Gallery Icon">
        </div>

        <div class="menu-option">
            <h2><a href="createGroup.jsp">Create Group</a></h2>
            <img class="add-members-icon" src="https://www.pngitem.com/pimgs/m/24-248669_login-add-user-new-team-member-icon-hd.png" alt="Add Members Icon">
        </div>

         
    </div>
</body>
</html>
