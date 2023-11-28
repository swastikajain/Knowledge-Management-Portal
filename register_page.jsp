<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegisterPage</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .swal-button--confirm {
                background-color: white;
                color: black;
            }
            .swal-button--confirm:hover {
                background-color: black !important;
                color: orange;
            }
            .swal-modal {
                background: linear-gradient(to right,#FFC988 100%,#E288F9);
                color: white ;
            }
            .swal-text
            {
                color: black;
                font-family: cursive;
                font-weight: bold;
                font-size: large
            }
            #submit
            {
                background:  white;
                color :  #0b1429;
                font-family: cursive;
            }
            #submit:hover
            {

                background: #0b1429 ;
                color : white;
                font-family: cursive;
            }
            body{
                background: linear-gradient(to right,#44000B,#B82E1F
                    ,#B82E1F,#44000B);
            }

        </style>
    </head>
    <body >
        <%@include file="normal_navbar.jsp" %>



        <main class=" d-flex align-items-center mt-4 " style="height:80vh">
            <div class="container mt-4 ">

                <div class="row">

                    <div class="col-md-5 offset-md-3">

                        <div class="card" style=" background: linear-gradient(to right,#f7b42c,#fc575e);" >

                            <div class="card-header text-center" style=" background: linear-gradient(to right,#f7b42c,#fc575e);">
                                <br>
                                <span class="fa fa-user-circle fa-2x"></span> 
                                <h5>Register</h5>

                            </div>


                            <div class="card-body" style=" background: linear-gradient(to right,#FFC988 100%,#E288F9); ">


                                <form  id="reg-form" action="RegisterServlet" method="POST">

                                    <div class="form-group">
                                        <label for="user_name"><h6>Enter Your Name</h6></label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">

                                    </div>



                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><h6>Email address</h6></label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small style="color:#white" id="emailHelp" class="form-text text-muted" > We'll never share your email with anyone else.</small>
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputPassword1"><h6>Password</h6></label>
                                        <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div class="form-group">
                                        <label for="Gender"><h6>Select Gender</h6></label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="Male">Male &nbsp;
                                        <input type="radio" id="gender" name="gender" value="Female">Female &nbsp;
                                        <input type="radio" id="gender" name="gender" value="Others">Others

                                    </div>

                                    <div class="form-group">

                                        <textarea name="about" class="form-control" row="5" placeholder="Enter Something About Yourself"></textarea>

                                    </div>

                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree with Terms and Conditions</label>
                                    </div>



                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>Please wait..</h4>
                                    </div>


                                    <div class="card-footer" style=" background: linear-gradient(to right,#f7b42c,#fc575e);  ">   

                                        <button id="submit" type="submit" class="btn  btn-md">Submit</button>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            console.log("loaded........")
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);
                $("#sumbimt-btn").hide();
                $("#loader").show();
                //send register servlet:
                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                        $("#sumbimt-btn").show();
                        $("#loader").hide();
                        if (data.trim() === "Registered Successfully")
                        {
                            swal("Registered successfully..We are going to redirect to login page")
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                        } else
                        {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $("#sumbimt-btn").show();
                        $("#loader").hide();

                        swal("something went wrong..try again");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>
