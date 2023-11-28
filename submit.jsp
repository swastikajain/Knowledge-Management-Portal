<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <style>
            body{
                background: linear-gradient(to right,#44000B,#B82E1F
                    ,#B82E1F,#44000B);
            }
            #container{
                text-align: center;
                background-color: yellow;
                width: 500px;
                margin-left: 522px;
                margin-top: 200px;
                height: 400px;
                border-radius: 50px;
                font-family: cursive;
            }            
            </style>
            <title>Submission Status</title>
        </head>
        <body>
            <div id="container">
                <%
                    User user = (User) session.getAttribute("currentUser");
                    String Query = request.getParameter("Query");
                    String expert = request.getParameter("expert");

                    Connection conn = null;
                    PreparedStatement stmt = null;

                    try {
                        conn = ConnectionProvider.getConnection();

                        String sql = "INSERT INTO ask_an_expert (user_id, Query, expert) VALUES (?,?,?)";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, user.getId());
                        stmt.setString(2, Query);
                        stmt.setString(3, expert);
                        int rowsAffected = stmt.executeUpdate();

                        // Display SweetAlert based on the submission status
                        String swalScript = "";
                        if (rowsAffected > 0) {
                            swalScript = "Swal.fire('Success', 'Data submitted successfully!', 'success').then(function() { window.location.href = 'AskExpert.jsp'; });";
                        } else {
                            swalScript = "Swal.fire('Error', 'Failed to submit data!', 'error').then(function() { window.location.href = 'AskExpert.jsp'; });";
                        }
                        out.println("<script>" + swalScript + "</script>");

                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<h2>Error occurred while submitting data!</h2>");
                    } finally {
                        if (stmt != null) {
                            stmt.close();
                        }
                    }
                %>


            </div>
        </body>
    </html>
