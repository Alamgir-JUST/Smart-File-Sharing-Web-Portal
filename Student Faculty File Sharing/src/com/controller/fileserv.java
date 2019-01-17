package com.controller;
import javax.servlet.http.Part;
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
import com.util.DBConnection;





/**
 * Servlet implementation class fileserv
 */
@WebServlet("/fileserv")
@MultipartConfig(maxFileSize = 16177215)
public class fileserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fileserv() {
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
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("idd");
		String title = request.getParameter("title");
		
		Part filepart = request.getPart("myfile");
		
		InputStream inputStream = null;
		
		inputStream = filepart.getInputStream();
		
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into files(id,title,file) values(?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, title);
			pst.setBinaryStream(3, inputStream,(int)filepart.getSize());
			long r = pst.executeLargeUpdate();
			if(r>0) {
				out.println("File uploaded!!!!");
			}else {
				out.println("Not uploaded!!!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		/*
		FileInputStream fis = null;
		PrintWriter out = response.getWriter();
		String id = request.getParameter("idd");
		String title = request.getParameter("title");
		String filename = request.getParameter("myfile");
		out.println(filename);
		File f = new File("c://"+filename);
		String filepath = f.getAbsolutePath();
		out.println(title);
		out.println();
		//out.print(fle);
		
		fis = new FileInputStream(filepath);
		
		out.println("Alamgir Hossain"+fis);
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into files(id,title,file) values(?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, title);
			pst.setBinaryStream(3, fis,(int)filepath.length());
			long r = pst.executeLargeUpdate();
			if(r>0) {
				out.println("File uploaded!!!!");
			}else {
				out.println("Not uploaded!!!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		*/
	}

}
