<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:GenericLayout>
	<jsp:attribute name="title">
    Présences
  </jsp:attribute>

	<jsp:attribute name="body">
  
    <h1 class=pb-3>Présences</h1>
  
	<div class="row">
		<div class="col-4">
			<div class="list-group" id="list-tab" role="tablist">
				<c:forEach items="${cours}" var="cours">
					<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-alexis-poupelin" role="tab" aria-controls="theo-david">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">Unknown</h5>
							<small>Dans 14h25min</small>
						</div>
						<p class="mb-1">
							Du <fmt:formatDate type="both" value="${cours.debut}" pattern="dd/MM/yyyy HH:mm"/> au <fmt:formatDate type="BOTH" value="${cours.fin}" pattern="dd/MM/yyyy HH:mm"/>
						</p>
						<small>${cours.classe.niveau}</small>
					</a>
				</c:forEach>
			</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-alexis-poupelin"
						role="tabpanel" aria-labelledby="list-home-list">
						
						<form>
						
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
									id="check-alexis-poupelin">
							    <label class="form-check-label" for="exampleCheck1">Alexis Poupelin</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
									id="check-theo-david">
							    <label class="form-check-label" for="exampleCheck1">Théo David</label>
							  </div>
							  
							  <button type="submit" class="btn btn-primary">Confirmer les présences</button>
						</form>
						
					</div>

					<div class="tab-pane fade" id="list-theo-david" role="tabpanel"
						aria-labelledby="list-profile-list">
						<div class="tab-pane fade show active" id="list-alexis-poupelin"
							role="tabpanel" aria-labelledby="list-home-list">
							
							<form>
						
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
										id="check-alexis-poupelin">
							    <label class="form-check-label" for="exampleCheck1">Alexis Poupelin</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
										id="check-theo-david">
							    <label class="form-check-label" for="exampleCheck1">Théo David</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
										id="check-antoine-corgniard">
							    <label class="form-check-label" for="exampleCheck1">Antoine Corgniard</label>
							  </div>
							  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input"
										id="check-arthur-cheramy">
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