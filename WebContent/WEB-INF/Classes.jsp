<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.beans.Classe"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
	<jsp:attribute name="title">
    Classes
  </jsp:attribute>

	<jsp:attribute name="body">
  
  <h1 class=pb-3>Liste des classes</h1>
  
    <table class="table table-hover">
      <thead class="thead-light">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Classe</th>
          <th scope="col">Nombre d'élève dans la classe</th>
          <th scope="col">Modifier</th>
          <th scope="col">Supprimer</th>
        </tr>
      </thead>
      <tbody>
				<c:forEach items="${classes}" var="classe">					
					
				<tr>
			          <th scope="row">${classe.id}</th>
			          <td>${classe.niveau}</td>
			          <td>Inconnu</td>
			          <td><button type="button" class="btn btn-info">Modifier</button></td>
			          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
				</tr>
				</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" id="ajouterClasse">Ajouter une classe</button>

    <div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'une classe</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="classes" method="POST">
              <div class="form-group">
                <label for="nomClasse">Nom de la classe</label>
                <input type="text" class="form-control" id="nomClasse" name="nomClasse" aria-describedby="nomClasseHelp">
                <small id="nomClasseHelp" class="form-text text-muted">Ce nom pourra être modifié plus tard</small>
              </div>
              <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Annuler</button>
              <button type="submit" class="btn btn-primary">Créer</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <p class="mt-3">
			<i>L'ajout d'un élève à une classe se fait dans la section "Elèves" de ce site web.</i>
		</p>

  </jsp:attribute>
</t:GenericLayout>