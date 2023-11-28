<%-- 
    Document   : index
    Created on : 06-Mar-2023, 5:25:48 pm
    Author     : 91821
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome </title>
        <!css...>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @keyframes flip {
            0% {
                transform: rotateY(0deg) scale(1);
                opacity: 1;
            }
            50% {
                transform: rotateY(180deg) scale(1.2);
                opacity: 0.5;
            }
            100% {
                transform: rotateY(360deg) scale(1);
                opacity: 1;
            }
        }

        @keyframes colorChange {
            0% {
                color: red;
            }
            25% {
                color: blue;
            }
            50% {
                color: green;
            }
            75% {
                color: purple;
            }
            100% {
                color: black;
            }
        }
@keyframes flow {
    0% {
        background-position: 0 0;
    }
    100% {
        background-position: 100% 0;
    }
}

#top {
    height: 400px;
    background: linear-gradient(to right, #fc575e, #f7b42c, #fc575e);
    text-align: center;
    border-radius: 50px;
    border: 4px double white;
    padding-bottom: 0px;
    position: relative;
    overflow: hidden;
}

#flowing-bg {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to right, #fc575e, #f7b42c, #fc575e);
    animation: flow 5s linear infinite;
    z-index: -1;
}


        #logo
        {

            width: 400px;
            height: 350px;
            font-weight: bolder;
            position: relative;
            left : 20px;
            bottom:40px;




        }
        #img1{
            border-radius: 50px;
            width: 100%;
            height : 100%;
        }

        #welcome
        {

            position: relative;
            left : 0px;
            bottom:425px;
            padding: 20px;
            font-family: fantasy;
            font-size: 65px;
            text-shadow:6px 4px white;
            animation: flip 2s ease-in-out 1, colorChange 10s linear infinite 1s;

        }



        #btns
        {
            position: relative;
            left:1500px;
            bottom:600px;
            width:350px;

        }
        body{

            background: linear-gradient(to left,#FF9933 ,#ffffff,#fc575e ,#ffffff,#FF9933  );


        }
    </style>

</head>

<body>

    <%@include  file="normal_navbar.jsp" %>
    <!<!-- Banner Creation --> 

    <div class="container-fluid p-0 m-0 mt-4" >
        <div class="jumbotron banner-background" id="top">


            <div id='logo'> <img id='img1' src="img/KMP.png">
            </div>

            <div  id="welcome">
                Welcome <br> To <br> Knowledge Management <br>Portal
            </div>
            <div id="btns">
                <a href="register_page.jsp" class="btn btn-outline-light btn-lg btn-block"> <span class='fa fa-hand-o-up'>&nbsp;</span>Start It's Free</a>
                &nbsp;&nbsp;
                <a href="login_page.jsp" class="btn btn-outline-light btn-lg btn-block"> <span class='fa fa-check-square-o'>&nbsp;</span>Login</a>
            </div>

        </div>

        <br> <br> <br><br>

    </div>

    <!-- Cards -->
    <div class='container'>

        <div class='row' style=" background: linear-gradient(to right,#f7b42c,#fc575e); ">
            <%

                PostDao d = new PostDao(ConnectionProvider.getConnection());

                List<Post> posts = null;

                posts = d.getLatestPosts();

                for (Post p : posts) {
            %>
            <div class='col-md-4 mt-2'>
                <div class="card mt-2"style="border:2px black;" >
                    <div class="card-body">
                        <img class="card-img-top" height="200px" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">   
                        <h5 class="card-title"><%= p.getpTitle()%> </h5>



                        <a href="#" class="btn btn-outline-dark" onclick="showLoginPrompt()">Read More</a>

                    </div>
                </div>
            </div>

            <%
                }
            %>



        </div>
    </div>


    <!js>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script>
                            function showLoginPrompt() {
                                Swal.fire({
                                    title: "Login Required",
                                    text: "You must be logged in or signed up before accessing the full content.",
                                    icon: "info",
                                    showCancelButton: false,

                                });
                            }
</script>

</body>


</html>
