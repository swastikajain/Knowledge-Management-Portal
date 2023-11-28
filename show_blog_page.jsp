<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
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

<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            #like{
                background:white ;
                color : red;
            }
            #like:hover{
                background: black !important;
                color: red !important;
                text-decoration: none !important;
            }
            #comment{
                background:white ;
                color: black;
            }
            #comment:hover{
                background: black !important;
                color: white !important;
                text-decoration: none !important;
            }
            #foot
            {
                background: linear-gradient(to right,#f7b42c,#fc575e);
            }
            .post-title{

                font-weight: 500;
                font-size : 30px;
            }
            .post-content
            {
                font-size : 25px;
                font-weight: 100;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                font-size: 18px;
            }
            .post-user-info
            {
                font-weight: bold;
                font-size: 18px;
            }
            .row-user
            {
                border:2px solid;
                padding-top: 12px;
            }
            .post-code
            {
                font-size : 20px;
                font-weight: 150;
            }
            body
            {
                background: linear-gradient(to left,#FFC988 ,#fc575e);

            }
            #post
            {
                margin-left: -80px;
            }
            #nav
            {
                background: linear-gradient(to right,#f7b42c,#fc575e);

            }
            #home,#back,#prof,#out,#pos,#con,#cat{

                color:black;
            }
            #home:hover,#back:hover,#prof:hover,#out:hover,#pos:hover,#cat:hover,#con:hover{
                color : white;
            }

            .modal-content{

                width: 1200px !important;
                height: 800px;
                position: fixed;
                background: #f7b42c;

            }

        </style> 


    </head>

    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v17.0" nonce="eqa7ea7A"></script>

        <!-- nav bar -->

        <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
            <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 40px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Hub</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">



                    <li class="nav-item">
                        <a id="con" class="nav-link" href="contact_us.jsp"> <span class="fa fa-address-book-o"></span> Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a id="pos" class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-cloud-upload"></span>Add Article </a>
                    </li>

                    <li class="nav-item active">
                        <a id="back" class="nav-link" href="ongcPedia.jsp"> <span class="fa fa-arrow-left"></span> Back  <span class="sr-only">(current)</span></a>
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


        <!-- Main content of the body -->

        <div class="container-fluid" id="post"  >

            <div class="row my-4">

                <div class="col-md-10 offset-md-1 ">


                    <div class="card" style="  background: #FFC988;">

                        <div class="card-header" id='foot'>

                            <h3 class='post-title'> <%= p.getpTitle()%>  </h3>

                        </div>

                        <div class="card-body ">

                            <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">

                            <div class='row my-3 row-user'>

                                <div class='col-md-8'> 

                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                        User u = ud.getUserByUserId(p.getUserId());
                                    %>

                                    <p class="post-user-info"> Posted By -  <a href="#"> <%= u.getName()%></a> </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date">  <%= p.getpDate().toLocaleString()%>  </p>

                                </div>
                            </div>

                            <p class='post-content'>  <%= p.getpContent()%>  </p>
                            <br><br>

                            <div class='post-code'> 
                                <b>   <%= p.getpCode()%>  </b> 
                            </div>
                        </div>
                        <div class="card-footer text-center p-3" id="foot">

                            <%
                                LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
                                int likes = ldao.countLikeOnPost(postId);
                            %>
                            &nbsp; <a  id="like" onclick="doLike(<%= postId%>,<%= user.getId()%>)" class="btn " > <i class="fa fa-heart" ></i> <span id="like-counter-<%= postId%>"> <%= likes%> </span></a>
                            &nbsp; <a id="comment" href="#" class="btn"> <i class="fa fa-commenting-o" ></i> <span>  </span></a> 
                            &nbsp; <a id="comment" href="ongcPedia.jsp" class="btn"> <i class="fa fa-arrow-left" ></i> <span>  </span></a> 
                        </div>

                        <div class="commentbox"></div>
                        <script src="https://unpkg.com/commentbox.io/dist/commentBox.min.js"></script>
                        <script>commentBox('5660642048475136-proj')</script>
                    </div>


                </div>


            </div>


            <!-- End of Main content of the body -->

            <!-- Profile Modal start -->

            <!-- Modal -->
            <div class="modal fade"   id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document"  >
                    <div class="modal-content" >
                        <div class="modal-header primary-background text-white text-center">
                            <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                            <button type="button" height="100%" class="close" data-dismiss="modal" aria-label="Close" style="background: darkgray;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="background: gray">
                            <div class="container text-center">
                                <img src="pics/<%= user.getProfile()%>" width="150px" style="border-radius: 50%"> 
                                <br> <br>
                                <h4 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%></h4>
                                <! Details>


                                <div id="profile-details">
                                    <table class="table table-dark" >


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

                                        <table class="table table-dark"> 

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
                                            <button type="submit" class="btn btn-outline-dark" style="color:white"> Save</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer " style="background: black" >
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button"  type="button" class="btn btn-secondary">Edit</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End of Profile Modal -->





            <!-- add Post Modal  -->  
            <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Write Post Details</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body"  >

                            <!<!-- Body of the post modal  -->

                            <form action="AddPostServlet" method="Post" id="add-post-form"> 

                                <div class="form-group">
                                    <select class="form-control" name="cid">
                                        <option selected disabled>---Select Category---</option>
                                        <%
                                            // scriptlet tag ka use karke idher fetch krenge database se saari categories jis jis ka option de rkha hai

                                            // sabse pahele PostDao ka object banao or database ka connection pass krdo 
                                            PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                            ArrayList<Category> list = postd.getAllCategories();

                                            //for each loop ka use krke saari categories fetch krlo list se :)
                                            for (Category c : list) {
                                                // AUB  CATEGORY KO EXPRESSION TAG USE KARKE OPTIONS MAI DYNAMICALLY PRINT KRVA DENGE 
                                        %>


                                        <option value="<%= c.getCid()%>"> <%= c.getName()%></option>
                                        <% }%>
                                    </select>
                                </div>

                                <div class="form-group" >
                                    <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                                </div>
                                <div class="form-group" >
                                    <textarea name="pContent" placeholder="Enter Your Content" class="form-control" style="height:150px"></textarea>     
                                </div>
                                <div class="form-group" >
                                    <textarea name="pCode" class="form-control" style="height:150px" placeholder="Enter Your Program (if any )"></textarea>
                                </div>
                                <div class="form-group" >
                                    <label>Select Your Photo </label>
                                    <br>
                                    <input type="file" name="pic" >
                                </div>
                                <div class="container text-center">

                                    <button type="submit" class="btn btn-secondary btn-outline-light " >Post</button>   
                                    <button type="button" class="btn btn-secondary btn-outline-light" data-dismiss="modal">Close</button>

                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Post Modal  -->


            <!js>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

            <script src="js/myjs.js" type="text/javascript"></script>

            <script>

                                $(document).ready(function () {
                                    let editStatus = false;   // hide and show k beech mai toogle krne k liye if-else ka use karenge 
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

            <!<!-- Write JS for Post modal -->
            <script>

                $(document).ready(function (e)
                {
                    $('#add-post-form').on("submit", function (event) {

                        //Jaise he form submit hoga ye event occur hojayega

                        event.preventDefault();
                        console.log("Chal gaya");
                        let form = new FormData(this);

                        // ab iss form k data ko servlet pe asynchronously tranfer kr rhe hai idher se

                        $.ajax({

                            url: "AddPostServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {

                                // iska mtlb request successfully chli gyi servlet pe
                                if (data.trim() == "saved")
                                {
                                    swal("Good job!", "Your Post Has Been Uploaded !", "success");
                                } else
                                {
                                    swal("Something Went Wrong!", "Sorry The Post Wasn't Uploaded !", "error");
                                }
                            },

                            error: function (jqXHR, textStatus, errorThrown) {

                                swal("Something Went Wrong!", "Sorry The Post Wasn't Uploaded !", "error");
                                // koi error agayi 
                            },
                            processData: false, // ye dono isiliye taki multi media bhi bhej sake ( images)
                            contentType: false


                        });

                    });
                }
                );

            </script>

            <script src="js/myjs.js"></script>

    </body>
</html>
