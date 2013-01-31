<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../static/style.css" type="text/css">
<title><spring:message
							code="AlluvusRaport.label.title" /></title>
	</head>
	<body>	
	<div style="float: right">
		<spring:message code="header.label.hello" />
		${formData.username}! <a href="<c:url value='/logout' />"><spring:message
				code="header.link.logout" /></a>
	</div>
	<jsp:include page="header.jsp" />
	
 <div id="sisu">
   <div id="vorm">
   <p>
<c:forEach var="yksuseLiik" items="${AdminLiigid}">
		
		 <form method='POST' action='' accept-charset="UTF-8">
		 <table width="300px">
		 	<tr>
		 		<td width="40%"><spring:message
							code="AlluvusRaport.label.date" /></td>
		 		<td width="60%"><spring:message
							code="AlluvusRaport.label.type" /></td>
				
		 		<td>
		 			
		 		</td>
		 	</tr>
		 	<tr>
		 		<td><input type="text" name="kuupaev" value="" /></td>
		 		<td>
					<select name='liik'>
						<c:forEach var="liik" items="${liigid}">
						 	<option value="<c:out value='${liik.riigi_admin_yksuse_lik_id}' />">
						  		<c:out value="${liik.nimetus}" />
						  	</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<input type="submit" value="<spring:message code="AlluvusRaport.button.refresh"/>">
				</td>
			</tr>
		</table>
		</form>
		<p>
        
		<table border="0" width="300px">
        <tr>
        <td>
			<c:forEach  var="yksus" items="${yksused}">
			<tr class="rida" onmouseover="this.className='rida1'" onmouseout="this.className='rida'">
				<td>
				
				<input type="hidden" name="alluv" value="<c:out value='${yksus.riigi_admin_yksuse_liik_id}' />"><c:out value="${yksus.nimetus}" />
</td>
<td align = 'right'>
<input type="button" value="<spring:message code="AlluvusRaport.button.look"/>" onclick='window.location = "AdminYksuseRedaktor?id=<c:out value='${yksus.riigi_admin_yksuse_liik_id}' />"'>
				
				</td>				
			
			</tr>
			</c:forEach>
		</table>
		</c:forEach>
		<div align="right">
			
				<input type="submit"
						value="<spring:message code="AlluvusRaport.button.back"/>" onclick='window.location.href="/delfi"'>
			</div>
	</div>
	</div>
	</body>
</html>