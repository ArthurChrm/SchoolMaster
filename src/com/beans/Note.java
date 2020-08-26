package com.beans;

public class Note {
	private int id;
	private float valeur;
	private Personne personne;
	
	public Note() {
		
	}

	public Note(int id, float valeur, Personne personne) {
		super();
		this.id = id;
		this.valeur = valeur;
		this.personne = personne;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getValeur() {
		return valeur;
	}

	public void setValeur(float valeur) {
		this.valeur = valeur;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}
	
	
}
