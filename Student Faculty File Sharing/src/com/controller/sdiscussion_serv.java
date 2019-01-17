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

import com.model.adminloginmodel;
import com.model.loginmodel;
import com.util.DBConnection;

/**
 * Servlet implementation class sdiscussion_serv
 */
@WebServlet("/sdiscussion_serv")
@MultipartConfig(maxFileSize = 16177215)
public class sdiscussion_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sdiscussion_serv() {
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
		String message_by = loginmodel.getUname();
		String message = request.getParameter("message");
		Part filepart = request.getPart("dis_file");
		InputStream inputStream = null;
		inputStream = filepart.getInputStream();
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_sdiscussion(messageby,Message,File) values(?,?,?)";
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, message_by);
			pst.setString(2, message);
			
			pst.setBinaryStream(3,inputStream, (int)filepart.getSize());
			int r =pst.executeUpdate();
			//long r = pst.executeLargeUpdate();
			if(r>0) {
				out.println("File Uploaded!!!");
				response.sendRedirect("student_discussion.jsp");
			}else {
				out.println("Not Uploaded");
			}
			out.println(message_by);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
