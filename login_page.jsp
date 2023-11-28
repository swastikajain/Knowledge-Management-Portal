

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!css...>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body{
            background: linear-gradient(to right,#44000B,#B82E1F
                ,#B82E1F,#44000B);
        }
        #submit
        {

            width:80px;
            height:40px;
            font-weight: bold;
            color : black;
            background: white ;

        }
        #submit:hover
        {
            color : white;
            background: black;

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
        .card
        {
            background: linear-gradient(to right,#f7b42c,#fc575e);
            border: black;

        }
        .card-body{
            background: #FFC988 ;
            color:black !important;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

</head>
<body  >
    <!-- navbar -->
    <%@include  file="normal_navbar.jsp" %>
    <main class=" d-flex align-items-center  mt-4" style="height:60vh; margin-top: 120px !important;">
        <div class="container mt-2">

            <div class="row">

                <div class="col-md-4 offset-md-4" >

                    <div class="card" style=" color:white;border:black;" >

                        <div class="card-header text-center" >

                            <br>
                            <span class="fa fa-user-plus fa-2x"></span> 
                            <h5>Login Here</h5>

                            <br>
                        </div>

                        <!-- Ab idher error msg print karva denge agar invalid details hogi -->
                        <!-- msg ko kisi condition pe he dikhana hai not everytime so we'll use java-->

                        <%
                            //Using Scriptlet Tag
                            //session se msg fetch karo

                            Message m = (Message) session.getAttribute("msg");
                            if (m != null) {

                        %>
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                Swal.fire({

                                    title: '<%= m.getContent()%>',
                                    icon: '<%= m.getType()%>',
                                    confirmButtonText: 'OK'
                                });
                            });
                        </script>
                        <%
                            }

                            //msg ko display krke remove krdo session se
                            session.removeAttribute("msg");

                        %>



                        <div class="card-body">

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><h6>Email address</h6></label>
                                    <input name="email" required  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text " > We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"><h6>Password</h6></label>
                                    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <br>
                                <div class="container  text-center ">
                                    <button id="submit" class="btn btn-md"  type="submit">Submit</button>
                                </div>

                            </form>

                        </div>


                    </div>


                </div>

            </div>

        </div>

    </main>

    <!js>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>
