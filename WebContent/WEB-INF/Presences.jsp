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
				<c:forEach items="${cours}" var="cours" varStatus="loop">
					<a class="list-group-item list-group-item-action ${loop.index == 0 ? 'active' : ''}" id="list-${cours.id}-list" data-toggle="list" href="#list-${cours.id}" role="tab" aria-controls="${cours.id}">
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
					<c:forEach items="${cours}" var="cours" varStatus="loopCours">
						<div class="tab-pane fade show ${loopCours.index == 0 ? 'active' : ''}" id="list-${cours.id}"
						role="tabpanel" aria-labelledby="list-${cours.id}-list">
							<form action="presences" method="POST">
								<c:forEach items="${presences[cours]}" var="presence" varStatus="loop">
									<div class="form-group form-check">
									    <input type="checkbox" class="form-check-input"
											id="check-${presence.personne.id}" ${presence.present ? 'checked' : ''}>
									    <label class="form-check-label" for="exampleCheck1">${presence.personne.prenom} ${presence.personne.nom}</label>
								  	</div>
								</c:forEach>
								<button type="submit" class="btn btn-primary">Confirmer les présences</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
  </jsp:attribute>
</t:GenericLayout>