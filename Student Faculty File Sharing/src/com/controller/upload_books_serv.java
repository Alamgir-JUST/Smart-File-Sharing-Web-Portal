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

import javafx.css.PseudoClass;

/**
 * Servlet implementation class upload_books_serv
 */
@WebServlet("/upload_books_serv")
@MultipartConfig(maxFileSize = 16177215)
public class upload_books_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_books_serv() {
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
		
		String book_id = request.getParameter("books_id");
		String depart_name = request.getParameter("department");
		String year = request.getParameter("year");
		String semister = request.getParameter("semister");
		String type = request.getParameter("type");
		String book_Name = request.getParameter("books_name");
		String member = request.getParameter("member_name");
		
		Part filepart = request.getPart("books_file");
		InputStream inputStream = null;
		inputStream = filepart.getInputStream();
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_books(Books_Id,Department,Year,Semister,Books_Type,Books_Name,Publishers,Book_File) values(?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, book_id);
			pst.setString(2, depart_name);
			pst.setString(3, year);
			pst.setString(4, semister);
			pst.setString(5, type);
			pst.setString(6, book_Name);
			pst.setString(7, member);
			
			pst.setBinaryStream(8,inputStream, (int)filepart.getSize());
			
			//long r = pst.executeLargeUpdate();
			int r = pst.executeUpdate();
			if(r>0) {
				out.println("File Uploaded!!!");
				response.sendRedirect("Upload_Books.jsp");
			}else {
				out.println("Not Uploaded");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
