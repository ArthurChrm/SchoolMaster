package com.beans;

public class Classe {
	private int id;
	private String niveau;
	
	public Classe() {
		
	}

	public Classe(int id, String niveau) {
		super();
		this.id = id;
		this.niveau = niveau;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNiveau() {
		return niveau;
	}

	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	
	
}
