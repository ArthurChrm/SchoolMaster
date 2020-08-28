<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<t:GenericLayout>
	<jsp:attribute name="title">
    Cours
  </jsp:attribute>

	<jsp:attribute name="body">
  
  <h1 class=pb-3>Liste des cours</h1>
  
    <table class="table table-hover">
      <thead class="thead-light">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Cours</th>
          <th scope="col">Classe</th>
          <th scope="col">Début du cours</th>
          <th scope="col">Fin du cours</th>
          <th scope="col">Modifier</th>
          <th scope="col">Supprimer</th>
        </tr>
      </thead>
      <tbody>
		<c:forEach items="${cours}" var="cour">
		<tr>
          <th scope="row">${ cour.id}</th>
          <td>Inconnu</td>
          <td>${cour.classe.niveau}</td>
          <td>${cour.debut}</td>
          <td>${cour.fin}</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
		</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" id="ajouterClasse">Ajouter un cours</button>

    <div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'un cours</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form>
				<div class="form-group">
	                <label for="nomCours">Nom du cours</label>
	                <input type="text" class="form-control" id="nomCours">
				</div>
                
                <div class="form-group">
	                <label for="nomClasses">Classe</label>
	                <select name="classes" id="nomClasses"
									class="form-control">
					    <option value="CP">CP</option>
					    <option value="CE1">CE1</option>
					    <option value="CE2">CE2</option>
					    <option value="CM1">CM1</option>
					    <option value="CM2">CM2</option>
					</select>
                </div>
                
                <div class="form-group">
	                <label for="debutCours">Début du cours</label>
	                <input type="date" class="form-control" id="debutCours">
				</div>
				
				<div class="form-group">
	                <label for="finCours">Fin du cours</label>
	                <input type="date" class="form-control" id="finCours">
	            </div>
	            
              <!-- <button type="submit" class="btn btn-primary">Créer</button> -->
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
							data-dismiss="modal">Annuler</button>
            <button type="button" class="btn btn-primary">Ajouter le cours</button>

          </div>
        </div>
      </div>
    </div>

  </jsp:attribute>
</t:GenericLayout>