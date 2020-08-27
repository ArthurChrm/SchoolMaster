<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
	<jsp:attribute name="title">
		Notes
	</jsp:attribute>

	<jsp:attribute name="body">

  <h1 class=pb-3>Liste des notes</h1>

		<div class="row">
			<div class="col-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list"
						href="#list-alexis-poupelin" role="tab" aria-controls="theo-david"><h5>Alexis Poupelin</h5><small>CM1</small></a>
					<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list"
						href="#list-theo-david" role="tab" aria-controls="profile"><h5>Theo David</h5><small>CM2</small></a>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel"
						aria-labelledby="list-home-list">
						<table class="table table-hover">
							<thead class="thead-light">
								<tr>
									<th scope="col">#</th>
									<th scope="col">Matière</th>
									<th scope="col">Note</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<th scope="row">1</th>
									<td>Mathématiques</td>
									<td>17/20</td>
								</tr>

								<tr>
									<th scope="row">2</th>
									<td>Lecture</td>
									<td>13/20</td>
								</tr>

							</tbody>
						</table>
					</div>

					<div class="tab-pane fade" id="list-theo-david" role="tabpanel" aria-labelledby="list-profile-list">
						<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel"
							aria-labelledby="list-home-list">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Matière</th>
										<th scope="col">Note</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<th scope="row">1</th>
										<td>Mathématiques</td>
										<td>15/20</td>
									</tr>

									<tr>
										<th scope="row">2</th>
										<td>Lecture</td>
										<td>15/20</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		<button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#exampleModal"
      id="ajouterClasse">Ajouter une note</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout dune note</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form>
              <div class="form-group">
                <label for="classeEleve">Elève</label>
                <select id="classeEleve" name="classe" class="custom-select">
                  <option value="volvo">Alexis Poupelin</option>
                  <option value="saab">Théo David</option>
                </select>
                
                <label for="matiereNote">Matière</label>
                <input type="text" class="form-control" id="matiereNote">
                
                <label for="noteEleve">Note</label>
                <input type="number" class="form-control" id="noteEleve">

              </div>
              <!-- <button type="submit" class="btn btn-primary">Créer</button> -->
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
            <button type="button" class="btn btn-primary">Ajouter</button>

          </div>
        </div>
      </div>
    </div>

	</jsp:attribute>
</t:GenericLayout>