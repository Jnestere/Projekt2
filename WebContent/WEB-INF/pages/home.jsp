<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="home.label.title" /></title>
<link href="<c:url value='/static/style.css' />" type="text/css"
	rel="stylesheet">
</head>
<body>

<div style="float: right">
		<spring:message code="header.label.hello" />
		${formData.username}! <a href="<c:url value='/logout' />"><spring:message
				code="header.link.logout" /></a>
	</div>
	<jsp:include page="header.jsp" />

	<form method="post" action="">
	<div>
	<spring:message
							code="home.label.activity" /><br> <br>

					<br>
					<br>
	  <div class="Title"><spring:message
							code="home.label.title" /></div><br>
		<span class="withMargin"><a href="DBCon"><spring:message
							code="home.label.reloadDatabase" /></a></span><br><br>

			</div>
			<div class="withMargin">
            <a href="AdminLiigiRedaktor" class="home"><spring:message
							code="home.label.adminUnitType" /></a><br>
			  <br> 
                          <a href="AdminYksuseRedaktor"><spring:message
							code="home.label.adminUnit" /></a><br>
			  <br> 
            <a href="AdminAlluvusRaport"><spring:message
							code="home.label.adminRaport" /></a><br>
            			  <br> 
            			  <sec:authorize ifAnyGranted="ROLE_ADMIN">
                          <a href="StruktuuriVaade"><spring:message
							code="home.label.AdminStrukture" /></a>
			</sec:authorize>
			
		</div>
	</form>
</body>
</html>