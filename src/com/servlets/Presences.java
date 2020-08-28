package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.CoursBean;
import com.beans.Personne;

public class Presences extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR,Roles.PROF);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Load
		try {
			List<com.beans.Cours> cours = new CoursBean().getAll();
			System.out.print(cours);
			req.setAttribute("cours", cours);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Presences.jsp").forward(req, resp);
	}

}
