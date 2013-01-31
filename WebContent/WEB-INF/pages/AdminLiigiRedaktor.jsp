<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../static/style.css" type="text/css">
<title><spring:message code="adminLiigi.label.title" /></title>
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
		
				<c:forEach var="yksuseLiik" items="${AdminLiigid}">

					<table width="880px">
						<tr>
							<td width="50%">
								<form method='POST' action='' accept-charset="UTF-8">
									<table width='400px'>
										<tr>
											<td><spring:message code="adminLiigi.label.code" /></td>
											<td><input type="text"
												value="<c:out value='${yksuseLiik.kood}' />" name="kood">
											</td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.name" /></td>
											<td><input name="nimetus" type="text"
												value="<c:out value='${yksuseLiik.nimetus}' />"></td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.comment" /></td>
											<td><textarea rows="4" cols="30" name="kommentaar"><c:out value="${yksuseLiik.kommentaar}" /></textarea></td>
										</tr>
										<tr>
											<td><spring:message code="adminLiigi.label.belong" /></td>
											<td><select name='ylemus'>
													<c:forEach var="ylemus" items="${ylemused}">
														<option value="<c:out value='${ylemus.riigi_admin_yksuse_lik_id}' />">
															<c:out value="${ylemus.nimetus}" />
														</option>
													</c:forEach>
											</select></td>
										</tr>
									</table>
									<input type="hidden" name="riigi_admin_yksuse_lik_id"
										value="<c:out value='${yksuseLiik.riigi_admin_yksuse_lik_id}' />">
							      <input type='submit' value='<spring:message code="adminLiigi.button.save" />' />
								</form>

							</td>
							<td width="50%">
								<form method='POST' action='' accept-charset="UTF-8">

									<table width="292">
										<tr class="pealkiri">
										
											<td colspan="2"><spring:message code="adminLiigi.label.subordinates" /></td>
										</tr>
										<c:forEach var="alluvus" items="${alluvused}">
											<tr>
				
												<td width="2"><a href="AdminLiigiRedaktor?ID=<c:out value='${alluvus.riigi_admin_yksuse_lik_id}' />">
														<c:out value='${alluvus.nimetus}' />
												</a></td>
												<td width="136" align='right'><input type="hidden" name="alluv"
													value="<c:out value='${alluvus.riigi_admin_yksuse_lik_id}' />"> <input
													type="hidden" name="ylemus"
													value="<c:out value='${yksuseLiik.riigi_admin_yksuse_lik_id}' />"><input
													type='submit' value='<spring:message code="adminLiigi.button.remove" />'></td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="2" align='right'><input type="button"
												value="<spring:message code="adminLiigi.button.add" />"
												onclick='window.location = "LisaAdminLiik?id=<c:out value='${yksuseLiik.riigi_admin_yksuse_lik_id}' />"'>
											</td>
																			<td width="138" align="center">&nbsp;</td>
									</table>
								</form>
							</td>
						</tr>
					</table>

				</c:forEach>
			<p>
              <input type="button"
					value="<spring:message code="adminLiigi.button.back" />" onClick='window.location.href = "/delfi"'>
			
			
	
        </div>
	</div>

</body>

</html>