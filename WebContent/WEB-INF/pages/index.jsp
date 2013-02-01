<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title><spring:message code="home.label.title"/></title>
	<meta 	http-equiv="Content-Type" 	content="text/html; charset=UTF-8">
	<link  	type="text/css"				rel="stylesheet"	 href="./css/style.css">
</head>
<body>
<div style="float: right">
		<spring:message code="header.label.hello" />
		${formData.username}! <a href="<c:url value='/logout' />"><spring:message
				code="header.link.logout" /></a>
	</div>

	<div id="header">
		<jsp:include page="header.jsp"/>
	
	</div>	
	
	<div id="content">
		<p class="lPad100">		
					
 			
			<br><br><br><br><br>

			<spring:message code="home.label.title"/><br><br>
			<sec:authorize ifAnyGranted="ROLE_ADMIN">
				<spring:message code="home.label.reloadDatabase"/>
				<a href="insertTestData">
					<spring:message code="home.label.reloadDatabase"/>
				</a><br><br><br>
				
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			<a href="adminLiigiRedaktor"><spring:message code="home.label.adminUnitType"/></a><br><br>
			<a href="adminLiigiRedaktor"><spring:message code="home.label.adminUnit"/></a><br><br> 
		</sec:authorize>
			
		<a href="naitaAlluvusRaport"><spring:message code="home.label.adminRaport"/></a><br><br>
		<a href="naitaStruktuuriVaade"><spring:message code="home.label.AdminStrukuture"/></a><br><br> 
		<br><br><br> 			

			</sec:authorize>

		</p>
	</div>

	

</body>
</html>