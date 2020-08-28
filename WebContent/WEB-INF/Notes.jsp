<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:GenericLayout>
	<jsp:attribute name="title">
		Notes
	</jsp:attribute>

	<jsp:attribute name="body">
	
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
						<a class="list-group-item list-group-item-action ${loop.index == 0 ? 'active' : ''}" id="list-${eleve.id}-list" data-toggle="list"
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
									</tr>
								</thead>
								<c:forEach items="${notes[eleve.login]}" var="note" varStatus="loop">
									<tbody>
										<tr>
											<th scope="row">${loop.index+1}</th>
											<td>${note.description}</td>
											<td>${note.valeur}/20</td>
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

            <form action="notes" method="GET">
              <div class="form-group">
                <label for="classeEleve">Elève</label>
                <select id="classeEleve" name="eleve" class="custom-select">
	                <c:forEach items="${eleves}" var="eleve">
	                	<option value="${eleve.id}">${eleve.prenom} ${eleve.nom}</option>
	                </c:forEach>
                </select>
                
                <label for="matiereNote">Matière</label>
                <input type="text" class="form-control" id="matiereNote" name="matiere">
                
                <label for="noteEleve">Note</label>
                <input type="number" class="form-control" id="noteEleve" name="note">

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

	</jsp:attribute>
</t:GenericLayout>