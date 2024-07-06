<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<%@page import="java.util.List" %>
<%@page import="model.Product" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="ISO-8859-1"><title>Struts 101</title>
</head>
<%-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> --%>
<script src="js/jquery-3.7.1.js"></script>
<script>

	$(document).ready(function(){
		

/* 			let a = document.querySelector('.result')
			console.log(123,a) */

	})
	
/* 	function getData(){
		$.ajax({
			type: "POST",
			url: '${pageContext.request.contextPath}/home.jsp',
			success: function(response){
				$('.result').html(response)
				console.log(response)
			}
		})
	} */

</script>
<body>
	<jsp:include page="sharedcomponent/navbar.jsp"/>
	home <br/>
	
	<div class="container">
		Session
		<s:if test="#session.role != null">
		    Welcome Back
		</s:if>
		
		<s:else>
		    First Time Here?
		</s:else>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5">
				<s:form action="LoadProductTrigger">
					<button type="submit">Go</button>
					<!-- <div class="result"></div> -->
				</s:form>
			</div>
			
			<div class="col-1"></div>
			<div class="col-5">
				<s:form action="filterProduct">
					<s:textfield id="searchInput" name="searchInput"></s:textfield>
					<button type="submit">Filter</button>
				</s:form>	
			</div>
		</div>
		<div class="col-12">
				<table id="table-1">
					<thead>
						<tr>
							<th>Name</th>
							<th>Description</th>
							<th>Rating</th>
							<th>price</th>
						</tr>
					</thead>
					
					<s:iterator var="item" value="productList" >
					<tbody>
						<tr>
						   <td><s:property value="name" /></td>
						   <td><s:property value="desc" /></td>
						   <td><s:property value="rating" /></td>
						   <td><s:property value="price" /></td>
						</tr>
					</tbody>
					</s:iterator>
					
				</table>
		</div>
		<br>
	

		<display:table 	id="productTable"  name="productList" pagesize="5" requestURI="">
				<display:column property="name" title="name" ></display:column>
				<display:column property="desc" title="desc" sortable="true"></display:column>
				<display:column property="rating" title="rating" sortable="true"></display:column>
				<display:column property="price" title="price" sortable="true"></display:column>
		</display:table>
		
	</div>
	<a href="login.jsp">Login</a><br/>

	
</body>

<script> 
	const searchNav = document.getElementById("searchNav");
	searchNav.addEventListener("blur",setData)
	function setData(){
		$('#searchInput').val(searchNav.value); 
		console.log($('#searchInput').val());
	}
	
	console.log(searchNav);
	console.log(searchNav.value);
</script>

</html>