<%-- 
    Document   : ongcPedia
    Created on : 27-Jul-2023, 11:36:35 am
    Author     : 91821
--%>

<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
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
        <title>OngcPedia</title>
        <!css...>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .cke_dialog_ui_input_text , .cke_dialog_body{
            z-index: 10000001 !important;
        }
        body{
            background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9);
        }

        .swal-modal {

            color: white ;
        }
        .swal-text
        {
            color: black;

            font-weight: bold;
            font-size: large
        }
        .swal-button--confirm {
            background-color: white;
            color: black;
        }
        .swal-button--confirm:hover {
            background-color: black !important;
            color: orange;
        }
        .swal-button--cancel {
            background-color: white;
            color: black;
        }
        .swal-button--cancel:hover {
            background-color: black !important;
            color: orange;
        }
        #add-post-modal
        {
            z-index: 10000 !important;
        }
        .message-bubble {
            font-family: cursive;
            font-size: 20px;
            text-align: center;
            width: 300px;
            height:  100px;
            position: absolute;
            left: 30px;
            bottom: 740px;
            background-color: #70C1B3;
            color: white;
            padding: 10px;
            border-radius: 25px;
            opacity: 0;
            animation: bubbleAnimation 5s infinite;
            z-index: 999;
        }

        @keyframes bubbleAnimation {
            0%, 100% {
                transform: translateX(-50px) translateY(0) scale(1);
                opacity: 0;
            }
            50% {
                transform: translateX(0) translateY(-20px) scale(1.2);
                opacity: 1;
            }
        }


        .hot-topics-heading {
            font-size: 50px;
            font-weight: bold;
            text-align: center;
            animation: colorChange 4s infinite, growAndShrink 4s infinite;
            position: relative;
            top:10px;
            margin-bottom: 20px;
            margin-top: 50px;
            text-shadow: 3px 2px white;
        }

        @keyframes colorChange {
            0%,100% {
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

        }
        @keyframes growAndShrink {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.3);
            }
        }

    </style>

</head>
<body>
    <!-- nav bar -->

    <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
        <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 40px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Management Portal</a>
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
                    <a id="pos" class="nav-link" href='#' data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-cloud-upload"></span>Add Article </a>
                </li>

                <li class="nav-item">
                    <a id="pos" class="nav-link" href='ongcPedia.jsp'> <span class="fa fa-arrow-left"></span>Back</a>
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
    <!-- Main Body Start -->

    <main>
        <div class="message-bubble">
            You Can Sort Them
            <br> According To Your Interest !

        </div>
        <div class = "container mb-4">

            <h1 class="hot-topics-heading text-center">Latest Articles Posted !</h1>

        </div>
        <div class="container-fluid " style="margin-left:10px ; width:100%" >

            <div class="row mt-5 " style="width: 100%" >

                <!--First Column -->
                <div class="col-md-2 pb-5" style=" background: linear-gradient(to right,#f7b42c,#fc575e); " >

                    <!-- Categories dikhani hai idher saari  -->


                    <div class="list-group " style="margin-top: 40px">  <!-- c-link means category links  -->
                        <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active " style="background : #420000 ; border-color: black ; color: #f7d2d2 "> <b> All Posts </b></a>

                        <%      PostDao d = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list1 = d.getAllCategories();

                            for (Category cc : list1) {
                        %>
                        <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)"   class=" c-link list-group-item list-group-item-action" style="background : #FFC988 ; color: black"> <%= cc.getName()%> </a>
                        <%
                            }
                        %>
                    </div>

                </div>

                <!--Second Column -->
                <div class="col-md-10"  >

                    <!-- Posts dikhani hai idher saari  -->

                    <div class="container text-center" id="loader">

                        <i class="fa fa-refresh fa-3x fa-spin mt-2"> </i>
                        <h3> Loading... </h3>
                    </div>

                    <div class="container-fluid" id='post-container' > 

                    </div>

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




    <!-- add Post Modal  -->  
    <div   class="modal fade" id="add-post-modal" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"  >
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Write Post Details</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body " >

                    <!<!-- Body of the post modal  -->

                    <form action="AddPostServlet" method="Post" id="add-post-form"> 

                        <div class="form-group">
                            <label>Select A Category &nbsp; <i class="fa fa-list-alt" ></i>    </label>
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
                            <label>Enter Post Title &nbsp; <i class="fa fa-heart"></i> </label>
                            <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                        </div>
                        <div class="form-group >
                             <label>Enter Post Content</label>
                             <textarea name="pContent" id="pContentEditor"   placeholder="Enter Your Content" class="form-control"  ></textarea>     
                        </div>
                        <div class="form-group" >
                            <label>Enter Additional Quote / Information <i class="fa fa-heart"></i> </label>
                            <textarea name="pCode" class="form-control" style="height:150px" placeholder="Enter Your Program (if any )"></textarea>
                        </div>
                        <div class="form-group" >
                            <label>Select a Display  Picture <span class="fa fa-picture-o"></span> </label>
                            <br>
                            <input type="file" name="pic" >
                        </div>
                        <div class="modal-footer" style="background: #420000; color : white">
                            <div class="container text-center">

                                <button type="submit" class="btn btn-secondary btn-outline-light " >Post</button>   
                                <button type="button" class="btn btn-secondary btn-outline-light" data-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>


    <!-- End of Post Modal  -->



    <!-- Edit Post Modal -->
    <!-- Modal for Editing Post -->
    <div class="modal fade" id="editPostModal"  role="dialog" aria-labelledby="editPostModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content primary-background">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPostModalLabel">Edit Post</h5>
                    <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Edit form fields will be added here -->
                    <form id="editPostForm">
                        <div class="form-group">
                            <label for="postTitle">Title</label>
                            <input type="text" class="form-control" id="postTitle" name="postTitle" required>
                        </div>
                        <div class="form-group">
                            <label for="postContent">Content</label>
                            <textarea  id="pContentEditor2"  rows="5" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="postCode">Code</label>
                            <textarea class="form-control" id="postCode" name="postCode" rows="5" ></textarea>
                        </div>
                        <!-- Add other fields as needed -->
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-outline-light" id="savePostChangesBtn">Save Changes</button>
                </div>
            </div>
        </div>
    </div>



    <!--End of Edit Post Modal -->

    <!js>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script src="js/myjs.js" type="text/javascript"></script>
