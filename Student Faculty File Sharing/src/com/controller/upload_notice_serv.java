package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.DBConnection;

/**
 * Servlet implementation class upload_notice_serv
 */
@WebServlet("/upload_notice_serv")
@MultipartConfig(maxFileSize = 16177215)
public class upload_notice_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_notice_serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		
		String Notice_Id = request.getParameter("Notice_Id");
		String depart_name = request.getParameter("department");
		String topic = request.getParameter("topic");
		String notice_Name = request.getParameter("notice_name");
		Part filepart = request.getPart("notice_file");
		InputStream inputStream = null;
		inputStream = filepart.getInputStream();
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_notice(Notice_Id,Department,Topics,Notice_Name,Notice_File) values(?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, Notice_Id);
			pst.setString(2, depart_name);

			pst.setString(3, topic);
			pst.setString(4, notice_Name);;
			
			pst.setBinaryStream(5,inputStream, (int)filepart.getSize());
			int r = pst.executeUpdate();
			//long r = pst.executeLargeUpdate();
			if(r>0) {
				out.println("File Uploaded!!!");
				response.sendRedirect("Upload_Notice.jsp");
			}else {
				out.println("Not Uploaded");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
