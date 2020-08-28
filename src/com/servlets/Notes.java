package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
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
import com.sun.xml.internal.bind.marshaller.NoEscapeHandler;

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
		Map<String, String> feedback = new HashMap<String,String>();
		
		//Check postType
		switch(req.getParameter("postType")) {
		case "INSERT":
			String eleve = req.getParameter("eleve");
			String matiere = req.getParameter("matiere");
			String note = req.getParameter("note");
			
			// Validation
			if(eleve == null || eleve.isEmpty()) {
				feedback.put("eleve","Merci de choisir un élève");
			}
			
			if(matiere == null || matiere.isEmpty()) {
				feedback.put("matiere","Merci d'entrer une matière");
			}
			if(note == null || note.isEmpty()) {
				feedback.put("note","Merci d'entrer une note");
			}
			
			if(feedback.isEmpty()) {
				//Save to database
				try {
					Personne p_eleve = new PersonneBean().get(Integer.parseInt(eleve));
					Note newNote = new Note();
					newNote.setPersonne(p_eleve);
					newNote.setValeur(Float.parseFloat(note));
					newNote.setDescription(matiere);
					
					new NoteBean().insert(newNote);
					resp.sendRedirect(req.getContextPath()+"/notes");
					return;
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(!feedback.containsKey("eleve")) {
				feedback.put("eleve",eleve);
				feedback.put("modal","exampleModal");
			}
			
			break;
		case "UPDATE":
			String noteId = req.getParameter("noteId");
			matiere = req.getParameter("matiere");
			note = req.getParameter("note");
			
			// Validation
			feedback = new HashMap<String,String>();
						
			if(noteId == null || noteId.isEmpty()) {
				feedback.put("noteId","Merci de choisir une note");
			}	
			if(matiere == null || matiere.isEmpty()) {
				feedback.put("matiereUpdate","Merci d'entrer une matière");
			}
			if(note == null || note.isEmpty()) {
				feedback.put("noteUpdate","Merci d'entrer une note");
			}			
			
			if(feedback.isEmpty()) {
				try {
					Note noteBean = new NoteBean().get(Integer.parseInt(noteId));
					noteBean.setDescription(matiere);
					noteBean.setValeur(Float.parseFloat(note));
					
					new NoteBean().update(noteBean);
					resp.sendRedirect(req.getContextPath()+"/notes");
					return;
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			feedback.put("modal","editModal");
			feedback.put("matiereEdit",matiere);
			feedback.put("noteId",noteId);
			feedback.put("note",note);
			
			break;
		case "DELETE":
			note = req.getParameter("note");
			
			feedback = new HashMap<String,String>();
			
			if(note == null || note.isEmpty()) {
				feedback.put("note","Merci de choisir une note");
			}
			
			if(feedback.isEmpty()) {
				try {
					Note noteBean = new NoteBean().get(Integer.parseInt(note));
					new NoteBean().delete(noteBean);
					resp.sendRedirect(req.getContextPath()+"/notes");
					return;
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			break;
		}
		
		req.setAttribute("feedback",feedback);
		this.doGet(req, resp);
	}
}
