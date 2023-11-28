<%-- 
    Document   : Knowledgerepo
    Created on : 30-Jul-2023, 5:00:30 pm
    Author     : Rashi Kathuria
--%>

<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Knowledge Repository</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!-- Compiled and minified JavaScript -->          

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                height:100vh;
                background: linear-gradient(to top,#138808 ,#ffffff,#ffffff,#FF9933  );
                background-size: cover;
                background-repeat: no-repeat;
            }
            #bg-m
            {
                width:45%;
            }
            #text{

                font-family: cursive;
                position: fixed;
                left: 800px;
                bottom: 360px;
                font-size: 80px;
                text-decoration: underline;

                text-shadow:4px 4px orange;

            }
            #shloka{
                font-family: cursive;
                position: fixed;
                left:40px;
                bottom: 60px;
                font-size: 30px;

            }
            .form-control
            {
                height:40px !important;
                font-size: 20px !important;
                padding: 40px;
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
                        <a id="pos" class="nav-link" href='#' data-toggle="modal" data-target="#add-document-modal" > <span class="fa fa-duotone fa-upload fa-beat-fade"></span>&nbsp; Add Document </a>
                    </li>

                    <li class="nav-item">
                        <a id="pos" class="nav-link" href='ViewDocuments.jsp' > <i class="fa  fa-folder-open-o"></i>&nbsp; View All Documents </a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a id="out" class="nav-link" href="MyDocs.jsp"> <i class="fa fa-file fa-flip"></i>My Documents</a>
                    </li>

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




      <!--Add Document -->
        <div class="modal fade container-fluid" style="background: linear-gradient(to top,#138808 ,#ffffff,#ffffff,#FF9933  );"  id="add-document-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document"  >
                <div class="modal-content" >
                    <div class="modal-header  text-white text-center" style="background:orange">
                        <h5 class="modal-title" id="exampleModalLabel">Knowledge Hub</h5>
                        <button type="button" height="100%" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h2 class="text-center">Document Upload</h2>
                        <h5 id="msg" class="center-align"></h5>
                        <form action="knowrepo" method="post" id="myform" enctype="multipart/form-data">

                            <label>Document Title</label><br/>
                            <input type="text" name="tittle" class="form-control"    placeholder="Enter the Title of the Document"/> <br/><br/>
                            <label>Tags</label><br/>
                            <input class="form-control" type="text" name="tags"  placeholder="Enter the Tags for the Document"/><br/><br/>
                            <label>Upload your File </label><br/>
                            <input type="file" name="files" class="form-control" /><br/>
                            <label>Remark</label><br/>
                            <input class="form-control" type="text" name="remark" placeholder="Enter Your Remarks" /><br/><br/>

                            
                        </form>

                    </div>
                    <div class="modal-footer " style="background: orange" >
                        <div class="container text-center">
                                <button type="submit" class="btn btn-outline-light" >Upload</button>
                                <button type="button" class="btn btn-outline-light " data-dismiss="modal">Close</button>
                            </div>
                        

                    </div>
                </div>
            </div>


        </div>
<!--End of Add Document -->
        <main>
            <img id="bg-m" src="img/6731-removebg.png" alt="alt"/>
            <div >
                <p id="text"> Welcome to <br> Knowledge Repository </p>
                <p id="shloka">ॐ सरस्वती मया दृष्ट्वा, वीणा पुस्तक धारणीम् ।<br>
                    हंस वाहिनी समायुक्ता मां विद्या दान करोतु में ॐ ।।</p>
            </div>
        </main>


         <!-- Profile Modal start -->

    <!-- Modal -->
    <div class="modal fade" style="background:"  id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready!!");

                $("#myform").on('submit', function (event) {
                    event.preventDefault();
                    //              var f =$(this).serialize();

                    let f = new FormData(this);
                    console.log(f);



                    $.ajax({
                        url: "knowrepo",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("sucess..")

                            if (data.trim() == "done") {
                                console.log("sucess in uploading..")
                                swal("Uploaded Successfully", "success");
                            } else {
                                console.log("not sucess in uploading..")
                                swal("Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            console.log("error....")

                            swal("Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

<!-- Profile-->
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

    </body>
</html>
