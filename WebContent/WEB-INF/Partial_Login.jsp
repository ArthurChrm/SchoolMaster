<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${sessionScope.user != null}">
		<div class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        	${sessionScope.user.nom} ${sessionScope.user.prenom} (${sessionScope.user.role.nom})
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="/SchoolMaster/connexion?logout=true">Se déconnecter</a>
	        </div>
      	</div>
	</c:when>
	<c:otherwise>
		<a class="nav-link" href="/SchoolMaster/connexion" tabindex="-1" aria-disabled="true"> Se connecter </a>
	</c:otherwise>
</c:choose>
