<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<body>
	<div class="navbar navbar-expand-lg navbar-dark bg-dark text-white">
		<a class="navbar-brand" href="home.jsp">Struts Shop</a>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		        <a class="nav-link" href="#">Product</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Link</a>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Dropdown
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="#">Action</a>
		          <a class="dropdown-item" href="#">Another action</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="#">Something else here</a>
		        </div>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link disabled" href="#">Disabled</a>
		      </li>
		    </ul>
		    <form class="form-inline my-2 my-lg-0">
		      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="searchNav">
		      <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		    
		    <a class="btn btn-success my-2 my-sm-0 ml-2" type="submit" href="login.jsp">Login</a>
		    <div class="btn btn-success my-2 my-sm-0 ml-2" >
		    	<s:property value="user"/>
		    	
		    	<s:if test="#session.role != null">
		    		<s:property value="#session.role"/>
				</s:if>
		    </div>
		  </div>
	</div>
</body>

</html>