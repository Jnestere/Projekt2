<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="stiil.css">
<title><spring:message code="adminLiigi.label.title"/></title>
</head>

<body>
<div style="float: right">
		<spring:message code="header.label.hello" />
		${formData.username}! <a href="<c:url value='/logout' />"><spring:message
				code="header.link.logout" /></a>
	</div>
	<div id="header">
		<jsp:include page="header.jsp"/><br>
	</div>

		<tr><spring:message code="adminLiigi.label.excuse"/></tr><br><br>
							<tr><spring:message code="adminLiigi.label.excuse2"/></tr><br><br>
							<a href="www.valitsus.ee"><spring:message code="admin.link.Estonia"/></a>
							<a href="https://www.gov.uk/" ><spring:message code="admin.link.UK"/></a>
							<a href="http://www.gov.ru/" target="_blank"><spring:message code="admin.link.Russia"/></a>

					<table width="880px">
						<tr>
							<td width="50%">
								<form method='POST' action='' accept-charset="UTF-8">
									<table width='400px'>
										<tr>
											<td><spring:message code="adminLiigi.label.title"/></td>
											<td><input type="text"
												value="<c:out value='' />" name="kood">
											</td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.name"/></td>
											<td><input name="nimetus" type="text"
												value="<c:out value='' />"></td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.comment"/></td>
											<td><textarea rows="4" cols="30" name="kommentaar"><c:out value="" /></textarea></td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.belong"/></td>
											<td><select name='ylemus'>
													<c:forEach var="ylemus" items="">
														<option value="<c:out value='' />">
															<c:out value="" />
														</option>
													</c:forEach>
											</select></td>
										</tr>
									</table>
									<input type="hidden" name="riigi_admin_yksuse_lik_id"
										value="<c:out value='' />">
						<br>
						
							
								</form>

							</td>
							
							
						</tr>
					</table>

			<p>
              <input type="button"
					value="<spring:message code="adminLiigi.button.back"/>" onClick='window.location.href = "<c:url value='/' />"'>
			
			
	
   

</body>

</html>