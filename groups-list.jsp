<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Groups List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .group-box {
            display: inline-block;
            width: calc(33.33% - 20px); /* Adjust the width as needed */
            margin: 10px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .group-box strong {
            display: block;
            margin-bottom: 10px;
        }

        .add-members-button {
            display: block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .add-members-button:hover {
            background-color: #0056b3;
        }
        
        .knowledge-network-button {
            display: block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .knowledge-network-button:hover {
            background-color: #1f8845;
        }
    </style>
</head>
<body>
    <h1>Groups List</h1>
    <div class="container">
        <c:forEach var="group" items="${groups}">
            <div class="group-box">
                <strong>ID:</strong> ${group.id}
                <strong>Group Name:</strong> ${group.groupName}
                <a href="viewMembers.jsp?groupId=${group.id}" class="add-members-button">
                    View Members
                </a>
                <a href="home.jsp" class="knowledge-network-button">
                    Knowledge Network
                </a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
