package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.auth.Roles;

public class PersonneBean implements Serializable{

	private static final long serialVersionUID = 5731163502171657345L;
	
	/* SELECT */
	private Personne fillWith(ResultSet rs) throws SQLException, ClassNotFoundException {
		Personne p = new Personne();
		p.setId(rs.getInt("id_personne"));
		p.setNom(rs.getString("nom_personne"));
		p.setPrenom(rs.getString("prenom_personne"));
		p.setHash(rs.getString("hash_personne"));
		p.setRole(new RoleBean().get(rs.getInt("id_role")));
		
		if(rs.getInt("id_classe") != 0) p.setClasse(new ClasseBean().get(rs.getInt("id_classe")));
		
		return p;
	}
	
	public List<Personne> getAll() throws SQLException, ClassNotFoundException{
		
		List<Personne> personnes = new ArrayList<Personne>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM personnes");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			personnes.add(this.fillWith(rs));
		}
		
		rs.close();
		ps.close();
		
		return personnes;
	}
	
	public List<Personne> getAll(Roles role) throws SQLException, ClassNotFoundException{
		List<Personne> personnes = new ArrayList<Personne>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM personnes WHERE id_role = ?");
		ps.setInt(1, role.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			personnes.add(this.fillWith(rs));
		}
		
		rs.close();
		ps.close();
		
		return personnes;
	}
	
	public List<Personne> getAll(int classe) throws SQLException, ClassNotFoundException{
		List<Personne> personnes = new ArrayList<Personne>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM personnes WHERE id_classe = ?");
		ps.setInt(1, classe);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			personnes.add(this.fillWith(rs));
		}
		
		rs.close();
		ps.close();
		
		return personnes;
	}
	
	public List<Cours> getCours(Personne p) throws ClassNotFoundException, SQLException{
		List<Cours> cours = new ArrayList<Cours>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM presences WHERE id_personne = ?");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cours.add(new CoursBean().get(rs.getInt("id_cours")));
		}
		
		rs.close();
		ps.close();
		
		return cours;
	}
	
	public Personne get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM personnes WHERE id_personne = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Personne p = new Personne();
		while(rs.next()) {
			p = this.fillWith(rs);
		}
		
		rs.close();
		ps.close();
		
		return p;
	}
	
	public Personne get(String login) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM personnes WHERE login_personne = ?");
		ps.setString(1, login);
		
		ResultSet rs = ps.executeQuery();
		Personne p = new Personne();
		while(rs.next()) {
			p = this.fillWith(rs);
		}
		
		rs.close();
		ps.close();
		
		return p;
	}
	
	/* INSERT */
	public void insert(Personne p) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO personnes VALUES (?,?,?,?,?,?,?)");
		ps.setInt(1, p.getId());
		ps.setString(2, p.getNom());
		ps.setString(3, p.getPrenom());
		ps.setString(4, p.getLogin());
		ps.setString(5, p.getHash());
		ps.setInt(6, p.getRole().getId());
		ps.setInt(7, p.getClasse().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Personne p) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM personnes WHERE id_personne = ?");
		ps.setInt(1,p.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Personne p) throws SQLException, ClassNotFoundException {
		String query = "UPDATE personnes SET "
				+ "nom_personne = ?, "
				+ "prenom_personne = ?, "
				+ "login_personne = ?, "
				+ "hash_personne = ?, "
				+ "id_role = ? "
				+ "WHERE id_personne = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setString(1,p.getNom());
		ps.setString(2,p.getPrenom());
		ps.setString(3,p.getLogin());
		ps.setString(4,p.getHash());
		ps.setInt(5,p.getRole().getId());
		ps.setInt(6,p.getId());
		
		ps.executeUpdate();
		ps.close();
	}
}
