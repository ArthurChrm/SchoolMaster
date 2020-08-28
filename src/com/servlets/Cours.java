package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Classe;
import com.beans.ClasseBean;
import com.beans.CoursBean;
import com.beans.Personne;
import com.beans.Salle;
import com.beans.SalleBean;

public class Cours extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN, Roles.DIRECTEUR, Roles.PROF);

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

		CoursBean coursBean = new CoursBean();
		List<com.beans.Cours> cours = new ArrayList<com.beans.Cours>();
		try {
			cours = coursBean.getAll();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ClasseBean classeBean = new ClasseBean();
		List<Classe> classes = new ArrayList<Classe>();
		try {
			classes = classeBean.getAll();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		req.setAttribute("classes", classes);
		req.setAttribute("cours", cours);

		this.getServletContext().getRequestDispatcher("/WEB-INF/Cours.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

		switch (req.getParameter("action")) {
		case "ajouterCours":
			AjouterCours(req, resp);
			break;
		case "supprimerCours":
			SupprimerCours(req, resp);
			break;
		case "modifierCours":
			ModifierCours(req, resp);
			break;
		}

	}	

	private void AjouterCours(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String nomCours = req.getParameter("nomCours");
			int idClasse = Integer.parseInt(req.getParameter("idClasse"));

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String debutCoursStr = req.getParameter("debutCours");
			String finCoursStr = req.getParameter("finCours");

			Date debutCours = null;
			Date finCours = null;

			debutCours = format.parse(debutCoursStr);
			finCours = format.parse(finCoursStr);

			ClasseBean classeBean = new ClasseBean();
			Classe classe = null;
			classe = classeBean.get(idClasse);

			SalleBean salleBean = new SalleBean();
			Salle salle = null;
			salle = salleBean.get(1);

			com.beans.Cours cours = new com.beans.Cours();
			cours.setDebut(new java.sql.Date(debutCours.getTime()));
			cours.setFin(new java.sql.Date(finCours.getTime()));
			cours.setClasse(classe);
			cours.setSalle(salle);

			CoursBean courBean = new CoursBean();
			courBean.insert(cours);

			resp.sendRedirect(req.getContextPath() + "/cours");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void SupprimerCours(HttpServletRequest req, HttpServletResponse resp) {
		try {
			int idCours = Integer.parseInt(req.getParameter("idCours"));

			CoursBean coursBean = new CoursBean();
			coursBean.delete(coursBean.get(idCours));

			resp.sendRedirect(req.getContextPath() + "/cours");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ModifierCours(HttpServletRequest req, HttpServletResponse resp) {
		try {
			
			int idCours = Integer.parseInt(req.getParameter("idCours_modifier"));
			
			String nomCours = req.getParameter("nomCours");
			int idClasse = Integer.parseInt(req.getParameter("idClasse"));

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String debutCoursStr = req.getParameter("debutCours");
			String finCoursStr = req.getParameter("finCours");

			Date debutCours = null;
			Date finCours = null;

			debutCours = format.parse(debutCoursStr);
			finCours = format.parse(finCoursStr);

			ClasseBean classeBean = new ClasseBean();
			Classe classe = null;
			classe = classeBean.get(idClasse);

			CoursBean courBean = new CoursBean();
			com.beans.Cours cour = courBean.get(idCours);
			cour.setClasse(classe);
			cour.setDebut(new java.sql.Date(debutCours.getTime()));
			cour.setFin(new java.sql.Date(finCours.getTime()));
			courBean.update(cour);
			
			resp.sendRedirect(req.getContextPath() + "/cours");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
