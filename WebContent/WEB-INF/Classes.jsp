<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
  <jsp:attribute name="title">
    Classes
  </jsp:attribute>

  <jsp:attribute name="body">
  
  <h1 class=pb-3>Liste des classes</h1>
  
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Classe</th>
          <th scope="col">Nombre d'élève dans la classe</th>
          <th scope="col">Modifier</th>
          <th scope="col">Supprimer</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>CP 1</td>
          <td>25</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>CP 2</td>
          <td>29</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>CE1</td>
          <td>22</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
        <tr>
          <th scope="row">4</th>
          <td>CE1 2</td>
          <td>16</td>
          <td><button type="button" class="btn btn-info">Modifier</button></td>
          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
        </tr>
      </tbody>
    </table>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
      id="ajouterClasse">Ajouter une classe</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ajout d'une classe</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form>
              <div class="form-group">
                <label for="nomClasse">Nom de la classe</label>
                <input type="text" class="form-control" id="nomClasse" aria-describedby="nomClasseHelp">
                <small id="nomClasseHelp" class="form-text text-muted">Ce nom pourra être modifié plus tard</small>
              </div>
              <!-- <button type="submit" class="btn btn-primary">Crï¿½er</button> -->
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
            <button type="button" class="btn btn-primary">Crï¿½er</button>

          </div>
        </div>
      </div>
    </div>

  </jsp:attribute>
</t:GenericLayout>