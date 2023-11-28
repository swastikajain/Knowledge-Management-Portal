<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%
//Scriptlet Tag , session se user ko fetch karenge or usko User class mai typecaste krna hai 

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<!DOCTYPE html>
<html>
<head>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <style>
        body {
            font-family: Arial, sans-serif;      
            background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9) ;
            
        }

        .comment-list {
            margin: 20px auto;
            max-width: 600px;
        }

        .comment {
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .comment strong {
            font-weight: bold;
        }

        .comment-form {
            margin-top: 20px;
        }

        .comment-form label,
        .comment-form textarea,
        .comment-form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .comment-form textarea {
            resize: vertical;
        }

        .comment-form input[type="submit"] {
            background-color: #1877f2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .comment-form input[type="submit"]:hover {
            background-color: #1153c9;
        }
        </style>
</head>
<body>
        <!-- nav bar -->

    <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
        <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 40px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Hub</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a id="back" class="nav-link" href="profile.jsp"> <span class="fa fa-hand-peace-o"></span> Home  <span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item">
                    <a id="con" class="nav-link" href="contact_us.jsp"> <span class="fa fa-address-book-o"></span> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a id="pos" class="nav-link" href='AskExpert.jsp'  > <span class="fa fa-hand-o-left"></span>Back</a>
                </li>


            </ul>
            <ul class="navbar-nav mr-right">


                <li class="nav-item">
                    <a id="prof" class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                </li>

                <li class="nav-item">
                    <a id="out" class="nav-link" href="LogoutServlet"> <span class="fa fa-hand-o-up"></span> Logout</a>
                </li>

            </ul>
        </div>
    </nav>

    <!-- End of Nav Bar-->
    <!--<h2 style="text-align: center">All Comments</h2>-->
    <div class="comment-list">
        <%
            try {
 
                Connection conn = ConnectionProvider.getConnection();
                Statement stmt = conn.createStatement();

                int queryId = Integer.parseInt(request.getParameter("query_id"));

                // Fetch the query associated with the comments
                PreparedStatement queryStmt = conn.prepareStatement("SELECT Query FROM ask_an_expert WHERE ID=?");
                queryStmt.setInt(1, queryId);
                ResultSet queryResultSet = queryStmt.executeQuery();

                if (queryResultSet.next()) {
                    String queryText = queryResultSet.getString("Query");
                    out.println("<h3>Query: " + queryText + "</h3>");
                }

                // Fetch and display all comments for the query
                PreparedStatement commentStmt = conn.prepareStatement("SELECT * FROM comments WHERE query_id=?");
                commentStmt.setInt(1, queryId);
                ResultSet commentResultSet = commentStmt.executeQuery();

                while (commentResultSet.next()) {
                    String commenterName = commentResultSet.getString("commenter_name");
                    String commentText = commentResultSet.getString("comment_text");
                    %>
                    <div class="comment">
                        <strong><%= commenterName %>:</strong> <%= commentText %>
                    </div>
        <%
                }
                out.println("<form class=\"comment-form\" action=\"addcomment.jsp\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"query_id\" value=\"" + queryId + "\">");
                    out.println("<label for=\"comment\">Comment:</label>");
                    out.println("<textarea name=\"comment_text\" rows=\"4\" required style=\"margin-top: 20px;\"></textarea><br>");
                    out.println("<input type=\"submit\" value=\"Add Comment\">");
                    out.println("</form>");

               
                queryResultSet.close();
                queryStmt.close();
                commentResultSet.close();
                commentStmt.close();
           
                

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error occurred while fetching data!</p>");
            }
        %>
    </div>
</html>
