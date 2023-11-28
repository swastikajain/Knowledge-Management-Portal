
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
    </body>
</html>
<%
    String selectedExpert = request.getParameter("expert");
    System.out.println("selected"+selectedExpert+" length "+selectedExpert.length());
    if (selectedExpert != null && !selectedExpert.isEmpty()) {
        try {
            Connection conn = ConnectionProvider.getConnection();
            PreparedStatement queryStmt = conn.prepareStatement("SELECT * FROM ask_an_expert WHERE expert = ?");
            queryStmt.setString(1, selectedExpert);
            ResultSet queryResultSet = queryStmt.executeQuery();

            while (queryResultSet.next()) {
                int queryId = queryResultSet.getInt("Id");
                String queryText = queryResultSet.getString("Query");
                String expertName = queryResultSet.getString("expert");
                Timestamp timestamp = queryResultSet.getTimestamp("timestamp");
                // Fetch other relevant query data as needed

                // Generate HTML for displaying the query
%>
                <div class="card-column">
                    <div class="card">
                        <h3>Query: <%= queryText %></h3>
                        <p>Expert: <%= expertName %></p>
                        <p>Timestamp: <%= timestamp %></p>
                        <!-- Display other query information -->
                    </div>
                </div>
<%
            }

            queryResultSet.close();
            queryStmt.close();
        } catch (SQLException e) {
            out.println("Error executing SQL query: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
%>
