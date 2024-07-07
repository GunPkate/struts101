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
<meta http-equiv="Content-type" content="text/html" charset="ISO-8859-1"><title>Struts 101</title>
</head>
<%-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> --%>
<script src="js/jquery-3.7.1.js"></script>
<script>

	$(document).ready(function(){	
		getData();
	})
	
 	function getData(textData){
		$('#searchInput').val()
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/filterProduct.action?searchInput='+$('#searchInput').val(),
			success: function(response){	
				let newTableData = `
						<table id="productTable">
							<thead>
								<tr>
									<th class="col-3">Name</th>
									<th class="col-4">Description</th>
									<th class="col-2">Rating</th>
									<th class="col-3">price</th>
								</tr>
							</thead>
							<tbody>								
							`	
				if(response.filterProduct != null && response.filterProduct.length > 0){					
					for (var i = 0; i < response.filterProduct.length; i++) {
						newTableData += `
							<tr> 
							<td class="col-3">` +response.filterProduct[i].name +`</td>` +
							`<td class="col-4">`+response.filterProduct[i].desc +`</td>` +
							`<td class="col-2">`+response.filterProduct[i].rating +`</td>` +
							`<td class="col-3">`+response.filterProduct[i].price +`</td>` +
							`</tr>
						`
					}
				}
				newTableData += `</tbody></table>`
				$('#productTable').html(newTableData);
			}
		}) 
		
/* 		$.getJSON('${pageContext.request.contextPath}/filterProduct.action?searchInput='+$('#searchInput').val(),{})
		.done(function(result){
			console.log('${pageContext.request.contextPath}/filterProduct.action?searchInput='+$('#searchInput').val()) 
		}) */
	} 

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
					<s:hidden id="searchInput" name="searchInput"></s:hidden>
					<!-- <button type="submit">Filter</button> -->
					
				</s:form>	
			</div>
		</div>
		<div class="col-12">
				<table id="productTable">
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
	
	const searchNavBtn = document.getElementById("searchNavBtn");
	searchNavBtn.addEventListener("click",getData)
</script>

</html>