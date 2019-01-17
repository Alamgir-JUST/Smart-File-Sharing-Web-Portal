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
 * Servlet implementation class upload_results_serv
 */
@WebServlet("/upload_results_serv")
@MultipartConfig(maxFileSize = 16177215)
public class upload_results_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_results_serv() {
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
		
		String result_id = request.getParameter("relust_id");
		String depart_name = request.getParameter("department");
		String year = request.getParameter("year");
		String semister = request.getParameter("semister");
		String exam_type = request.getParameter("exam_type");
		String name = request.getParameter("result_name");
		
		Part filepart = request.getPart("result_file");
		InputStream inputStream = null;
		inputStream = filepart.getInputStream();
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_result(Result_Id,Department,Year,Semister,Type,Name,Result_File) values(?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, result_id);
			pst.setString(2, depart_name);
			pst.setString(3, year);
			pst.setString(4, semister);
			pst.setString(5, exam_type);
			pst.setString(6, name);
			
			pst.setBinaryStream(7,inputStream, (int)filepart.getSize());
			int r = pst.executeUpdate();
			//long r = pst.executeLargeUpdate();
			if(r>0) {
				out.println("File Uploaded!!!");
				response.sendRedirect("Upload_Result.jsp");
			}else {
				out.println("Not Uploaded");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
