<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:GenericLayout>
  <jsp:attribute name="title">
    Accueil
  </jsp:attribute>

  <jsp:attribute name="body">
  
    <div class="jumbotron shadow">
      <h1 class="display-4">Une nouvelle façon de gérer votre école</h1>
      <p class="lead">Profitez d'une solution profitant des nouvelles technologies pour améliorer la gestion de votre
        établissement.</p>
      <hr class="my-4">
      <c:choose>
      	<c:when test="${sessionScope.user != null}">
      		<p>Vous êtes déja connecté, utilisez le menu en haut de la page pour naviguer</p>
      	</c:when>
      	<c:otherwise>
      		<p>Connectez-vous pour profiter gratuitement de nos outils</p>
      		<a class="btn btn-primary btn-lg" href="/SchoolMaster/connexion" role="button">C'est parti !</a>
      	</c:otherwise>
      </c:choose>
    </div>
  </jsp:attribute>
</t:GenericLayout>