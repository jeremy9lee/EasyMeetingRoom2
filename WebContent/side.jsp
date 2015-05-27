<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.side {
	font-family: 'Jeju Gothic';
	font-size: 30px;
	font-weight: bold;
	font-stretch: extra-condensed;
	color: grey;
	margin-left: 100px;

}
</style>
</head>
<body>
<form action="logout.do">
	<table height="150px" class="side">
		<c:choose>
			<c:when test="${empty requestScope.building }">
				<tr>
					<td>${sessionScope.employee.empName}님 안녕하세요!
						<button type="submit" class="btn btn-info">로그아웃</button>
					<c:choose>
						<c:when test="${not empty requestScope.roomNo }">
							<br> 예약하실 시간을 선택하세요
						</c:when>
						<c:otherwise>						
							<br> 예약하실 캠퍼스를 선택하세요
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>${sessionScope.employee.empName}님 안녕하세요!
						<button type="submit" class="btn btn-info">로그아웃</button>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;${building.buildingName } -&nbsp;&nbsp;</td>
					<td>${listSize}개의 회의실 보유</td>
					<td align="right"><img src="./img/${building.buildingImg }" style="height: 120px"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</body>
</html>