package com.beans;

public class Presence {
	private Cours cours;
	private Personne personne;
	private boolean present;
	
	public Presence() {
		
	}

	public Presence(Cours cours, Personne personne, boolean present) {
		super();
		this.cours = cours;
		this.personne = personne;
		this.present = present;
	}

	public Cours getCours() {
		return cours;
	}

	public void setCours(Cours cours) {
		this.cours = cours;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	public boolean isPresent() {
		return present;
	}

	public void setPresent(boolean present) {
		this.present = present;
	}
	
	
}
