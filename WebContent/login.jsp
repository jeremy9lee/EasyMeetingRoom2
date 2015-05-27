<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
p {
	font-family: 'Jeju Gothic';
	font-size: 25px;
	font-weight: bold;
	font-stretch: extra-condensed;
	color: grey;
}

#title {
	font-family: 'Jeju Gothic';
	font-size: 40px;
	font-weight: bold;
	font-stretch: extra-condensed;
	color: gray;
}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>


	<form action="login.do" method="post">
 
		<center>
			<img src="img/sds.jpg">
			<p id="title">회의실 예약시스템</p>
		</center>
		<div align="center" class="inputEmpNo">
			<p><small>사 번 을 입 력 하 세 요</small></p>
			<input type="text" name="empNo" style="height: 35px; width: 300px"><br>
			<br>
			<button type="submit" class="btn btn-primary">로그인</button>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">How to Use</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">How to Use</h4>
						</div>
						<div class="modal-body">
							해당 사이트는 삼성SDS 임직원들의 편의를 위해 만들어졌습니다.<br> <br> <br>
							1. 본인의 사번으로 로그인 해주세요.<br> <br> 2. 삼성SDS의 사업장을 지도에서 찾거나
							이름을 클릭해주세요.<br> <br> 3. 예약할 회의실을 선택해주세요.<br> <br>
							4. 원하는 날짜와 시간을 선택한 후 예약버튼을 눌러주세요!!<br> <br>
						</div>
						<ul class="pager">
							<li><a href="">Previous</a></li>
							<li><a href="">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>