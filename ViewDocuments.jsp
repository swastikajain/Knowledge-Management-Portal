<%-- 
    Document   : ViewDocuments
    Created on : 06-Aug-2023, 2:39:02 pm
    Author     : 91821
--%>

<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.KnowledgeRepoDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Repository"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.nio.channels.ConnectionPendingException"%>
<%@page import="com.tech.blog.dao.KnowledgeRepoDao"%>
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
        <title>View Documents</title>
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
               .form-control
            {
                height:40px !important;
                font-size: 20px !important;
                padding: 40px;
            }
         
            #viewHeader
            {
                font-family: cursive;
                font-size: 22px;
                background: white;
                font-style: italic;
                font-weight: 600
            }
            .viewAll
            {
                font-family: cursive;
                font-size: 20px;

                font-style: italic;
                font-weight: 400

            }
            #bg-m
            {
                width:25%;
                position: fixed;
                bottom:200px;
                left : -60px;

            }
             .bordered-cell {
                border: 1px solid #000; /* You can customize the border style and color as per your requirement */
                padding: 5px; /* Add padding for better visual appearance */
                display: flex;
                align-items: stretch;
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
                        <a id="pos" class="nav-link" href='Knowledgerepo.jsp' > <i class="fa fa-arrow-left fa-beat-fade" aria-hidden="true"></i>&nbsp; Back </a>
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

      <!--Add Document -->
        <div class="modal fade container-fluid" style="background: linear-gradient(to top,#138808 ,#ffffff,#ffffff,#FF9933  );"  id="add-document-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document"  >
                <div class="modal-content" >
                    <div class="modal-header  text-white text-center" >
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
                    <div class="modal-footer " >
                        <div class="text-center">
                                <button type="submit" class="btn btn-outline-light" >Upload</button>
                                <button type="button" class="btn btn-outline-light " data-dismiss="modal">Close</button>
                            </div>
                        

                    </div>
                </div>
            </div>


        </div>
<!--End of Add Document -->





        <!--View Documents List Start -->

        <%

            KnowledgeRepoDao krp = new KnowledgeRepoDao(ConnectionProvider.getConnection());

            List<Repository> docs = krp.getAllDocuments();

            int totalDocs = krp.getNumberOfRepositories();
            int itemsPerPage = 2;
            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            int totalPages = totalDocs / itemsPerPage;
            if (totalDocs % itemsPerPage != 0) {
                totalPages++;
            }

            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.min(startIndex + itemsPerPage, totalDocs);

            List<Repository> repositoriesToShow = docs.subList(startIndex, endIndex);

            if (docs.size() == 0) {
        %>
        <div>

            <p>There is nothing posted here </p>

        </div>

        <%
            }
        %>


        <div class="container  mt-4">
            <div class="row " >

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
                </div>
            </div>
            <div class="row  align-items-start text-center bordered-cell" id="viewHeader"> 
                <div class="col sm">
                    Title
                </div>
                <div class="col sm">
                    Tags
                </div>
                <div class="col sm">
                    File Name
                </div>
                <div class="col sm">
                    Remarks
                </div>
                <div class="col sm">
                    Uploaded On
                </div>
                <div class="col sm">
                    Uploaded By
                </div>
                <div class="col sm">
                    Download
                </div>
            </div>




            <%
                for (Repository repo : repositoriesToShow) {
            %>



            <div class="row align-items-start  bordered-cell viewAll">
                <div class="col">
                    <%= repo.getTitle()%>
                </div>
                <div class="col">
                    <p>  <%= repo.getTag()%> </p>
                </div>
                <div class="col">
                    <p> <%= repo.getFileName()%></p>
                </div>
                <div class="col">
                    <p> <%= repo.getRemark()%></p>
                </div>
                <div class="col">
                    <p> <%= repo.getDateTime()%></p>
                </div>
                <% UserDao ud = new UserDao(ConnectionProvider.getConnection());
                    User u = ud.getUserByUserId(repo.getUserId());
                %>
                <div class="col">
                    <p> <%= u.getName()%></p>
                </div>
                <!-- Inside the for-loop for displaying the documents -->
                <button class="btn btn-outline-dark download-btn" data-filename="<%= repo.getFileName()%>">Download</button>
            </div>

            <%
                }
            %>

        </div>

        <!--View Documents List End -->


        <main>
            <img id="bg-m" src="img/viewDocument.png" alt="alt"/>

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


        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--Delete Button-->
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

        <!--Download Button -->
        <script>
            $(document).ready(function () {
                // Attach a click event handler to the download buttons
                $(".download-btn").on("click", function () {
                    var filename = $(this).data("filename");

                    // Create a new AJAX request to the DownloadFileServlet
                    $.ajax({
                        url: "DownloadFileServlet",
                        method: "GET",
                        data: {
                            filename: filename
                        },
                        xhrFields: {
                            responseType: "blob" // Set the response type to 'blob' to handle binary data
                        },
                        success: function (data) {
                            // Create a temporary anchor element to trigger the download
                            var blob = new Blob([data], {type: "application/octet-stream"});

                            // Create a URL for the Blob object using the Blob constructor (alternative to URL.createObjectURL())
                            var url = (window.webkitURL || window.URL).createObjectURL(blob);

                            var a = document.createElement("a");

                            a.href = url;
                            a.download = filename;

                            // Append the anchor to the document and click it to initiate download
                            document.body.appendChild(a);
                            a.click();

                            // Clean up resources after the download is complete
                            window.URL.revokeObjectURL(url);
                            document.body.removeChild(a);
                        },
                        error: function (xhr, status, error) {
                            console.error("Error downloading file: " + error);
                        }
                    });
                });
            });
        </script>

        <!--Profile Modal -->
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
