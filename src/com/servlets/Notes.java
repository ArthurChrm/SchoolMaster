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
import com.beans.Note;
import com.beans.NoteBean;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Notes extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR,Roles.PROF);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		
		try {
			//Load students
			List<Personne> eleves = new PersonneBean().getAll(Roles.ELEVE);
			
			//Filter if class in GET
			String classe_id = req.getParameter("classe");
			if(classe_id != null && !classe_id.isEmpty()) {
				int classe = Integer.parseInt(classe_id);
				
				if(classe != -1) {
					List<Personne> filtered_eleves = new ArrayList<>();
					for(Personne eleve : eleves) {
						if(eleve.getClasse() != null && eleve.getClasse().getId() == classe) filtered_eleves.add(eleve);
						if(eleve.getClasse() == null && classe == 0) filtered_eleves.add(eleve);
					}
					
					req.setAttribute("eleves", filtered_eleves);
				}else {
					req.setAttribute("eleves", eleves);
				}
			}else {
				req.setAttribute("eleves", eleves);
			}
			
			
			
			//Load notes
			Map<String,List<Note>> elevesNotes = new HashMap<>();
			for(Personne p : eleves) {
				List<Note> notes = new NoteBean().getAll(p);
				elevesNotes.put(p.getLogin(),notes);
			}
			req.setAttribute("notes", elevesNotes);
			
			//Load classes
			List<Classe> classes = new ClasseBean().getAll();
			req.setAttribute("classes", classes);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Notes.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	

}
