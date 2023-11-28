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
        <title>Lesson Learned</title>
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
            #bg-m
            {
                width:50%;
            }
            #text{

                font-family: cursive;
                position: fixed;
                left: 1200px;
                bottom: 360px;
                font-size: 80px;
                text-decoration: underline;

                text-shadow:4px 4px white;

            }
            #quote{
                font-family: cursive;
                position: fixed;
                right: 40px;
                bottom: 60px;
                font-size: 30px;
                color: white;

            }
        </style>
    </head>
    <body >

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
                        <a id="pos" class="nav-link" href='#' data-toggle="modal" data-target="#add-document-modal" > <span class="fa fa-duotone fa-upload fa-beat-fade"></span>&nbsp; Add Lesson </a>
                    </li>
                    <li class="nav-item">
                        <a id="pos" class="nav-link" href='viewLessons.jsp' > <span class="fa fa-eye "></span><span class="fa fa-eye "></span>&nbsp; View Lessons </a>
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


        <div class="modal fade container-fluid" style="background: linear-gradient(to top,#138808 ,#ffffff,#ffffff,#FF9933  );"  id="add-document-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document"  >
                <div class="modal-content" >
                    <div class="modal-header  text-white text-center" style="background:blue">
                        <h5 class="modal-title" id="exampleModalLabel">Knowledge Hub</h5>
                        <button type="button" height="100%" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="background:white;">
                        <h2 class="text-center">Lesson Upload</h2>
                        <h5 id="msg" class="center-align"></h5>
                        <form id="add-lesson-form" enctype="multipart/form-data">

                            <label>Lesson Title</label><br/>
                            <input type="text" name="Title"   /><br/>
                            <label>Tags</label><br/>
                            <input type="text" name="Tag"  /><br/><br/>
                            <label>Knowledge Unit Category</label><br/>
                            <select name="KnowledgeUnitCategory">
                                <option value="Exploration and Production">Exploration and Production</option>
                                <option value="Refining and Petrochemicals">Refining and Petrochemicals</option>
                                <option value="Environmental Management">Environmental Management</option>
                                <option value="Health, Safety, and Environment (HSE)">Health, Safety, and Environment (HSE)</option>
                                <option value="Geology and Geophysics">Geology and Geophysics</option>
                                <option value="Corporate Governance">Corporate Governance</option>
                                <option value="Business and Finance">Business and Finance</option>
                            </select><br/><br/>


                            <label>Knowledge Unit</label><br/>
                            <select name="knowunit" id="unitSelect">
                                <option value="Reservoir Engineering">Reservoir Engineering</option>
                                <option value="Occupational Health and Safety">Occupational Health and Safety</option>
                                <option value="Well Testing and Logging">Well Testing and Logging</option>
                                <option value="Environmental Protection">Environmental Protection</option>
                            </select><br/><br>




                            <label>Problem Statement</label><br/>
                            <textarea name="Problem" rows="4" cols="50"></textarea><br/><br/>
                            <label>How did you Solve it?</label><br/>
                            <textarea name="Solve" rows="4" cols="50"></textarea><br/><br/>
                            <label>Root Cause Analysis</label><br/>
                            <textarea name="Root" rows="4" cols="50"></textarea><br/><br/>
                            <label>Lesson Learned</label><br/>
                            <textarea name="learnt" rows="3" cols="50"></textarea><br/><br/>
                            <label>Area of Organization Improvement</label><br/>
                            <textarea name="area" rows="3" cols="30"></textarea><br/><br/> 


                            <div class="modal-footer" >
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-light" >Upload</button>
                                    <button type="button" class="btn btn-outline-light " data-dismiss="modal">Close</button>
                                </div>


                            </div>

                        </form>

                    </div>

                </div>
            </div>


        </div>

        <main>
            <img id="bg-m" src="img/lesson_learned.png" alt="alt"/>
            <div >
                <p id="text"> Welcome to <br> Lessons Learned </p>
                <p id="quote">Every obstacle in life is a lesson that teaches us,<br>             not others!!!
                </p>
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

        <!js>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            console.log("loaded........")
            $('#add-lesson-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);


                $.ajax({
                    url: "AddLessonServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {

                        console.log("req sent");


                        if (data.trim() === "saved")
                        {
                            console.log("resp agaya");
                            swal("Added Successfully");
                        } else {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {


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
