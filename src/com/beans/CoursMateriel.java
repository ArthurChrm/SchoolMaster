package com.beans;

public class CoursMateriel {
	private Materiel materiel;
	private Cours cours;
	
	public CoursMateriel() {
		
	}

	public CoursMateriel(Materiel materiel, Cours cours) {
		super();
		this.materiel = materiel;
		this.cours = cours;
	}

	public Materiel getMateriel() {
		return materiel;
	}

	public void setMateriel(Materiel materiel) {
		this.materiel = materiel;
	}

	public Cours getCours() {
		return cours;
	}

	public void setCours(Cours cours) {
		this.cours = cours;
	}
	
	
}
