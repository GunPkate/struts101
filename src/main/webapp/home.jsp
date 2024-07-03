<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<%@page import="java.util.ArrayList" %>
<%@page import="model.Product" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Struts 101</title>
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
	
	<div>
		Session
		<s:if test="#session.role != null">
		    Welcome Back
		</s:if>
		
		<s:else>
		    First Time Here?
		</s:else>
		
		<s:form action="LoadProductTrigger">
			<button type="submit">Go</button>
			<div class="result"></div>
		</s:form>
		
		<s:iterator var="item" value="productList" >
		   <s:property value="name" />
		</s:iterator>

	</div>
	<a href="login.jsp">Login</a><br/>

	
</body>
</html>