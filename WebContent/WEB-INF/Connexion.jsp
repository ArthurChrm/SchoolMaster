<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
	<jsp:attribute name="title">
      Connexion
    </jsp:attribute>

	<jsp:attribute name="body">
      <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Adresse mail</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Mot de passe</label>
    <input type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <button type="submit" class="btn btn-primary">Se connecter</button>
</form>
    </jsp:attribute>
</t:GenericLayout>