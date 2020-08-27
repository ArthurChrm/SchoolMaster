<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
	<jsp:attribute name="title">
      Elèves
    </jsp:attribute>

	<jsp:attribute name="body">
      <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Prenom / Nom</th>
      <th scope="col">Date de naissance</th>
      <th scope="col">Classe</th>
      <th scope="col">Modifier</th>
      <th scope="col">Supprimer</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Alexis Poupelin</td>
      <td>25/08/2008</td>
      <td>CE2</td>
      <td><button type="button" class="btn btn-info">Modifier</button></td>
      <td><button type="button" class="btn btn-danger">Supprimer</button></td>
    </tr>
    <tr>
      <th scope="row">1</th>
      <td>Théo David</td>
      <td>12/04/2009</td>
      <td>CM1</td>
      <td><button type="button" class="btn btn-info">Modifier</button></td>
      <td><button type="button" class="btn btn-danger">Supprimer</button></td>
    </tr>
  </tbody>
</table>

<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" id="ajouterClasse">Ajouter un élève</button>
			
			<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajout d'un élève</h5>
        <button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
		        <form>
		  <div class="form-group">
			    <label for="nomEleve">Nom</label>
			    <input type="text" class="form-control" id="nomEleve">
			    
			    <label for="prenomEleve">Prenom</label>
			    <input type="text" class="form-control" id="prenomEleve">
			    
			    <label for="naissanceEleve">Date de naissance</label>
			    <input type="date" class="form-control" id="naissanceEleve">
			    
			    <label for="classeEleve">Classe de l'élève</label>
			  <select id="classeEleve" name="classe" class="custom-select">
			    <option value="volvo">CP</option>
			    <option value="saab">CE1</option>
			    <option value="fiat">CE2</option>
			    <option value="audi">CM1</option>
			    <option value="audi">CM2</option>
			  </select>	
  
		  </div>
		  <!-- <button type="submit" class="btn btn-primary">Créer</button> -->
		</form>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
							data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary">Ajouter</button>
        
      </div>
    </div>
  </div>
</div>
    </jsp:attribute>
</t:GenericLayout>