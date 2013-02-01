<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/static/style.css' />" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="Title">
		<form action="<c:url value="j_spring_security_check" />" method="POST">
			<table>
				<c:if test="${not empty error}">
					<tr>
						<td colspan="2">
							<div class="errorblock">
								<spring:message code="${error}" />
							</div>
						</td>
					</tr>
				</c:if>
				<tr>
					<td><spring:message code="login.label.username" />:</td>
					<td><input type="text" name="j_username" value=""></td>
				</tr>
				<tr>
					<td><spring:message code="login.label.password" />:</td>
					<td><input type="password" name="j_password" value="" /></td>
				</tr>
				<tr>
					<td colspan="2"><div style="float: right">
							<input type="submit"
								value="<spring:message code="login.button.login"/>" />
						</div></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>