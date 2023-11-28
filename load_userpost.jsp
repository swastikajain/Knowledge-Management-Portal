<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
 
<head>
   <style>
        
        #readmore{
            background:white ; color :black;
            font-weight: bold;
   
        }
        #readmore:hover{
            background: black !important;
            color: white !important;
            text-decoration: none !important;
        }
        #like{
            background:white ; color : red;
        }
        #like:hover{
            background: black !important;
            color: red !important;
            text-decoration: none !important;
        }
        #comment{
            background:white ; color: black;
        }
        #comment:hover{
            background: black !important;
            color: white !important;
            text-decoration: none !important;
        }
      
        
            
        
    </style>
  
</head>

<div class="row"> 
<%
    HttpSession s = request.getSession();
    User user =  (User)(s.getAttribute("currentUser"));
    

PostDao d = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));

List<Post> posts = null ;
if(cid==0)
{
posts = d.getAllPostByUserId(user.getId());
}
else posts = d.getPostByUserId(user.getId(),cid);
    
    if(posts.size()==0)
    {
    out.println("<h2 class='display-3 text-center' style='color : #234d6e;' >There is nothing posted under this catergory :(  </h2>");
    out.println("<br> <img src='img/empty.jpg' style='width:600px; height:400px ; margin-left: 100px' ; >");
    
    return ;
    }
    
for(Post p : posts)
{
%>

<div class="col-md-4">
    
    <div class="card mt-3">
        <img class="card-img-top" height="400px" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
        <div class="card-body ">
            
            <h6>
                <b> <%= p.getpTitle() %>  </b>
                
                
            </h6>
            
        </div>
        
                <div id="foot" class="card-footer text-center primary-background">
                    
                    <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    
                    %>
                    
                    <a id="readmore" href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn-sm "> Read More... </a>
                    &nbsp; <a  href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %> )" id="like"  class="btn-sm "> <i class="fa fa-heart" ></i> <span id="like-counter-<%= p.getPid() %>"> <%= ld.countLikeOnPost(p.getPid()) %> </span></a>
                    &nbsp; <a id="comment" href="#" class="btn-sm "> <i class="fa fa-commenting-o" ></i> <span> </span></a>
                   &nbsp; <button class="btn btn-danger btn-sm " id="delete-post-btn"  onclick="deletePost(<%=p.getPid() %>)">Delete</button>
                 
 
                </div>
                
                
    </div>
    
</div>   

<%
    }
%>
</div>