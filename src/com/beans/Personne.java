package com.beans;

public class Personne {
	private int id;
	private String nom;
	private String prenom;
	private Role role;
	private String login;
	private String hash;
	private Classe classe;
	
	public Personne() {
		
	}

	public Personne(int id, String nom, String prenom, Role role, String hash) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.role = role;
		this.hash = hash;
		this.login = this.getLogin();
	}
	
	

	public Personne(int id, String nom, String prenom, Role role, String hash, Classe classe) {
		this(id,nom,prenom,role,hash);
		this.classe = classe;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getLogin() {
		return this.nom.toLowerCase()+"."+this.prenom.toLowerCase();
	}

	public Classe getClasse() {
		return classe;
	}

	public void setClasse(Classe classe) {
		this.classe = classe;
	}
	
	
	
	
	
	
}
