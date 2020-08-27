<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${sessionScope.user != null}">
		<a class="nav-link" href="/SchoolMaster/connexion?logout=true" tabindex="-1" aria-disabled="true"> Se déconnecter </a>
	</c:when>
	<c:otherwise>
		<a class="nav-link" href="/SchoolMaster/connexion" tabindex="-1" aria-disabled="true"> Se connecter </a>
	</c:otherwise>
</c:choose>
