/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fileuploads;

import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*; 


/**
 *
 * @author Rashi Kathuria
 */
@WebServlet("/repoup1")
public class repoup1 extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fileName=request.getParameter("fileName");
        
        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = ConnectionProvider.getConnection();
            // Fetch the file from the database
            String sql = "SELECT file_data FROM repository WHERE files = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fileName);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Get the input stream from the database
                InputStream inputStream = resultSet.getBinaryStream("file_data");

                // Set the content type and headers for the response
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                  // Get the output stream of the response
                OutputStream outputStream = response.getOutputStream();

                // Write the file data to the response output stream
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                  // Close the streams
                inputStream.close();
                outputStream.close();
            }

            // Close the resources
            resultSet.close();
            statement.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception as required
        }

    }

    
   
   
    
}
