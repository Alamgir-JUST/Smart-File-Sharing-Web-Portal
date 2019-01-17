package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.adminloginmodel;
import com.model.loginmodel;
import com.util.DBConnection;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
    /*
     create images folder at, C:\Users\PC Name\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Statement st = null;
        String ffname = adminloginmodel.getUsername();
        try {
			conn = DBConnection.createConnection();
			String sql1 = "delete from tbl_faculty where Name='"+ffname+"'";
			st = conn.createStatement();
			st.executeUpdate(sql1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        try {
			conn = DBConnection.createConnection();
			String sql1 = "delete from tbl_admin where Name='"+ffname+"'";
			st = conn.createStatement();
			st.executeUpdate(sql1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        
        
        String name = request.getParameter("name");
        String password =request.getParameter("password");
        String dept = request.getParameter("department");
        String university = request.getParameter("university");
        String designation = request.getParameter("designation");
        String website = request.getParameter("website");
        String twitter = request.getParameter("twitter");
        String linkedin = request.getParameter("linkedin");
        String facebook = request.getParameter("facebook");
        
        
        adminloginmodel obj = new adminloginmodel();
        obj.setUsername(name);
        
        Part part = request.getPart("picture");//
        String fileName = extractFileName(part);//file name
        System.out.println("fileName:"+fileName);//wait
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath+ UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            conn = DBConnection.createConnection();
            String sql = "insert into tbl_faculty(Name,Department,University,Designation,Website,Twitter,Linkedin,Facebook,Picture) values(?,?,?,?,?,?,?,?,?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, dept);
            pst.setString(3, university);
            pst.setString(4, designation);
            pst.setString(5, website);
            pst.setString(6, twitter);
            pst.setString(7, linkedin);
            pst.setString(8, facebook);
            pst.setString(9, dbFileName);
            pst.executeUpdate();
            out.println("<center><h1>Information inserted Succesfully......</h1></center>");
            
            //out.println("<center><a href='display.jsp?id=" + id + "'>Display</a></center>");
        } catch (Exception e) {
            out.println(e);
        }
        
        try {
			conn = DBConnection.createConnection();
			String sql2 = "insert into tbl_admin(Name,Password) values(?,?)";
			pst = conn.prepareStatement(sql2);
			pst.setString(1, name);
			pst.setString(2, password);
			pst.executeUpdate();
        	response.sendRedirect("faculty_single_profile.jsp");
        	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
