package com.musica.web.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.musica.db.dao.Cartdbdao;

@WebServlet("/views/updatecart")
public class ModifyQty extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		String email = (String) session.getAttribute("email");
		
		Cartdbdao cartdb = new Cartdbdao();
		
		out.println("Loading ... ");
		try {
			boolean updatecart = cartdb.updateCart(email,pid,qty); 
			if(updatecart) {
				response.sendRedirect("./cart.jsp");
			}else out.println("error while adding to cart");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
