<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
p {
	font-family: 'Jeju Gothic';
	font-size: 50px;
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
			<p id="title">ȸ�ǽ� ����ý���</p>
		</center>
		<div align="center" class="inputEmpNo">
			<p>�� �� �� �� �� �� �� ��</p>
			<input type="text" name="empNo" style="height: 35px; width: 300px"><br>
			<br>
			<button type="submit" class="btn btn-primary">�α���</button>

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
							�ش� ����Ʈ�� �ＺSDS ���������� ���Ǹ� ���� ����������ϴ�.<br> <br> <br>
							1. ������ ������� �α��� ���ּ���.<br> <br> 2. �ＺSDS�� ������� �������� ã�ų�
							�̸��� Ŭ�����ּ���.<br> <br> 3. ������ ȸ�ǽ��� �������ּ���.<br> <br>
							4. ���ϴ� ��¥�� �ð��� ������ �� �����ư�� �����ּ���!!<br> <br>
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