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

	<s:form action="loginTrigger">  
		<s:textfield name="user" label="User"></s:textfield>  <br/>
		<s:textfield name="password" label="Password"></s:textfield> <br/>  
		<s:submit value="save"/>
	</s:form>
</body>
</html>