<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:GenericLayout>
	<jsp:attribute name="title">
    El�ves
  </jsp:attribute>

	<jsp:attribute name="body">
  
    <h1 class=pb-3>Liste des �l�ves</h1>
  
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
          <td>${eleve.prenom } ${eleve.nom }</td>
          <td>${eleve.classe.niveau}</td>
          <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalModifierEleve" data-whatever="${eleve.id}" id="ajouterClasse">Modifier</button></td>
          <td><form action="eleves" method="POST">
			          	<input type="hidden" value="supprimerEleve" name="action">
			          	<input type="hidden" value="${eleve.id}" name="idEleve">			          	
			          	<button type="submit" class="btn btn-danger">Supprimer</button>
			          </form>
		</td>
        </tr>
		</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAjouterEleve" id="ajouterClasse">Ajouter un �l�ve</button>

	<!-- Modal Ajouter eleve -->
    <div class="modal fade" id="modalAjouterEleve" tabindex="-1"
			aria-labelledby="modalAjouterEleveLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalAjouterEleveLabel">Ajout d'un �l�ve</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="eleves" method="POST">
			<input type="hidden" value="ajouterEleve" name="action">			          	
            
              <div class="form-group">
                <label for="nomEleve">Nom</label>
                <input type="text" class="form-control" id="nomEleve"
									name="nom">
                </div>

<div class="form-group">
                <label for="prenomEleve">Prenom</label>
                <input type="text" class="form-control" id="prenomEleve"
									name="prenom">
                </div>

<div class="form-group">
                <label for="naissanceEleve">Date de naissance</label>
                <input type="date" class="form-control"
									id="naissanceEleve">
                </div>

<div class="form-group">
                <label>Classe de l'�l�ve</label>
                <c:forEach items="${classes}" var="classe">
                	<input type="radio" id="${classe.niveau}"
										name="idClasse" value="${classe.id}">
					<label for="${classe.niveau}">${classe.niveau}</label>
				</c:forEach>
                </div>
              <button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Annuler</button>
            <button type="submit" class="btn btn-primary">Ajouter</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Modal Modifier eleve -->
    <div class="modal fade" id="modalModifierEleve" tabindex="-1"
			aria-labelledby="modalModifierEleveLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalModifierEleveLabel">Modification d'un �l�ve</h5>
            <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="eleves" method="POST">
			<input type="hidden" value="modifierEleve" name="action">
			<input type="hidden" value="temporaire" id="idEleve_modifier" name="idEleve_modifier">			          	
					          	
            
              <div class="form-group">
                <label for="nomEleve">Nom</label>
                <input type="text" class="form-control" id="nomEleve"
									name="nom">
                </div>

<div class="form-group">
                <label for="prenomEleve">Prenom</label>
                <input type="text" class="form-control" id="prenomEleve"
									name="prenom">
                </div>

<div class="form-group">
                <label for="naissanceEleve">Date de naissance</label>
                <input type="date" class="form-control"
									id="naissanceEleve">
                </div>

<div class="form-group">
                <label>Classe de l'�l�ve</label>
                <c:forEach items="${classes}" var="classe">
                	<input type="radio" id="${classe.niveau}"
										name="idClasse" value="${classe.id}">
					<label for="${classe.niveau}">${classe.niveau}</label>
				</c:forEach>
                </div>
              <button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Annuler</button>
            <button type="submit" class="btn btn-primary">Modifier</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <script>
    $("#modalModifierEleve").on('show.bs.modal', function(event){
		var button = $(event.relatedTarget)
		var recipient = button.data("whatever")
		
		var modal = $(this);
		
		console.log(recipient)
		modal.find("#idEleve_modifier").val(recipient)
	})
    </script>
    
  </jsp:attribute>
</t:GenericLayout>