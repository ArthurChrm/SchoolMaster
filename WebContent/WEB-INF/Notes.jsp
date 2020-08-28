<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:GenericLayout>
	<jsp:attribute name="title">
		Notes
	</jsp:attribute>

	<jsp:attribute name="body">
	<script type="text/javascript">
		$(document).ready(function(){
			updateEleveForm();
			$('#exampleModal').on('show.bs.modal', function (e) {
				updateEleveForm();
			})
		});
	
		function updateEleveForm(){
			let id = document.querySelector("#list-tab .active").getAttribute('aria-controls');
			let name = document.querySelector("#list-tab .active h5").innerHTML;
			document.querySelector("#eleveText").value = name;
			document.querySelector("#eleveTextId").value = id;
		}
		
		function updateEditNoteForm(id,matiere,note){
			document.querySelector("#noteIdEdit").value = id;
			document.querySelector("#matiereEditNote").value = matiere;
			document.querySelector("#noteEdit").value = note;
		}
	</script>
	
  	<h1 class=pb-3>Liste des notes</h1>

		<div class="row">
			<div class="col-4">
				<form action="notes" method="GET">
					<div class="form-group">
                	<select id=searchForm name="classe" class="custom-select" onchange="this.form.submit()">
		                <c:forEach items="${classes}" var="classe">
		                	<option value="-1" ${param.classe == null || param.classe == -1 ? 'selected' : ''}>Toutes les classes</option>
		                	<option value="0" ${param.classe == 0 ? 'selected' : ''}>Aucune classe renseignée</option>
		                	<option value="${classe.id}" ${param.classe == classe.id ? 'selected' : ''}>${classe.niveau}</option>
		                </c:forEach>
                	</select>
                </div>
				</form>
				<div class="list-group" id="list-tab" role="tablist">
					<c:forEach items="${eleves}" var="eleve" varStatus="loop">
						<a class="list-group-item list-group-item-action ${(feedback.eleve != null && feedback.eleve == eleve.id) || (feedback.eleve == null && loop.index == 0) ? 'active' : ''}" id="list-${eleve.id}-list" data-toggle="list"
						href="#list-${eleve.id}" role="tab" aria-controls="${eleve.id}">
							<h5>${eleve.prenom} ${eleve.nom}</h5>
							<small>${eleve.classe.niveau != null ? eleve.classe.niveau : 'Aucune classe renseignée' }</small>
						</a>
					</c:forEach>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<c:forEach items="${eleves}" var="eleve" varStatus="loopEleve">
						<div class="tab-pane fade ${loopEleve.index == 0 ? 'show active' : ''}" id="list-${eleve.id}" role="tabpanel"
						aria-labelledby="list-${eleve.id}-list">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Matière</th>
										<th scope="col">Note</th>
										<th scope="col">Modifier</th>
										<th scope="col">Supprimer</th>
									</tr>
								</thead>
								<c:forEach items="${notes[eleve.login]}" var="note" varStatus="loop">
									<tbody>
										<tr>
											<th scope="row">${loop.index+1}</th>
											<td>${note.description}</td>
											<td>${note.valeur}/20</td>
											<td>
												<button onclick="updateEditNoteForm(${note.id},'${note.description}',${note.valeur})" type="button" class="btn btn-info mt-3" data-toggle="modal" data-target="#editModal" id="editNote">Modifier</button>
											</td>
											<td>
												<button type="button" class="btn btn-danger">Supprimer</button>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#exampleModal"
      id="ajouterClasse">Ajouter une note</button>
	
	<!--  Create modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'une note</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="notes" method="POST" onshow="updateEleveForm()">
              <div class="form-group">
                <label for="classeEleve">Elève</label>
                <input type="hidden" id="eleveTextId" name="eleve">
                <input type="text" class="form-control" id="eleveText" name="eleveName" disabled>
                
                <label for="matiereNote">Matière</label>
                <input type="text" class="form-control ${feedback.matiere == null ? '' : 'is-invalid' }" id="matiereNote" name="matiere">
                <c:if test="${feedback.matiere != null}">
        			<div class="invalid-feedback">
        				${feedback.matiere}
        			</div>
        		</c:if>
                
                <label for="noteEleve">Note</label>
                <input type="number" class="form-control ${feedback.note == null ? '' : 'is-invalid' }" id="note" name="note">
                <c:if test="${feedback.note != null}">
        			<div class="invalid-feedback">
        				${feedback.note}
        			</div>
        		</c:if>

              </div>
              <div class="modal-footer">
            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
            	<button type="submit" class="btn btn-primary">Ajouter</button>
          	  </div>
            </form>

          </div>
          
        </div>
      </div>
    </div>
    
    <!-- Edit note modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modification d'une note</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form action="notes" method="POST">
              <input type="hidden" id="editFromType" name="postType" value="UPDATE">
              <div class="form-group">
                <input type="hidden" id="noteIdEdit" name="note">
                
                <label for="matiereNote">Matière</label>
                <input type="text" class="form-control ${feedback.matiere == null ? '' : 'is-invalid' }" id="matiereEditNote" name="matiere">
                <c:if test="${feedback.matiere != null}">
        			<div class="invalid-feedback">
        				${feedback.matiere}
        			</div>
        		</c:if>
                
                <label for="noteEleve">Note</label>
                <input type="number" class="form-control ${feedback.note == null ? '' : 'is-invalid' }" id="noteEdit" name="note">
                <c:if test="${feedback.note != null}">
        			<div class="invalid-feedback">
        				${feedback.note}
        			</div>
        		</c:if>

              </div>
              <div class="modal-footer">
            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
            	<button type="submit" class="btn btn-primary">Mettre à jour</button>
          	  </div>
            </form>

          </div>
          
        </div>
      </div>
    </div>
    
    <c:if test="${feedback != null}">
      	<script>
			$('#exampleModal').modal('show')
		</script>
      </c:if>

	</jsp:attribute>
</t:GenericLayout>