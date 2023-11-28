<%-- 
    Document   : error_page
    Created on : 28-Apr-2023, 3:07:01 pm
    Author     : 91821
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong!</title>
                 <!css...>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #top{
height:400px;
  text-align: center;
 border-radius: 50px;
 border-color : white;
 border-style: double;
 border : 4px;
 border-color:white;
 background-color: darkgray; 
 padding-bottom:0px ; 
        }
        
    </style>
    </head>
    <body style="background-color: darkgray">
        <div class="container text-center" style="background:black; width: auto ; ">
            <img src="img/error.png"  class="img-fluid">
            
            
        </div>
        <div class="container text-center">
        <h3 class="display-3"> Sorry! Something went wrong..</h3> 
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt3 ">Home</a>
        </div>
    </body>
</html>
