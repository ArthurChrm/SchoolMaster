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
          <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalModificationCours" data-whatever="${cour.id}" id="modifierCours">Modifier</button></td>
          <td><form action="cours" method="post">
				<input type="hidden" value="supprimerCours" name="action">			          	
				<input type="hidden" value="${cour.id}" name="idCours">
				<button type="submit" class="btn btn-danger">Supprimer</button>
          </form>
          </td>
        </tr>
		</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAjoutCours" id="ajouterCours">Ajouter un cours</button>

	<!-- Modal Ajout de cours -->
    <div class="modal fade" id="modalAjoutCours" tabindex="-1"
			aria-labelledby="modalAjoutCoursLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalAjoutCoursLabel">Ajout d'un cours</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="cours" method="POST">
				<input type="hidden" value="ajouterCours" name="action">			          	

				<div class="form-group">
	                <label for="nomCours">Nom du cours</label>
	                <input type="text" class="form-control" id="nomCours"
									name="nomCours">
				</div>
                
                <div class="form-group">
	                	<c:forEach items="${classes}" var="classe">
								<input type="radio" id="${classe.niveau}" name="idClasse"
										value="${classe.id}">
						  		<label for="${classe.niveau}">${classe.niveau}</label>
									<br>
						</c:forEach>
                </div>
                
                <div class="form-group">
	                <label for="debutCours">Début du cours</label>
	                <input type="date" class="form-control" id="debutCours"
									name="debutCours">
				</div>
				
				<div class="form-group">
	                <label for="finCours">Fin du cours</label>
	                <input type="date" class="form-control" id="finCours"
									name="finCours">
	            </div>
	            
              <button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Annuler</button>
            <button type="submit" class="btn btn-primary">Ajouter le cours</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Modal modification de cours -->
    <div class="modal fade" id="modalModificationCours" tabindex="-1"
			aria-labelledby="modalModificationCoursLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalModificationCoursLabel">Modification d'un cours</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="cours" method="POST">
				<input type="hidden" value="modifierCours" name="action">
				<input type="hidden" value="temporaire" name="idCours_modifier" id="idCours_modifier">			          	
					          	

				<div class="form-group">
	                <label for="nomCours">Nom du cours</label>
	                <input type="text" class="form-control" id="nomCours"
									name="nomCours">
				</div>
                
                <div class="form-group">
	                	<c:forEach items="${classes}" var="classe">
								<input type="radio" id="${classe.niveau}" name="idClasse"
										value="${classe.id}">
						  		<label for="${classe.niveau}">${classe.niveau}</label>
									<br>
						</c:forEach>
                </div>
                
                <div class="form-group">
	                <label for="debutCours">Début du cours</label>
	                <input type="date" class="form-control" id="debutCours"
									name="debutCours">
				</div>
				
				<div class="form-group">
	                <label for="finCours">Fin du cours</label>
	                <input type="date" class="form-control" id="finCours"
									name="finCours">
	            </div>
	            
              <button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Annuler</button>
            <button type="submit" class="btn btn-primary">Modifier le cours</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <script>
    $("#modalModificationCours").on('show.bs.modal', function(event){
		var button = $(event.relatedTarget)
		var recipient = button.data("whatever")
		
		var modal = $(this);
		
		console.log(recipient)
		modal.find("#idCours_modifier").val(recipient)
	})
    </script>
  </jsp:attribute>
</t:GenericLayout>