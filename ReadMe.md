# Demande client

```
Un directeur d'école primaire vient vous voir pour simplifier la gestion de son école. 
Son école est actuellement composée de 2 classes par niveaux (CP, CE1, CE2, CM1 et CM2). 
Il souhaite digitaliser les process de gestion :
(les classes, les profs, les élèves, les notes, les présences, les emprunts de bouquin et les demandes de matériels que peuvent faire les profs pour un cours donné).
```

Un directeur d’école fait donc appel à nos services afin de créer un logiciel pour la gestion de son école. Ce logiciel devra permettre de gérer l'ensemble des classes, ainsi que les présences et l’emprunt de matériel.

# Utilisateurs

Le logiciel pourra être utilisé par l’ensemble des membres de l’école, mais sera différent en fonction de leur statut : 

	- Les élèves
	- Les professeurs
	- Le directeur

# Règle de gestion

L’application enregistre une entité Personne en base qui contient les éléments nom et prénom et id_role ; la distinction des personnes se fait avec l’attribut id_role.  </br>
Suivant son rôle une personne peut être : 
- un étudiant,
- un professeur,
- un administrateur (directeur). 
</br>
Chaque personne peut emprunter un livre, cet emprunt est constitué d’un id, de l'isbn du livre, d’une date de début, une date de fin et d’un attribut rendu_emprunt dans le cas où le livre est rendu plus tôt que la date de fin. </br>
Un élève peut consulter ses notes ainsi que le descriptif de la note. Le professeur ajoute des notes à ses élèves. Les élèves assistent à des cours enseignés par les professeurs. </br>
Un cour est composé d’une heure de début et une heure de fin, et elle appartient à une classe et une salle. </br>
Une classe est constitué d’un niveau (CP, CE1…). Une salle est désigné par un nom de salle et un matériel est attribué à chaque salle. 

# Bibliothèques utilisées

Connexion à la base de données </br>
mysql-connector-java-8.0.21.jar
Apache Tomcat </br>
Apache Tomcat V9.0
JRE </br>
jre1.8.0_261


# Environnement de développement

L’ensemble du groupe utilise Eclipse JEE pour développer ce projet. Nous utilisons Git pour la gestion de version. Pour la base de données, nous utilisons MySql (WAMP ou Laravel).
