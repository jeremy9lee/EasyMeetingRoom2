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
<input type = "hidden" value  = "${buildingNo }" name = "buildingNo">
	<br>
	<div class="container">
	<p class="title">예약하실 회의실을 선택하세요.</p>
		<c:forEach items="${requestScope.meetingroomList }" var="m">
					<input type="hidden" name="roomNo" value="${m.roomNo }">
					<a href = "goToReservation.do?roomNo=${m.roomNo}&buildingNo=${buildingNo}"><button type="button" class="btn btn-primary" style="width: 150px; height: 100px" >
						${m.roomNo }&nbsp;호 <br> 수용인원 : ${m.capacity }</button></a>
		</c:forEach>

	</div>
</body>
</html>