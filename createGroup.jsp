<%@page import="com.tech.blog.entities.User"%>
<%   User user = (User) session.getAttribute("currentUser");%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Group</title>
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

        #container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #666;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #007bff;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Style for "View Groups" button */
        #view-groups-container {
            text-align: center;
            margin-top: 20px;
        }

        .view-groups-btn {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .view-groups-btn:hover {
            background-color: #1f8845;
        }

        /* Style for Knowledge Network title */
        #knowledge-network {
            text-align: center;
            font-weight: bold;
            font-size: 40px;
            background-color: #007bff; /* Blue color for the margin */
            color: #fff; /* White text color */
            padding: 15px 0; /* Increased height from top */
            margin-bottom:  200px; /* Adjusted margin from top */
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
    <div id="knowledge-network">Knowledge Network</div>
    <div id="container">
        <h2>Create a Group</h2>
        <form action="CreateGroupServlet" method="post">
            <label for="groupName">Group Name:</label>
            <input type="text" id="groupName" name="groupName" required>
            <input type="submit" value="Create Group">
        </form>
    </div>
    
    <!-- View Groups Button -->
    <div id="view-groups-container">
        <form action="GroupsListServlet" method="get">
            <input class="view-groups-btn" type="submit" value="View Groups">
        </form>
    </div>
</body>
</html>
