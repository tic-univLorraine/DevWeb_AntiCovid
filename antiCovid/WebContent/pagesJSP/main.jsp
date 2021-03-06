<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="SQL.SQLconnector" %>
<!DOCTYPE html>
<head>

  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
 

    <title>antiCovid</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">
    

</head>
<body>
 <nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="../images/logo.png" alt="" width="40" height="40" class="d-inline-block align-text-top">
      AntiCovid
    </a>
    <div class="d-flex">
    	<%
    		User user = (User) request.getSession().getAttribute("current_user");
			if(user != null) {
				out.println("<a href='compte.jsp'><img alt='Compte' src='"+user.getUrl()+"' width='30' height='30'></a>");
				out.println("<a class='btn btn-outline-danger mx-4' href='../deconnexionServlet'>DECONNEXION</a>");
			}else{
				out.println("<a class='btn btn-outline-danger mx-2' href='inscription.jsp'>INSCRIPTION</a>");
				
				out.println("<a class='btn btn-danger mx-2' href='connexion.jsp'>CONNEXION</a>");
			}
		%>
    </div>
  </div>
</nav>

    <main role="main">

      <div class="jumbotron bg-danger">
        <div class="container">
          <h1 class="display-3">Bienvenue sur AntiCovid!</h1>
          <p>Soyez au courant des dernières nouvelles concernant le Covid-19 et votre entourage.</p>
        </div>
      </div>
   <div class="container-fluid">
   <div class="row">
   <div class='col'>
   </div>
   <div class='col-8'>
   <div class="container ">
       <% if(request.getAttribute("msg-err") != null ){
    	   	out.print("<div class=\"container\">");
    	   		out.print("<div class=\"row\">");
    	   			out.print("<div class=\"col-md-12\">");
    	   				out.print("<div class=\"alert alert-danger\" role=\"alert\">");
    	   					out.print(request.getAttribute("msg-err"));
    	   				out.print("</div>");
    	   			out.print("</div>");
    	   		out.print("</div>");
    	   	out.print("</div>");
       	   }
       %>
   
       <div class="row">
       		<%
       			if(user != null) {
       				out.println("<div class='row'>");
					out.println("<a class='btn btn-outline-danger mx-2' role='button' href='activite.jsp'>Activités</a>");
					out.println("<a class='btn btn-outline-danger mx-2' role='button' href='amis.jsp'>Amis</a>");
					out.println("<a class='btn btn-outline-danger mx-2' role='button' href='notifs.jsp'>Notifications</a>");
					if(user.getRole().equals("admin")) {
						out.println("<a class='btn btn-outline-danger mx-2' role='button' href='admin.jsp'>Gérer le site (admin)</a>");
					}
					out.println("</div>");
				}
			%>
       </div>
       <br><br><br><br><br><br>
       <div class="row">
    		<div class="col">
      			<p>Lieux de vaccination COVID-19:</p>
       			<a href="https://www.sante.fr/cf/centres-vaccination-covid.html/" target="_blank">
        			 <img alt="vaccination" src="../images/vaccination.png"
         				width="128" height="128" class="mx-5">
     		 	</a>
    		</div>
    		<div class="col">
     		 	<p>Lieux de dépistage COVID-19:</p>
       			<a href="https://www.sante.fr/cf/centres-depistage-covid.html/" target="_blank">
         			<img alt="depistage" src="../images/testing.png"
         				width="128" height="128" class="mx-5">
     			</a>
   		 	</div>
		</div>
		</div>
	</div>
	<div class="col">
		<%
       			if(user != null) {
       				if(!user.getACovid()){
						out.println("<a class='btn btn-danger mx-2' role='button' href='../declarerPositifServlet'>Je suis positif au Covid</a>");
       				}
       				else{
       					out.println("<a class='btn btn-danger mx-2' role='button' href='../annulerPositifServlet'>Je ne suis plus positif au Covid</a>");
       				}
       			}
		%>
	</div>
	</div>
	</div>
	</main>

   

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>