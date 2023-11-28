<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nilesh.servlets.Member" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Members</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        .members {
            margin-top: 20px;
            text-align: center;
        }

        .member {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
        }

        p {
            margin: 0;
        }

        form {
            margin: 0;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .add-members-button {
            background-color: #27ae60;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        .add-members-button:hover {
            background-color: #219451;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Members in Group</h1>
        <div class="members">
            <h2>Members:</h2>
            <%
            int groupId = Integer.parseInt(request.getParameter("groupId"));
            List<Member> members = new ArrayList<>();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/group_management", "root", "root");
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM members WHERE group_id = ?");
                statement.setInt(1, groupId);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int memberId = resultSet.getInt("id");
                    String memberName = resultSet.getString("member_name");
                    members.add(new Member(memberId, memberName));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (members != null && members.size() > 0) {
                for (Member member : members) {
            %>
                    <div class="member">
                        <p><%= member.getName() %></p>
                        <form action="DeleteMemberServlet" method="post">
                            <input type="hidden" name="groupId" value="<%= groupId %>">
                            <input type="hidden" name="memberId" value="<%= member.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </div>
            <%
                }
            } else {
            %>
                <p>No members found.</p>
            <%
            }
            %>
        
</body>
</html>
