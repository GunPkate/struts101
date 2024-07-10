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
	$(document).ready(()=>getData())
	function getData(){
		const params = window.location.href.split('=')
		console.log(params);
		const url = `${pageContext.request.contextPath}/filterProductVariant.action?id=\${params[1]}&searchInput=$('#searchInput').val()`
		console.log(url)
		$.ajax({
			type:"GET",
			url: url,
			success: function(response){
				console.log(${pageContext.request.contextPath}/)
				let newDataTable = "<tr>";
				newDataTable += `
					<th> Action </th>
					<th> ID </th>
					<th colspan="2" ><center> Color </center></th>
					<th> Remains </th>
				`	
				let newData = null
				if(response != null){
					let newData = response.variant;
					for (let i = 0; i < newData.length; i++) {
						console.log(newData[i]);
						newDataTable += `
						<tr>
							<td class="col-2"> <button class="btn btn-warning">123</button> <button class="btn btn-danger">123</button> </td>
							<td class="col-3"> \${newData[i].id} </td>
							<td class="col-2"> \${newData[i].color} </td>
							<td class="col-2"> \${newData[i].color_code} </td>
							<td class="col-3"> \${newData[i].remains} </td>
						</tr>
						`
					}
				}
				newDataTable += "</tr>";
				$('#productVariant').html(newDataTable)
			}
		})
	}
	
</script>

<body>
	<jsp:include page="../../sharedcomponent/navbar.jsp"/>
	<div class="container">
		Product Variants
		<table id="productVariant" class="col-12"></table>
	</div>
</body>
<script> 
	const searchNav = document.getElementById("searchNav");
	searchNav.addEventListener("blur",setData)
	function setData(){
		$('#searchInput').val(searchNav.value); 
		console.log($('#searchInput').val());
	}
	
	const searchNavBtn = document.getElementById("searchNavBtn");
	searchNavBtn.addEventListener("click",getData)
</script>
</html>