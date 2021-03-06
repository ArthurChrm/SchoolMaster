package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Classe;
import com.beans.ClasseBean;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Classes extends HttpServlet {

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

		ClasseBean cb = new ClasseBean();
		List<Classe> classes = new ArrayList<Classe>();
		try {
			classes = cb.getAll();
			
			Map<Classe,Integer> calcul = new HashMap<>();
			for(Classe c : classes) {
				List<Personne> personnes = new PersonneBean().getAll(c.getId());
				calcul.put(c,personnes.size());
			}
			
			req.setAttribute("calcul", calcul);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		req.setAttribute("classes", classes);

		this.getServletContext().getRequestDispatcher("/WEB-INF/Classes.jsp").forward(req, resp);
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
		case "ajouterClasse":
			AjoutClasse(req, resp);
			break;
		case "supprimerClasse":
			SupprimerClasse(req, resp);
			break;
		case "modifierClasse":
			ModifierClasse(req, resp);
			break;
		}
	}

	private void AjoutClasse(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String nomClasse = req.getParameter("nomClasse");
		Classe classe = new Classe();
		classe.setNiveau(nomClasse);

		ClasseBean cb = new ClasseBean();
		try {
			cb.insert(classe);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		resp.sendRedirect(req.getContextPath() + "/classes");
	}

	private void SupprimerClasse(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int idClasse = Integer.parseInt(req.getParameter("idClasse_modifier"));

		ClasseBean classeBean = new ClasseBean();
		try {
			classeBean.delete(classeBean.get(idClasse));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		resp.sendRedirect(req.getContextPath() + "/classes");
	}
	
	private void ModifierClasse(HttpServletRequest req, HttpServletResponse resp) {
		try {
			int idClasse = Integer.parseInt(req.getParameter("idClasse_modifier"));
			String nomClasse = req.getParameter("nomClasse");
			
			ClasseBean classeBean = new ClasseBean();
			Classe classe = classeBean.get(idClasse);
			classe.setNiveau(nomClasse);
			classeBean.update(classe);
			
			resp.sendRedirect(req.getContextPath() + "/classes");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
