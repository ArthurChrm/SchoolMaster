<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
  <jsp:attribute name="title">
    Présences
  </jsp:attribute>

  <jsp:attribute name="body">
  
    <h1 class=pb-3>Présences</h1>
  
  <div class="row">
			<div class="col-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list"
						href="#list-alexis-poupelin" role="tab" aria-controls="theo-david">
						<div class="d-flex w-100 justify-content-between">
						      <h5 class="mb-1">Histoire - Géographie</h5>
						      <small>Dans 14h25min</small>
						    </div>
						    <p class="mb-1">Du 28/08/2020 14h00 au 28/08/2020 16h00</p>
						    <small>CM2</small>
					</a>
					
					<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list"
						href="#list-theo-david" role="tab" aria-controls="profile">
						<div class="d-flex w-100 justify-content-between">
						      <h5 class="mb-1">Mathématiques</h5>
						      <small>Dans 13h12min</small>
						    </div>
						    <p class="mb-1">Du 28/08/2020 13h00 au 28/08/2020 15h25</p>
						    <small>CM2</small>
					</a>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel"
						aria-labelledby="list-home-list">
						
						<form>
						
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-alexis-poupelin">
							    <label class="form-check-label" for="exampleCheck1">Alexis Poupelin</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-theo-david">
							    <label class="form-check-label" for="exampleCheck1">Théo David</label>
							  </div>
							  
							  <button type="submit" class="btn btn-primary">Confirmer les présences</button>
						</form>
						
					</div>

					<div class="tab-pane fade" id="list-theo-david" role="tabpanel" aria-labelledby="list-profile-list">
						<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel"
							aria-labelledby="list-home-list">
							
							<form>
						
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-alexis-poupelin">
							    <label class="form-check-label" for="exampleCheck1">Alexis Poupelin</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-theo-david">
							    <label class="form-check-label" for="exampleCheck1">Théo David</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-antoine-corgniard">
							    <label class="form-check-label" for="exampleCheck1">Antoine Corgniard</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="check-arthur-cheramy">
							    <label class="form-check-label" for="exampleCheck1">Arthur Cheramy</label>
							  </div>
							  
							  <button type="submit" class="btn btn-primary">Confirmer les présences</button>
						</form>
							
						</div>
					</div>

				</div>
			</div>
		</div>
		
  </jsp:attribute>
</t:GenericLayout>