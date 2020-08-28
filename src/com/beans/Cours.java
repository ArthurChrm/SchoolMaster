package com.beans;

import java.sql.Date;

public class Cours {
	private int id;
	private Date debut;
	private Date fin;
	private Classe classe;
	private Salle salle;
	
	public Cours() {
		
	}

	public Cours(int id, Date debut, Date fin, Classe classe, Salle salle) {
		super();
		this.id = id;
		this.debut = debut;
		this.fin = fin;
		this.classe = classe;
		this.salle = salle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Classe getClasse() {
		return classe;
	}

	public void setClasse(Classe classe) {
		this.classe = classe;
	}

	public Salle getSalle() {
		return salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}
}