<!-- Loading Post -->
<script>

                            function getPosts(catId, temp)  // temp is the refernce of the link we have clicked
                            {
                                $('#loader').show();
                                $('#post-container').hide();

                                $('.c-link').removeClass("active");

                                $.ajax({

                                    data: {cid: catId},
                                    url: 'load_userpost.jsp',
                                    method: 'get',
                                    success: function (data, textStatus, jqXHR)
                                    {
                                        console.log(data);
                                        $("#loader").hide();
                                        $('#post-container').show();
                                        $('#post-container').html(data);

                                        $(temp).addClass("active");
                                    }

                                })
                            }

                            $(document).ready(function (e) {

                                let allPostRef = $('.c-link')[0];
                                getPosts(0, allPostRef);

                            })



</script>
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







<script src="ckeditor/ckeditor.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        CKEDITOR.replace('pContentEditor', {
            extraPlugins: 'image',
            toolbar: [
                ['Undo', 'Redo'],
                ['Font', 'FontSize', 'TextColor'],
                ['Bold', 'Italic', 'Underline'],
                ['NumberedList', 'BulletedList'],
                ['Superscript', 'Subscript'],
                ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                ['Link', 'Image'],
                ['Source']
            ],
            height: 500,
            on: {
                dialogShow: function (event) {
                    var dialogName = event.data.name;
                    if (dialogName === 'image') {
                        var dialog = event.data.dialog;
                        var urlInput = dialog.getContentElement('info', 'url');

                        // Set default width and height for images
                        var defaultWidth = '680';
                        var defaultHeight = '390';

                        if (urlInput) {
                            setTimeout(function () {
                                urlInput.select();
                                urlInput.focus();

                                // Attach an event listener to handle image properties
                                urlInput.on('change', function () {
                                    var imgElement = dialog.getContentElement('info', 'preview');
                                    if (imgElement) {
                                        imgElement.setAttribute('style', 'width: ' + defaultWidth + 'px; height: ' + defaultHeight + 'px;');
                                    }
                                });
                            }, 100);
                        }
                    }
                }
            }
        });
        var editor = CKEDITOR.instances.pContentEditor;
        var initialContent = "Enter Your Content Here!";
        editor.setData(initialContent);



        editor.style.height = "600px";
    });
</script>



<!-- Write JS for Post modal -->

<script>
    $(document).ready(function (e)
    {
        $('#add-post-form').on("submit", function (event) {

            //Jaise he form submit hoga ye event occur hojayega

            event.preventDefault();
            console.log("Chal gaya");
            let form = new FormData(this);
            var editor = CKEDITOR.instances.pContentEditor;
            var pContent = editor.getData();
            form.append('ckContent', pContent);
            // ab iss form k data ko servlet pe asynchronously tranfer kr rhe hai idher se

            $.ajax({

                url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {

                    // iska mtlb request successfully chli gyi servlet pe
                    if (data.trim() == "saved")
                    {
                        swal({
                            title: "Good job!",
                            text: "Your Post Has Been Uploaded !",
                            icon: "success",
                        }).then(function () {
                            // Reload the page after the user clicks "OK"
                            location.reload();
                        });
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
</body></html>

