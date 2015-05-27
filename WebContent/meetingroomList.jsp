<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

body{
	font-family: 'Jeju Gothic';
}

p.title{


	font-size: 20px;
	font-weight: bold;
	font-stretch: extra-condensed;
	color: grey;

}

p.finish{

	font-size: 20px;
	font-weight: bold;
	font-stretch: condensed;
	color: red;

}



</style>
</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<body>
<form action="goToReservation.do">
<input type = "hidden" value  = "${buildingNo }" name = "buildingNo">
	<br>
	<div class="container">
	<p class="title">예약하실 회의실을 선택하세요.</p>
		<c:forEach items="${requestScope.meetingroomList }" var="m">
			<c:choose>
				<c:when test="${m.capacity eq 20 }">
					<button type="button" class="btn btn-lg btn-primary" style="width: 150px; height: 150px" disabled="disabled">
						${m.roomNo }&nbsp;호 <br> 수용인원 : ${m.capacity } <br> 
						<p class="finish">당일예약마감!</p>						
					</button>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="roomNo" value="${m.roomNo }">
					<button type="submit" class="btn btn-lg btn-primary" style="width: 150px; height: 150px" >
						${m.roomNo }&nbsp;호 <br> 수용인원 : ${m.capacity }
					</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>

	</div>
</form>
</body>
</html>