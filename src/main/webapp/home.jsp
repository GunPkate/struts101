<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Struts 101</title>
</head>
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
	</div>
	<a href="login.jsp">Login</a><br/>

	
</body>
</html>