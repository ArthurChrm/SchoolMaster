<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:GenericLayout>
	<jsp:attribute name="title">
      Notes
    </jsp:attribute>

	<jsp:attribute name="body">
  
		<div class="row">
		  <div class="col-4">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-alexis-poupelin" role="tab" aria-controls="theo-david">Alexis poupelin</a>
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-theo-david" role="tab" aria-controls="profile">Theo David</a>
		    </div>
		  </div>
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel" aria-labelledby="list-home-list">
					<table class="table table-hover">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Matière</th>
					      <th scope="col">Note</th>
					    </tr>
					  </thead>
					  <tbody>
					  
					    <tr>
					      <th scope="row">1</th>
					      <td>Mathématiques</td>
					      <td>17/20</td>
					    </tr>
					    
					    <tr>
					      <th scope="row">1</th>
					      <td>Lecture</td>
					      <td>13/20</td>
					    </tr>
					    
					  </tbody>
					</table>
				</div>
		      
		      <div class="tab-pane fade" id="list-theo-david" role="tabpanel" aria-labelledby="list-profile-list">
					<div class="tab-pane fade show active" id="list-alexis-poupelin" role="tabpanel" aria-labelledby="list-home-list">
					<table class="table table-hover">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Matière</th>
					      <th scope="col">Note</th>
					    </tr>
					  </thead>
					  <tbody>
					  
					    <tr>
					      <th scope="row">1</th>
					      <td>Mathématiques</td>
					      <td>15/20</td>
					    </tr>
					    
					    <tr>
					      <th scope="row">1</th>
					      <td>Lecture</td>
					      <td>15/20</td>
					    </tr>
					    
					  </tbody>
					</table>
				</div>
		      </div>
		      
		    </div>
		  </div>
		</div>
  
    </jsp:attribute>
</t:GenericLayout>