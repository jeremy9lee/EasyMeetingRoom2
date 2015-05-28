<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="./css/fullcalendar.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="./css/fullcalendar.print.css" rel="stylesheet" media="print" />
<link href="css/replyform.css" rel="stylesheet"  />
<script src="./lib/moment.min.js"></script>
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="./lib/fullcalendar.min.js"></script>



<script type="text/javascript">
	$(document).ready(function() {

		var id = $("#roomNo").val();
		var empno = $("#empNo").val();
		console.log(id);
		getReservationTable(id, empno);

		var calendar = $("#calendar").fullCalendar({
			defaultView : 'agendaWeek',
			editable : true,
			selectable : true,
			ignoreTimezone : false,
			currentTimezone : 'Asia/Seoul',
			//header and other values
			select : function(start, end, allDay) {
				endtime = moment(end).format('ddd, MMM D, h:mm tt');
				starttime = moment(start).format('ddd, MMM D, h:mm tt');
				console.log(endtime);
				var mywhen = starttime + '  ' + endtime;
				$("#apptStartTime").val(start);
				$("#apptEndTime").val(end);
				$("#apptAllDay").val(allDay);
				$("#when").text(mywhen);
				$("#createEventModal").modal('show');

			}
		});

		$("#submitButton").on('click', function(e) {
			// We don't want this to act as a link so cancel the link action
			alert("���� �����Ͻðڽ��ϱ�?");
			doSubmit();
		});

		function doSubmit() {
			console.log($('#apptStartTime').val());
			console.log($('#apptEndTime').val());
			console.log($('#apptAllDay').val());
			alert("form submitted");

			var start = new Date($('#apptStartTime').val());
			var end = new Date($('#apptEndTime').val());

			$("#calendar").fullCalendar('renderEvent', {
				currentTimezone : 'Asia/Seoul',
				ignoreTimezone : false,
				title : $('#userName').val(),
				start : start,
				end : end,
				allDay : ($('#apptAllDay').val() == "true"),
			}, true);

		}

	});

	function getReservationTable(id, empNo) {

		$.ajax({

			url : "getReservationTable.do",
			dataType : "json",
			data : {
				buildingNo : $("#buildingNo").val(),
				roomNo : id,
				empNo : empNo
			},
			type : "get",
			success : getReservations
		})

	}

	function deleteSelectedReservation(reservedNo, roomNo) {
		$.ajax({

			url : "deleteSelectedReservation.do",
			dataType : "json",
			data : {
				reservedNo : reservedNo,
				roomNo : roomNo
			},
			type : "get",
			success : successDelete
		})

	}

	function successDelete(jsonData) {

		var result = jsonData.success;
		if (result == true) {
			window.location.reload();
		}
	}

	function getReservations(jsonData) {
		console.log("yap");
		var reservationList = jsonData.reservationList;
		var size = jsonData.size;
		var empNo = jsonData.empNo;

		console.log(reservationList);
		console.log(size);
		var temp = "";
		for (var i = 0; i < parseInt(size); i++) {
			var start = new Date(reservationList[i].reservedStart);
			var end = new Date(reservationList[i].reservedEnd);

			console.log(start);
			console.log(end)
			var name = jsonData.employee.empName;
			var id = "";
			temp = reservationList[i].empNo;

			console.log(empNo);
			if (empNo == temp) {

				id = name + "님";
				$("#calendar").fullCalendar('renderEvent', {
					timezone : false,
					title : id,
					start : start,
					end : end,
					backgroundColor : '#6600FF',
					borderColor : '#6600FF',
					allDay : ($('#apptAllDay').val() == "true"),
					editable : false
				}, true);

			} else {
				id = temp.substring(0, 3) + "**님";
				$("#calendar").fullCalendar('renderEvent', {
					timezone : false,
					title : id,
					start : start,
					end : end,
					allDay : ($('#apptAllDay').val() == "true"),
					backgroundColor : '#D1D1E0',
					borderColor : '#D1D1E0',
					editable : false
				}, true);

			}

		}
		console.log(empNo == temp);
		console.log(empNo);
		if (empNo == $("#empNo").val()) {

			var rListByNo = jsonData.rListByNo;
			var rsize = jsonData.rsize;
			var content = "<table class = 'table table-bordered' style = 'margin-left: 3%; margin-right: 3%;'>";

			content += "<tr><th>시작</th><th>끝</th><th>등록시간</th></tr>";
			for (var i = 0; i < parseInt(rsize); i++) {
				var start = new Date(rListByNo[i].reservedStart);
				var end = new Date(rListByNo[i].reservedEnd);
				var enrolled = new Date(rListByNo[i].enrolledDate);

				var startDate = start.getFullYear() + "/"
						+ (start.getMonth() + 1) + "/" + start.getDate() + " "
						+ start.getHours() + ":" + start.getMinutes();
				var endDate = end.getFullYear() + "/" + (end.getMonth() + 1)
						+ "/" + end.getDate() + " " + end.getHours() + ":"
						+ end.getMinutes();
				var enrolledDate = enrolled.getFullYear() + "/"
						+ (enrolled.getMonth() + 1) + "/" + enrolled.getDate()
						+ " " + enrolled.getHours() + ":"
						+ enrolled.getMinutes();

				content += "<tr>";
				content += "<td>" + startDate + "</td>"
				content += "<td>" + endDate + "</td>"
				content += "<td>" + enrolledDate + "</td>"
				content += "<td><input type='button' class= 'btn btn-warning' onclick = deleteSelectedReservation('"
						+ rListByNo[i].reservedNo
						+ "','"
						+ $("#roomNo").val()
						+ "') value = 'X'></td>"
				content += "</tr>";

			}
			content += "</table>"

			$("#list").html(content);
		}

	}
