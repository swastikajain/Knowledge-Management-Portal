

<%@page import="com.tech.blog.entities.Repository"%>
<%@page import="com.tech.blog.dao.KnowledgeRepoDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page errorPage="error_page.jsp" %>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <!css...>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link href="css/profile.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>

<!-- Aub idher user ki information show karenge -->


<body >

    <!-- nav bar -->

    <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
        <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 30px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Management Portal</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                
                <li class="nav-item">
                    <a id="pos" class="nav-link" href='ongcPedia.jsp'  > <span class="fa fa-newspaper-o"></span>KMP-Pedia </a>
                </li>

                <li class="nav-item">
                    <a id="pos" class="nav-link" href='Knowledgerepo.jsp'  > <span class="fa fa-database"></span> Knowledge Repository </a>
                </li>

                <li class="nav-item">
                    <a id="les" class="nav-link" href='AskExpert.jsp'  > <span class="fa fa-question-circle-o"></span> Ask an Expert</a>
                </li>
                <li class="nav-item">
                    <a id="les" class="nav-link" href='lesson.jsp'  > <span class="fa fa-book"></span> Lessons</a>
                </li>
                 <li class="nav-item">
                    <a id="les" class="nav-link" href='webChat.jsp'  > <span class="fa fa-book"></span> WebChat</a>
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
                    <a id="con" class="nav-link" href="contact_us.jsp"> <span class="fa fa-address-book"></span> Contact Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- End of Nav Bar-->


    <%
        //Using Scriptlet Tag
        //session se msg fetch karo

        Message m = (Message) session.getAttribute("msg");
        if (m != null) {

    %>
    <div class="alert <%= m.getCssClass()%>" role="alert" style="border:black">
        <%= m.getContent()%>

    </div>
    <%
        }

        //msg ko display krke remove krdo session se
        session.removeAttribute("msg");

    %>
    <div class="message-bubble">
        <br>Having Doubts ?
        <br> You can ask an Expert !!
    </div>


    <main class="mt-4">

        <div class = "container mb-4">

            <h1 class="hot-topics-heading">Hot Topics Around !!</h1>

        </div>



        <div class='row mt-4'> 
            <div class="col mr-4">
                <h2 class="section-heading animated-heading text-center">KMPPedia</h2>

                <div class='row' style=" background: linear-gradient(to right,#f7b42c,#fc575e); ">
                    <%                PostDao d = new PostDao(ConnectionProvider.getConnection());

                        List<Post> posts = null;

                        posts = d.getLatestPosts();

                        for (Post p : posts) {

                    %>
                    <div class='col-md-4 mt-2'>
                        <div class="card mt-2"style="border: 2px black;" >
                            <div class="card-body">
                                <img class="card-img-top" height="150px" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">   
                                <h5 class="card-title"><%= p.getpTitle()%> </h5>



                                <a href="ongcPedia.jsp" class="btn btn-outline-dark" >Read More</a>

                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>

            <div class="col ml-4">
                <h2 class="section-heading animated-heading text-center">Knowledge Repository</h2>
                <div class='row' style=" background: linear-gradient(to right,#f7b42c,#fc575e); ">
                    <%
                        KnowledgeRepoDao krd = new KnowledgeRepoDao(ConnectionProvider.getConnection());

                        List<Repository> repositories = null;

                        repositories = krd.getLatestDocList();

                        for (Repository repo : repositories) {

                    %>
                    <div class='col-md-4 mt-2'>
                
                        <div class="card mt-2"style="border: 2px black;" >
                            <div class="card-body">

                                <h5 class="card-title"><%= repo.getTitle()%> </h5>
                                <h5 class="card-text"><%= repo.getFileName()%> </h5>
                                <h5 class="card-text"><%= repo.getDateTime()%> </h5>

                                <a href="Knowledgerepo.jsp" class="btn btn-outline-dark" >Read More</a>

                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>

            </div>



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

                     
                      

                        <div id ="profile-edit" style="display: none;"> 
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








    <!js>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script src="js/myjs.js" type="text/javascript"></script>

<script>

    $(document).ready(function () {
        let editStatus = false;    
        $('#edit-profile-button').click(function () {

            if (editStatus == false)
            {
                $('#profile-details').hide();

                $('#profile-edit').show();
                editStatus = true;
                $(this).text("Back");
            } else
            {
                $('#profile-details').show();
                $('#profile-edit').hide();
                editStatus = false;
                $(this).text("Edit");
            }


        });

    });
</script>





</body>


</html>
