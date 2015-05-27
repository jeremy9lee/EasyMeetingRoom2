<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7NLFyHhW1Igytmxokvd8yLKKwphmVzEc&sensor=true&libraries=geometry"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/markerclusterer.js"></script>
</head>

<body>

	<table width = "100%">
		<c:choose>
			<c:when test="${empty requestScope.side }">
				<tr>
					<td height="100%"><jsp:include page="${ requestScope.content}"></jsp:include></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td><jsp:include page="${ requestScope.side}"></jsp:include></td>
				</tr>
				<tr>
					<td><jsp:include page="${ requestScope.content}"></jsp:include></td>
				</tr>
			</c:otherwise>
		</c:choose>

	</table>

</body>
</html>