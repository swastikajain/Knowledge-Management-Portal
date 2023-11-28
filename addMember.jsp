<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Member</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #666;
            font-weight: bold;
        }

        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        select:focus, input[type="text"]:focus {
            border-color: #007bff;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Member to Group</h1>
        <form action="AddMemberServlet" method="post">
            <label for="groupId">Select Group:</label>
            <select name="groupId">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/group_management", "root", "root");
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM `groups`");
                    while (resultSet.next()) {
                        int groupId = resultSet.getInt("id");
                        String groupName = resultSet.getString("group_name");
                %>
                        <option value="<%= groupId %>"><%= groupName %></option>
                <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </select>
            <br>
            <label for="memberName">Member Name:</label>
            <input type="text" name="memberName" required>
            <br>
            <input type="submit" value="Add Member">
        </form>
    </div>
</body>
</html>
