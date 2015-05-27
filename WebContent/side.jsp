<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
					<td>${sessionScope.employee.empName}�� �ȳ��ϼ���!
						<button type="submit" class="btn btn-info">�α׾ƿ�</button>
					<c:choose>
						<c:when test="${not empty requestScope.roomNo }">
							<br> �����Ͻ� �ð��� �����ϼ���
						</c:when>
						<c:otherwise>						
							<br> �����Ͻ� ķ�۽��� �����ϼ���
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>${sessionScope.employee.empName}�� �ȳ��ϼ���!
						<button type="submit" class="btn btn-info">�α׾ƿ�</button>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;${building.buildingName } -&nbsp;&nbsp;</td>
					<td>${listSize}���� ȸ�ǽ� ����</td>
					<td align="right"><img src="./img/${building.buildingImg }" style="height: 120px"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</body>
</html>