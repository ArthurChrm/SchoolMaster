<%@tag description="LA DESCRIPTION" pageEncoding="UTF-8"%>

<%@attribute name="header" fragment="true"%>
<%@attribute name="title" fragment="true"%>
<%@attribute name="body" fragment="true"%>

<html>

<head>
	<link rel="icon" href="src/classroom.svg" sizes="any" type="image/svg+xml">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

	<jsp:invoke fragment="header" />

	<title>
		<jsp:invoke fragment="title" />
	</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/SchoolMaster">School Master</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/SchoolMaster">Accueil</a></li>

				<li class="nav-item"><a class="nav-link" href="/SchoolMaster/classes">Classes</a></li>
				<li class="nav-item"><a class="nav-link" href="/SchoolMaster/cours">Cours</a></li>
				<li class="nav-item"><a class="nav-link" href="/SchoolMaster/eleves">Elèves</a></li>
				<li class="nav-item"><a class="nav-link" href="/SchoolMaster/presences">Présences</a></li>
				<li class="nav-item"><a class="nav-link" href="/SchoolMaster/notes">Notes</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Matériel</a></li>
			</ul>
			<%@ include file="../Partial_Login.jsp"%>
		</div>
	</nav>

	<div class="container mt-5">
		<jsp:invoke fragment="body" />
	</div>

<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">© SchoolMaster - Les Esperluettes 2020</span>
  </div>
</footer>

</body>

</html>