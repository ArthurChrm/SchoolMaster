package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Emprunt;
import com.beans.EmpruntBean;
import com.beans.MaterielBean;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Materiel extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN, Roles.DIRECTEUR, Roles.ELEVE, Roles.PROF);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Redirect if not logged
		if (req.getSession().getAttribute("user") == null) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}

		// Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if (!autorized.contains(user.getRole().getEnum())) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		
		EmpruntBean eb = new EmpruntBean();
		List<Emprunt> emprunts = null;
		try {
			emprunts = eb.getAll().stream().filter(e->!e.isRendu()).collect(Collectors.toList());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("emprunts", emprunts);

		req.getServletContext().getRequestDispatcher("/WEB-INF/Materiel.jsp").forward(req, resp);
	}

}
