<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<t:GenericLayout>
	<jsp:attribute name="title">
    Matériel
  </jsp:attribute>

	<jsp:attribute name="body">
	<h1>Matériel</h1>
	
	<table class="table table-hover">
      <thead class="thead-light">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nom de l'objet</th>
          <th scope="col">Prété à</th>
          <th scope="col">Prété le</th>
          <th scope="col">A rendre le</th>
          <th scope="col">Rendre</th>
        </tr>
      </thead>
      <tbody>
      
      
      <c:forEach items="${emprunts}" var="emprunt">					
		<tr>
          <th scope="row">${emprunt.id}</th>
          <td>Inconnu</td>
          <td>${emprunt.personne.prenom} ${emprunt.personne.nom}</td>
		<td>${emprunt.debut}</td>
		<td>${emprunt.fin}</td>			
          <td><button type="button" class="btn btn-success">Rendre</button></td>
        </tr>
		</c:forEach>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#exampleModal"
      id="ajouterClasse">Ajouter un prêt</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'un prêt</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form>
              <div class="form-group">
                <label for="personne">Personne</label>
                <select id="personne" name="classe" class="custom-select">
                  <option value="volvo">Alexis Poupelin</option>
                  <option value="saab">Théo David</option>
                </select>
                
                <label for="nomObjet">Nom de l'objet</label>
                <input type="text" class="form-control" id="nomObjet">
                
                <label for="aRendreLe">A rendre le</label>
                <input type="date" class="form-control" id="aRendreLe">            
                

              </div>
              <!-- <button type="submit" class="btn btn-primary">Créer</button> -->
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Annuler</button>
            <button type="button" class="btn btn-primary">Ajouter le prêt</button>

          </div>
        </div>
      </div>
    </div>
    
  </jsp:attribute>
</t:GenericLayout>