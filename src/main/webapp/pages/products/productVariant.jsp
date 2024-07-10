<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<%@page import="java.util.List" %>
<%@page import="model.Product" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="ISO-8859-1"><title>Variants</title>
</head>
<script src="../../js/jquery-3.7.1.js"></script>
<script>
	$(document).ready(()=>getDataVariant())
	function getDataVariant(){
		const params = window.location.href.split('=')
		console.log(params);
		$.ajax({
			type:"GET",
			url: '${pageContext.request.contextPath}/filterProductVariant.action?id=' + params[1] + '&searchInput='+$('#searchInput').val(),
			success: function(response){
				console.log(response)
				$('#productVariant').html('<p>Variants</p>')
			}
		})
	}
	
</script>

<body>
	Product Variants
	<table id="productVariant"></table>
</body>
</html>