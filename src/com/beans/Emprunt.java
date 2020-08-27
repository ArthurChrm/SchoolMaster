package com.beans;

import java.sql.Date;

public class Emprunt {
	private int id;
	private int isbn;
	private Date debut;
	private Date fin;
	private boolean rendu;
	private Personne personne;
	
	public Emprunt() {
		
	}

	public Emprunt(int id, int isbn, Date debut, Date fin, boolean rendu, Personne personne) {
		super();
		this.id = id;
		this.isbn = isbn;
		this.debut = debut;
		this.fin = fin;
		this.rendu = rendu;
		this.personne = personne;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public Date getDebut() {
		return debut;
	}

	public void setDebut(Date debut) {
		this.debut = debut;
	}

	public Date getFin() {
		return fin;
	}

	public void setFin(Date fin) {
		this.fin = fin;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	public boolean isRendu() {
		return rendu;
	}

	public void setRendu(boolean rendu) {
		this.rendu = rendu;
	}
	
	
	
}
