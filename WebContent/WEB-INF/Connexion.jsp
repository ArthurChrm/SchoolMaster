<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:GenericLayout>
  <jsp:attribute name="title">
    Connexion
  </jsp:attribute>
  
  <jsp:attribute name="body">
  
    <h1 class=pb-3>Connexion</h1>
  
    <form action="connexion" method="POST">
      <div class="form-group">
        <label for="login">Login</label>
        <input name="login" type="text" class="form-control ${feedback.login == null ? '' : 'is-invalid' }" id="login">
        <c:if test="${feedback.login != null}">
        	<div class="invalid-feedback">
        		${feedback.login}
        	</div>
        </c:if>
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Mot de passe</label>
        <input name="password" type="password" class="form-control ${feedback.password == null ? '' : 'is-invalid' }" id="exampleInputPassword1">
      	<c:if test="${feedback.password != null}">
        	<div class="invalid-feedback">
        		${feedback.password}
        	</div>
        </c:if>
      </div>
      <button type="submit" class="btn btn-primary">Se connecter</button>
    </form>
  </jsp:attribute>
</t:GenericLayout>