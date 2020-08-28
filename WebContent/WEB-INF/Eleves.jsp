<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:GenericLayout>
	<jsp:attribute name="title">
    Elï¿½ves
  </jsp:attribute>

	<jsp:attribute name="body">
  
    <h1 class=pb-3>Liste des élèves</h1>
  
    <table class="table table-hover">
      <thead class="thead-light">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Prenom / Nom</th>
          <th scope="col">Classe</th>
          <th scope="col">Modifier</th>
          <th scope="col">Supprimer</th>
        </tr>
      </thead>
      <tbody>
      
      
      <c:forEach items="${eleves}" var="eleve">					
				<tr>
          <th scope="row">${eleve.id}</th>
          <td>${eleve.prenom } ${eleve.prenom }</td>
          <td>Inconnu</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
		</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" id="ajouterClasse">Ajouter un élève</button>

    <div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'un élève</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form>
              <div class="form-group">
                <label for="nomEleve">Nom</label>
                <input type="text" class="form-control" id="nomEleve">
                </div>

<div class="form-group">
                <label for="prenomEleve">Prenom</label>
                <input type="text" class="form-control" id="prenomEleve">
                </div>

<div class="form-group">
                <label for="naissanceEleve">Date de naissance</label>
                <input type="date" class="form-control"
									id="naissanceEleve">
                </div>

<div class="form-group">
                <label for="classeEleve">Classe de l'élève</label>
                <select id="classeEleve" name="classe"
									class="custom-select">
                  <option value="volvo">CP</option>
                  <option value="saab">CE1</option>
                  <option value="fiat">CE2</option>
                  <option value="audi">CM1</option>
                  <option value="audi">CM2</option>
                </select>
                </div>
              <!-- <button type="submit" class="btn btn-primary">Créer</button> -->
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
							data-dismiss="modal">Annuler</button>
            <button type="button" class="btn btn-primary">Ajouter</button>

          </div>
        </div>
      </div>
    </div>
  </jsp:attribute>
</t:GenericLayout>