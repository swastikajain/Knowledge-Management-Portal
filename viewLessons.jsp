<%@page import="com.tech.blog.dao.lessonsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.lesson"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.nio.channels.ConnectionPendingException"%>
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
        <title>View Lessons</title>
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
            #viewHeader
            {
                font-family: cursive;
                font-size: xx-large;
                background: white;
                font-style: italic;
                font-weight: 600
            }
            .viewAll
            {
                font-family: cursive;
                font-size: x-large;

                font-style: italic;
                font-weight: 400
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
                        <a id="pos" class="nav-link" href='lesson.jsp' > <i class="fa fa-arrow-left fa-beat-fade" aria-hidden="true"></i>&nbsp; Back </a>
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

        <!--Add Lesson Modal Start -->

        <div class="modal fade container-fluid" style="background: linear-gradient(to top,#138808 ,#ffffff,#ffffff,#FF9933  );"  id="add-document-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="lesson"  >
                <div class="modal-content" >
                    <div class="modal-header  text-white text-center" style="background:orange">
                        <h5 class="modal-title" id="exampleModalLabel">Knowledge Hub</h5>
                        <button type="button" height="100%" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h2 class="text-center">Lesson Upload</h2>
                        <h5 id="msg" class="center-align"></h5>
                        <form action="lesson" method="post" id="myform" enctype="multipart/form-data">

                            <label>Lesson Title</label><br/>
                            <input type="text" name="tittle"   /><br/>
                            <label>Tags</label><br/>
                            <input type="text" name="tag"  /><br/><br/>
                            <label>Knowledge Unit Category</label><br/>
    <select name="Knowledge Unit Category">
        <option value="option1">Exploration and Production</option>
        <option value="option2">Refining and Petrochemicals</option>
        <option value="option3">Environmental Management</option>
        <option value="option4">Health, Safety, and Environment (HSE)</option>
        <option value="option5">Geology and Geophysics</option>
        <option value="option6">Corporate Governance</option>
        <option value="option7">Business and Finance</option>
    </select><br/><br/>
    

<label>Knowledge Unit</label><br/>
<select name="KnowledgeUnit" id="unitSelect">
    <option value="option1">Reservoir Engineering</option>
    <option value="option2">Occupational Health and Safety</option>
    <option value="option3">Well Testing and Logging</option>
    <option value="option4">Environmental Protection</option>
</select><br/><br>


                                    
                            
                                <label>Problem Statement</label><br/>
    <textarea name="problemStatement" rows="4" cols="50"></textarea><br/><br/>
<label>How did you Solve it?</label><br/>
    <textarea name="How did u solve it" rows="4" cols="50"></textarea><br/><br/>
    <label>Root Cause Analysis</label><br/>
    <textarea name="Root cause analysis" rows="4" cols="50"></textarea><br/><br/>
    <label>Lesson Learnt</label><br/>
    <textarea name="lesson learnt" rows="3" cols="50"></textarea><br/><br/>
    <label>Area of Organization Improvement</label><br/>
    <textarea name="improvement" rows="3" cols="30"></textarea><br/><br/>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" >Upload</button>
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer " style="background: orange" >
                        <button type="button" class="btn btn-outline-light " data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>


        </div>

        <!--Add Lesson Modal End -->
<%

            lessonsDao ld = new lessonsDao(ConnectionProvider.getConnection());

            List<lesson> docs = ld.getAllLessons();

            int totalLess = ld.getNumberOfLessons();
            int itemsPerPage = 2;
            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            int totalPages = totalLess / itemsPerPage;
            if (totalLess % itemsPerPage != 0) {
                totalPages++;
            }

            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.min(startIndex + itemsPerPage, docs.size());

            List<lesson> lessonToShow = docs.subList(startIndex, endIndex);

            if (docs.size() == 0) {
        %>
        <div>

            <p>There is nothing posted here </p>

        </div>

        <%
            }
        %>




      <div class="container-fluid mt-4">
            <div class="row">

                <div class="container text-center" >
                    <nav aria-label="Page navigation example">
                        <ul class="pagination ">
                            <li class="page-item">
                                <%-- Previous page link --%>
                                <% if (currentPage > 1) {%>
                                <a class="page-link" href="?page=<%= currentPage - 1%>"><i class=" fa fa-arrow-left fa-beat-fade"></i>&nbsp; &nbsp;Previous</a>
                                <% } else { %>
                                <span class="page-link"><i class=" fa fa-arrow-left fa-beat-fade"></i>&nbsp;&nbsp; Previous  </span>
                                <% }%>
                            </li>
                            <li class="page-item ml-auto">
                                <p class="page-link">Current Page : <%=currentPage%> of <%=totalPages%></p>
                            </li>    
                            <%-- Next page link --%>
                            <li class="page-item ml-auto">
                                <% if (currentPage < totalPages) {%>
                                <a class="page-link" href="?page=<%= currentPage + 1%>">Next &nbsp; <i class=" fa fa-arrow-right fa-beat-fade"></i></a> 
                                <% } else { %>
                                <span class="page-link">Next&nbsp; <i class=" fa fa-arrow-right fa-beat-fade"></i></span>
                                <% } %>
                            </li>
                        </ul>
                    </nav>

                    <div class="row align-items-start" id="viewHeader">
                        <div class="col">
                            Title
                        </div>
                        <div class="col">
                            Tag
                        </div>
                        <div class="col">
                            Knowledge Unit Category
                        </div>
                        <div class="col">
                            Problem Statement
                        </div>
                    </div>

                </div>
            </div>


            <%
                for (lesson l : lessonToShow) {
            %>

            <div class="row mt-4 rounded viewAll">
                <div class="container text-center">
                    <div class="row align-items-start">
                        <div class="col">
                            <%= l.getTitle() %>
                        </div>
                        <div class="col">
                            <p>  <%= l.getTag()%> </p>
                        </div>
                        <div class="col">
                            <p> <%= l.getknowledgeUnitCategory()%></p>
                        </div>
                        <div class="col">
                            <p> <%= l.getProblem()%></p>
                        </div>
                        
                    </div>

                </div>
            </div>

            <%
                }
            %>



        </div>

        <!--View Lessons List End -->

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
                        url: "lesson",
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

        
 <!<!-- Write JS for Lesson modal -->       
        <script>

    $(document).ready(function (e)
    {
        $('#add-lesson-form').on("submit", function (event) {

            //Jaise he form submit hoga ye event occur hojayega

            event.preventDefault();
            console.log("Chal gaya");
            let form = new FormData(this);

            // ab iss form k data ko servlet pe asynchronously tranfer kr rhe hai idher se

            $.ajax({

                url: "AddLessonServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {

                    // iska mtlb request successfully chli gyi servlet pe
                    if (data.trim() == "saved")
                    {
                        swal("Good job!", "Your Lesson Has Been Uploaded !", "success");
                    } else
                    {
                        swal("Something Went Wrong!", "Sorry The Lesson Wasn't Uploaded !", "error");
                    }
                },

                error: function (jqXHR, textStatus, errorThrown) {

                    swal("Something Went Wrong!", "Sorry The Lesson Wasn't Uploaded !", "error");
                    // koi error agayi 
                },
                processData: false, // ye dono isiliye taki multi media bhi bhej sake ( images)
                contentType: false


            });

        });
    }
    );

</script>


    </body>

</html>
