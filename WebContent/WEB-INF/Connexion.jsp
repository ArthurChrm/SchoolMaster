<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
  <jsp:attribute name="title">
    Connexion
  </jsp:attribute>

  <jsp:attribute name="body">
  
    <h1 class=pb-3>Connexion</h1>
  
    <form action="connexion" method="POST">
      <div class="form-group">
        <label for="login">Login</label>
        <input name="login" type="text" class="form-control" id="login">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Mot de passe</label>
        <input name="password" type="password" class="form-control" id="exampleInputPassword1">
      </div>
      <button type="submit" class="btn btn-primary">Se connecter</button>
    </form>
  </jsp:attribute>
</t:GenericLayout>