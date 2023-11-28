`<%@page import="com.tech.blog.entities.User"%>
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
        <title>Enter User Data</title>
        <style>
            body{
                background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9) ;
            }


            .swal-button--confirm {
                background-color: white !important;
                color: black !important;
            }
            .swal-button--confirm:hover {
                background-color: black !important;
                color: orange !important;
            }
            .swal-modal {
                background: linear-gradient(to right,#FFC988 100%,#E288F9) !important;
                color: white!important ;
            }
            .swal-text
            {
                color: black;
                font-family: cursive;
                font-weight: bold;
                font-size: large
            }
            #container{
                text-align: center;
                background-color: yellow;
                width: 500px;
                margin-left: 522px;
                margin-top: 120px;
                height: 400px;
                border-radius: 50px;
                font-family: cursive;
             
            }
            
        </style>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>

        <!-- nav bar -->

        <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px ">
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
                        <a id="con" class="nav-link" href="displaydata.jsp"> <span class="fa fa-database"></span> View Queries</a>
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
        <main>

            <div id="container" class="mb-4" style="
    background: linear-gradient(to right,#f7b42c,#fc575e);
">
                <h2  style="padding :20px ; ">ASK AN EXPERT</h2><br>
               <form action="submit.jsp" method="post">
<!--        <label for="username">Query:</label>
        <input type="text" id="username" name="username" required><br><br>
        -->
        <label for="Query">Query:</label>
        <textarea id="Query" name="Query" rows="4" cols="45" required></textarea><br><br>
        
        <label for="expert">Select an Expert:</label>
        <select id="expert" name="expert" required>
            <option value="Saksham Sethi">Saksham</option>
            <option value="Rashi">Rashi</option>
            <option value="MAYANK">MAYANK</option>
            <option value="Swastika">Swastika</option>
            <option value="Nilesh">Nilesh</option>
        </select><br><br>
        
        <input type="submit" value="Submit">
    </form>
                        </div>
                        </main>


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
                                                            <td> <%= user.getGender().toUpperCase()%> </td>
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



                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
                        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

                        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



                        </body>
                        </html>
