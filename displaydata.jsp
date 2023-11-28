<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*, java.sql.Timestamp" %>

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
        <style>



            body {
                background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9) ;

                font-family: Arial, sans-serif;
                line-height: 1.6;
                font-size: 16px;
            }


            .card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;

            }


            .card {
                border: 10px solid black;
                padding: 10px;
                margin: 10px;
                flex: 1;
                min-width: 300px;
                max-width: 400px;
                border-radius: 20px;
                transition: transform 0.3s ease-in-out;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background: linear-gradient(to right,#f7b42c,#fc575e);
                height: 300px;
                width: 500px;
                font-family: cursive;
                font-weight: bold;

            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }


            .card h3 {
                margin-top: 0;
            }

            .card p {
                margin: 0;
            }

            .comment-form {
                margin-top: 10px;
            }

            .comment-list {
                list-style: none;
                padding-left: 0;
            }

            .comment {
                margin-top: 10px;
                padding: 5px;
                background-color: #fff;
                border: 1px solid #ccc;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .show-comments-btn {
                background-color: orange;
                color: white;
                padding: 5px 10px;
                cursor: pointer;

            }
            .comment-form input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 20px;
                padding: 8px 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .comment-form input[type="submit"]:hover {
                background-color: #45a049;
            }
            #expert-select{
                width: 25%;
            }

        </style>
        <!css...>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const expertSelect = document.getElementById("expert-select");
            const cardContainer = document.querySelector(".card-container");

            expertSelect.addEventListener("change", function () {
                const selectedExpert = this.value;
                console.log(selectedExpert);

                if (selectedExpert!=null) {
                    $.ajax({
                        type: "GET",
                        url: "getqueries.jsp", // Modify the URL if needed
                        data: {expert: selectedExpert},
                        success: function (data) {
                            cardContainer.innerHTML = data;
                        },
                         error: function (error) {
                            console.error('Error fetching queries:', error);
                        }
                      
                    });
                     
                    }

                   else {
                    cardContainer.innerHTML = "";
                }
                  
            });

        });
    </script>
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
    <div class="expert-container">

        <!--<h4>Show Queries </h4>-->
        <select id="expert-select" class="form-control">
            <option value="">Choose Expert Related Queries</option>
            <%
                try {
                    Connection conn = ConnectionProvider.getConnection();
                    Statement expertStmt = conn.createStatement();
                    ResultSet expertResultSet = expertStmt.executeQuery("SELECT expert_name FROM experts");

                    while (expertResultSet.next()) {
                        String expertName = expertResultSet.getString("expert_name");
            %>
            <option value="<%= expertName%>"><%= expertName%></option>
            <%
                    }
                    expertResultSet.close();
                    expertStmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
    </div>


    <!--<h2 style= "text-align: center;font-size: large;">All Queries</h2>-->


    <%
        boolean isExpert = false;
        String loggedInUsername = user.getName();

        try {
            Connection conn = ConnectionProvider.getConnection();
            PreparedStatement expertStatement = conn.prepareStatement("SELECT expert_name FROM experts WHERE expert_name=?");
            expertStatement.setString(1, loggedInUsername);
            ResultSet expertResultSet = expertStatement.executeQuery();

            if (expertResultSet.next()) {
                isExpert = true;
            }
            expertResultSet.close();
            expertStatement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        Connection conn = ConnectionProvider.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM ask_an_expert");
         UserDao ud = new UserDao(conn);
        int cardsPerRow = 1;
        int cardCount = 0;

        out.println("<div class=\"card-container\">");
        while (rs.next()) {
            int userid = rs.getInt("user_id");
            int QueryId = rs.getInt("ID");
            String Query = rs.getString("Query");
            String expert = rs.getString("expert");
            Timestamp timestamp = rs.getTimestamp("timestamp");
            String formattedTimestamp = timestamp.toString();
            if (cardCount == 0) {
                out.println("<div class=\"card-row\">");
            }

            out.println("<div class=\"card-column\">");
            out.println("<div class=\"card\">");
            out.println("<h6>Date - (" + formattedTimestamp + ")</h6>");
             User u = ud.getUserByUserId(userid);
            out.println("<h5>Posted By: " + u.getName() + "</h3>");
            out.println("<h6>Query: " + Query + "</h3>");
           
            out.println("<h6>For Expert: " + expert + "</h5>");

            // Display only one comment initially
            PreparedStatement commentStatement = conn.prepareStatement("SELECT * FROM comments WHERE query_id=? LIMIT 1");
            commentStatement.setInt(1, QueryId);
            ResultSet commentResultSet = commentStatement.executeQuery();
            out.println("<ul class=\"comment-list\">");
            while (commentResultSet.next()) {
                String commenterName = commentResultSet.getString("commenter_name");
                String commentText = commentResultSet.getString("comment_text");
                out.println("<li class=\"comment\"><strong>" + commenterName + ":</strong> " + commentText + "</li>");
            }
            out.println("</ul>");
            commentResultSet.close();
            commentStatement.close();

            // Display "Read More" link to view all comments
            out.println("<a href=\"viewcomments.jsp?query_id=" + QueryId + "\">Read More</a>");

            if (isExpert && loggedInUsername.equals(expert)) {
                // Comment form
                out.println("<form class=\"comment-form\" style=\"margin-top: auto;\" action=\"addcomment.jsp\" method=\"post\">");
                out.println("<input type=\"hidden\" name=\"query_id\" value=\"" + QueryId + "\">");
                out.println("<label for=\"comment\">Comment:</label>");
                out.println("<textarea name=\"comment_text\" rows=\"1\" required></textarea><br>");
                out.println("<input type=\"submit\" value=\"Add Comment\">");
                out.println("</form>");
            } else {
                out.println("<p>You are not authorized to add comments.</p>");
            }

            out.println("</div>");
            out.println("</div>");

            cardCount++;

            if (cardCount == cardsPerRow) {
                out.println("</div>");
                cardCount = 0;
            }
        }

        if (cardCount > 0) {
            out.println("</div>");
        }

        out.println("</div>");

        rs.close();
        stmt.close();

    %>




    <!-- Profile Modal start -->

    <!-- Modal -->
    <div class="modal fade" style="background:#0b1429"  id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document"  >
            <div class="modal-content" >
                <div class="modal-header  text-white text-center" style="background:#420000">
                    <h5 class="modal-title" id="exampleModalLabel">Knowledge Hub</h5>
                    <button type="button" height="100%" class="close" data-dismiss="modal" aria-label="Close" style="background: darkgray;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body primary-background">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" width="150px" style="border-radius: 50%"> 
                        <br> <br>
                        <h4 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%></h4>
                        <! Details>


                        <div id="profile-details">
                            <table class="table table-light" >


                                <tr>
                                    <th scope="row">ID</th>
                                    <td> <%= user.getId()%> </td>

                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td> <%= user.getEmail()%>  </td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td> <%= user.getGender()%> </td>

                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <td> <%= user.getAbout()%> </td>

                                </tr>
                                <tr>
                                    <th scope="row">Date of Register</th>
                                    <td> <%= user.getDateTime()%> </td>

                                </tr>

                            </table>
                        </div>

                        <!-- Ab yahan hoga profile edit ka code niche! -->
                        <!-- ab edit button pe click krte he details hide hojaye or edit krne ka option ajaye -->

                        <div id ="profile-edit" style="display: none;">  <!-- By default isko hide krna hai -->
                            <h4  class="mt-3"> Please Edit Carefully !</h4>

                            <form action="EditServlet" method="post" enctype="multipart/form-data">

                                <!-- Enctype = multipart/ is used to send multi media data over an html form -->

                                <table class="table table-light"> 

                                    <tr>
                                        <td>ID :</td>
                                        <td> <%= user.getId()%> </td>
                                    </tr>

                                    <tr>
                                        <td>Email :</td>
                                        <td> <input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"> </td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td> <input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"> </td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td> <input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"> </td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <!--<td> <%= user.getGender().toUpperCase()%> </td>-->
                                    </tr>
                                    <tr>
                                        <td>About :</td>
                                        <td> <textarea class="form-control" name="user_about" rows="3"> <%= user.getAbout()%>  </textarea> </td>
                                    </tr>

                                    <tr>
                                        <td>New Profile picture :</td>
                                        <td> <input type="file" name="image" class="form-control"> </td>
                                    </tr>

                                </table>
                                <div class="container"> 
                                    <button type="submit" class="btn btn-outline-light" style=""> Save</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="modal-footer " style="background: #420000" >
                    <button type="button" class="btn btn-outline-light " data-dismiss="modal">Close</button>
                    <button id="edit-profile-button"  type="button" class="btn btn-outline-light">Edit</button>
                </div>
            </div>
        </div>
    </div>

    <!-- End of Profile Modal -->

    <!js>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script src="js/myjs.js" type="text/javascript"></script>

<script>
        function showComments(button, queryId) {
            const commentList = button.previousElementSibling.querySelector('.comment-list');
            const showAllCommentsBtn = button.nextElementSibling;
            commentList.innerHTML = ''; // Clear existing comments

            // Fetch all comments for the query
            fetch(`getcomments.jsp?query_id=${queryId}`)
                    .then(response => response.text())
                    .then(data => {
                        commentList.innerHTML = data;
                        showAllCommentsBtn.style.display = 'none';
                    })
                    .catch(error => {
                        console.error('Error fetching comments:', error);
                    });
        }
</script>


</html>