</script>
<style>
body {
	margin: 50px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}


</style>
</head>
<body>

	<form id="createAppointmentForm" class="form-horizontal"
		action="makeReservation.do">
		<input type="hidden" id="empNo" name="empNo"
			value="${employee.empNo }"> <input type="hidden" id="roomNo"
			name="roomNo" value="${roomNo}"> <input type="hidden"
			id="buildingNo" name="buildingNo" value="${buildingNo}">
		<div id="container" align="center" style="width: 100%">
			<div id="calendar" style="width: 53%; float: left; margin-left: 2%"></div>

			<div class="control-group"
				style="width: 40%; float: right; padding-bottom: 5%">
				<label class="control-label" for="inputPatient">사용자:</label>
				<div class="controls">
					<input type="text" name="userName" id="userName"
						tyle="margin: 0 auto;" data-provide="typeahead" data-items="4"
						value="${employee.empName}"
						data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
					<input type="hidden" id="apptStartTime" name="start" /> <input
						type="hidden" id="apptEndTime" name="end" /> <input type="hidden"
						id="apptAllDay" />

				</div>
				<div class="control-group" style="width: 70%">
					<label class="control-label" for="when">When:</label>
					<div class="controls controls-row" id="when"
						style="margin-top: 5px;"></div>
					<br>
					<button type="submit" class="btn btn-primary" id="submitButton">예약하기</button>
				</div>
			</div>
			<div id="list" style="width: 40%; float: right; margin-right: 3%"></div>
		</div>
	</form>
	<div id="container">
		<div id="content">
			<div id="reply">
				<form action="replyInsert.do" method="post">

					<input type="hidden" id="empNo" name="empNo"
						value="${employee.empNo }"> <input type="hidden"
						id="roomNo" name="roomNo" value="${roomNo}"> <input
						type="hidden" id="buildingNo" name="buildingNo"
						value="${buildingNo}">
					<table class = 'table table-bordered'>
						<tr>
							<td>${employee.empName } 님의 댓글 쓰기</td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 style="align:right"><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				
					<c:forEach items="${list }" var="vo">
							<table class = 'table table-bordered'>
								<tr>
									<td style="width: 5%">${vo.REPLYNO }</td>
									<td style="width: 15%">${vo.EMPNAME }</td>
									<td colspan=4; style="text-align:left; padding-left: 3px">${vo.CONTENT }</td><br>
									<td style="width: 10%">
									<c:if test="${vo.EMPNO eq employee.empNo }">
									<a href="replyDelete.do?replyNo=${vo.REPLYNO }&roomNo=${vo.ROOMNO}&buildingNo=${buildingNo}">삭제</a>
									</c:if>
									</td>
								</tr>
							</table>
					</c:forEach> <br>
				</form>
			</div>
		</div>
	</div>



</body>
</html>
