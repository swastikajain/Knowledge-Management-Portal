/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fileuploads;

import com.repo.helper.helper;
import com.tech.blog.dao.KnowledgeRepoDao;
import com.tech.blog.entities.Repository;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
public class knowrepo extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            int userId = user.getId();
            String tittle=request.getParameter("tittle");
            String tag=request.getParameter("tags");
            Part part=request.getPart("files");
            String filename=part.getSubmittedFileName();
//            out.println(filename);
            String remark=request.getParameter("remark");
            
            Repository repo = new Repository(tittle, filename, tag, remark,userId);
            
            KnowledgeRepoDao rd = new KnowledgeRepoDao(ConnectionProvider.getConnection());
            
            if(rd.saveDocument(repo))
            { 
                String path= getServletContext().getRealPath("/") + "Repository" + File.separator + part.getSubmittedFileName();
                 helper.uploadFile(part.getInputStream(), path);
                 System.out.println("true");
                 
                 out.println("done");
           
            }
            else
            {
                out.print("error");
            }
            
             
               
                    
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
