#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CLASSES
#------------------------------------------------------------

CREATE TABLE CLASSES(
        id_classe     Int  Auto_increment  NOT NULL ,
        niveau_classe Varchar (50) NOT NULL
	,CONSTRAINT CLASSES_PK PRIMARY KEY (id_classe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ROLES
#------------------------------------------------------------

CREATE TABLE ROLES(
        id_role  Int  Auto_increment  NOT NULL ,
        nom_role Varchar (50) NOT NULL
	,CONSTRAINT ROLES_PK PRIMARY KEY (id_role)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PERSONNES
#------------------------------------------------------------

CREATE TABLE PERSONNES(
        id_personne     Int  Auto_increment  NOT NULL ,
        nom_personne    Varchar (50) NOT NULL ,
        prenom_personne Varchar (50) NOT NULL ,
        login_personne  Varchar (50) NOT NULL ,
        hash_personne   Varchar (100) NOT NULL ,
        id_role         Int NOT NULL ,
        id_classe       Int
	,CONSTRAINT PERSONNES_PK PRIMARY KEY (id_personne)

	,CONSTRAINT PERSONNES_ROLES_FK FOREIGN KEY (id_role) REFERENCES ROLES(id_role)
	,CONSTRAINT PERSONNES_CLASSES0_FK FOREIGN KEY (id_classe) REFERENCES CLASSES(id_classe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NOTES
#------------------------------------------------------------

CREATE TABLE NOTES(
        id_note          Int  Auto_increment  NOT NULL ,
        valeur_note      Float NOT NULL ,
        description_note Varchar (50) NOT NULL ,
        id_personne      Int NOT NULL
	,CONSTRAINT NOTES_PK PRIMARY KEY (id_note)

	,CONSTRAINT NOTES_PERSONNES_FK FOREIGN KEY (id_personne) REFERENCES PERSONNES(id_personne)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SALLES
#------------------------------------------------------------

CREATE TABLE SALLES(
        id_salle  Int  Auto_increment  NOT NULL ,
        nom_salle Varchar (50) NOT NULL
	,CONSTRAINT SALLES_PK PRIMARY KEY (id_salle)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COURS
#------------------------------------------------------------

CREATE TABLE COURS(
        id_cours    Int  Auto_increment  NOT NULL ,
        debut_cours Datetime NOT NULL ,
        fin_cours   Datetime NOT NULL ,
        id_salle    Int NOT NULL ,
        id_classe   Int NOT NULL
	,CONSTRAINT COURS_PK PRIMARY KEY (id_cours)

	,CONSTRAINT COURS_SALLES_FK FOREIGN KEY (id_salle) REFERENCES SALLES(id_salle)
	,CONSTRAINT COURS_CLASSES0_FK FOREIGN KEY (id_classe) REFERENCES CLASSES(id_classe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EMPRUNTS
#------------------------------------------------------------

CREATE TABLE EMPRUNTS(
        id_emprunt    Int  Auto_increment  NOT NULL ,
        isbn_emprunt  Int NOT NULL ,
        debut_emprunt Datetime NOT NULL ,
        fin_emprunt   Datetime NOT NULL ,
        rendu_emprunt Bool NOT NULL ,
        id_personne   Int NOT NULL
	,CONSTRAINT EMPRUNTS_PK PRIMARY KEY (id_emprunt)

	,CONSTRAINT EMPRUNTS_PERSONNES_FK FOREIGN KEY (id_personne) REFERENCES PERSONNES(id_personne)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MATERIEL
#------------------------------------------------------------

CREATE TABLE MATERIEL(
        id_materiel  Int  Auto_increment  NOT NULL ,
        nom_materiel Varchar (50) NOT NULL
	,CONSTRAINT MATERIEL_PK PRIMARY KEY (id_materiel)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRESENCES
#------------------------------------------------------------

CREATE TABLE PRESENCES(
        id_cours         Int NOT NULL ,
        id_personne      Int NOT NULL ,
        present_presence Bool NOT NULL
	,CONSTRAINT PRESENCES_PK PRIMARY KEY (id_cours,id_personne)

	,CONSTRAINT PRESENCES_COURS_FK FOREIGN KEY (id_cours) REFERENCES COURS(id_cours)
	,CONSTRAINT PRESENCES_PERSONNES0_FK FOREIGN KEY (id_personne) REFERENCES PERSONNES(id_personne)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COURS_MATERIEL
#------------------------------------------------------------

CREATE TABLE COURS_MATERIEL(
        id_materiel Int NOT NULL ,
        id_cours    Int NOT NULL
	,CONSTRAINT COURS_MATERIEL_PK PRIMARY KEY (id_materiel,id_cours)

	,CONSTRAINT COURS_MATERIEL_MATERIEL_FK FOREIGN KEY (id_materiel) REFERENCES MATERIEL(id_materiel)
	,CONSTRAINT COURS_MATERIEL_COURS0_FK FOREIGN KEY (id_cours) REFERENCES COURS(id_cours)
)ENGINE=InnoDB;