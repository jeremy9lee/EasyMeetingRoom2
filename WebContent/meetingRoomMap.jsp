<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>

<style type="text/css">
body{
	font-family: 'Jeju Gothic';
}

.gray {
	color: #666666;
}

#extendedMenu {
	border-left: 0px;
	border-top: 1px solid #999999;
	border-right: 1px solid #999999;
	border-bottom: 1px solid #999999;
	border-radius: 0px 4px 4px 0px;
	padding: 10px 10px 9px 9px;
}

.habitat_mon {
	background-color: #313131;
	height: 90px;
	width: 100%;
	display: block;
	padding: 5px;
}

.habitat_mon_title {
	font-size: 20px;
	color: white;
	font-weight: bold;
	line-height: 45px;
}

.habitat_mon_title h2 {
	font-size: 20px;
	color: white;
	vertical-align: middle;
}

.mon_icon {
	border: 1px;
	float: left;
	position: aboslute;
	text-align: center;
	vertical-align: middle;
	padding-top: 5px;
	padding-left: 5px;
}

.mon_circle {
	position: relative;
}

.habitat_wrapper {
	border: 1px solid;
	margin-top: 15px;
	margin-bottom: 15px;
}

.desc {
	padding: 10px;
}

.title {
	color: white;
	font-size: 20px;
	background-color: blue;
	float: left;
}

.top_menu {
	background-color: #FFBF00;
	height: 60px;
	width: 100%;
	position: fixed;
	z-index: 100;
}

.tag_info {
	display: inline-block;
	width: 72%;
}

.visit_info {
	display: inline-block;
	text-align: right;
	width: 25%;
}

#search_menu_wrapper {
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-color: #999999;
	margin-bottom: 3px;
	position: relative;
	padding-top: 8px;
	padding-bottom: 8px;
	left: 0px;
	top: 0px;
	z-index: 99;
	background-color: #E6E6E6;
	margin-right: 0px;
	margin-left: 0px;
}

#search_menu_left {
	padding-left: 15px;
}

#search_menu_right {
	text-align: right;
	padding-right: 15px;
}

.habitat_title {
	font-size: 16px;
	font-weight: bold;
	padding: 10px;
}

.form-control {
	height: 30px;
}

.form-group {
	float: left;
	margin-right: 5px;
}

.active {
	background-color: #E6E6E6;
	margin: 5px;
}

#list_tab {
	position: absolute;
	top: 55px;
	width: 300px;
	z-index: 3;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
	float: left;
	width: 300px;
	z-index: 3;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
	z-index: 3;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
}

#map_area {
	width: 100%;
}

.info-windows {
	text-align: center;
	width: 150px;
	height: 60px;
	color: #428bca;
	font-family: Jeju Gothic;
	max-width: none;
	padding: 0px;
	margin: 0px;
	border-radius: 10px;
	display: table;
}
/* .info-windows img{ 
		padding:0px;
		margin:0px;
	}
	
	.i-box {
		max-width: none;
		width: 144px;
		height:106px;
		color:#333;
	}
  */
/* .i-str {
		background-color:#fff;
		position:absolute;
		left:32px;
		top:80px;
		height:18px;
		width:106px;
		margin-bottom:1px;
		padding:6px 2px 2px 4px;
	}  */
@media ( max-width :992px) {
	#list_tab {
		display: none;
	}
	#button_area {
		display: none;
	}
}
</style>

<script>
	var markers = [];
	var buildingMarkers = [];
	var autocomplete;
	var iw, places;
	var locX, locY;
	var cityCircle;
	var startLat, startLng, endLat, endLng;
	var myCenter;
	var map;
	var mapProp;
	var markerCluster;

	function initialize() {
		if (navigator.geolocation) {

			navigator.geolocation.getCurrentPosition(function(position) {
				//GPS 정보를 받아와 현재 위치 좌표를 넣어준다.

				myCenter = new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude);

				locX = position.coords.latitude;
				locY = position.coords.longitude;

				//맵설정
				mapProp = {
					center : myCenter,
					zoom : 9,
					mapTypeId : google.maps.MapTypeId.ROADMAP,
					zIndex : 9999
				};
				map = new google.maps.Map(
						document.getElementById("map_canvas"), mapProp);

				//마커 설정
				var marker = new google.maps.Marker({
					position : myCenter,
					map : map,
					animation : google.maps.Animation.BOUNCE
				});

				//마커를 마커 배열에 넣는다.(마커 클리어와 동시에 여러 마커를 꽂기 위해서 배열에 넣어야 함))
				markers.push(marker);

				markerCluster = new MarkerClusterer(map);

				//인포윈도우 설정
				var infowindow = new google.maps.InfoWindow({
					map : map,
					position : myCenter,
					content : '당신의 위치입니다.'
				});

				//마커에 인포윈도우 달기
				infowindow.open(map, marker);
				//인포윈도우 자동 사라짐 설정
				setTimeout(function() {
					infowindow.close()
				}, 2000);
				map.setCenter(myCenter);

				getAllBuildingLocation();

			}, function() {
				handleNoGeolocation(true);
			});
		} else {
			handleNoGeolocation(false);
		}

	}

	function getBuildingLocation(no) {

		$.ajax({

			url : "buildingView.do",
			dataType : "json",
			data:{
				buildingNo : no
			},
			type : "get",
			success : getLocation
		})
	}

	function getAllBuildingLocation() {

		$.ajax({

			url : "getAllBuildingLocation.do",
			dataType : "json",
			type : "get",
			success : getAllLocation
		})
	}

	function getLocation(jsonData) {
		deleteMarkers();
		var building = jsonData.building;
		
			var xPoint = parseFloat(building.buildingLocX);
			var yPoint = parseFloat(building.buildingLocY);
			var newCenter = new google.maps.LatLng(xPoint, yPoint);
			var image = {
					url : "img/" + building.buildingImg,
					// This marker is 20 pixels wide by 32 pixels tall.
					scaledSize : new google.maps.Size(100, 100),
					origin : new google.maps.Point(0, 0),
					// The anchor for this image is the base of the flagpole at 0,32.
					anchor : new google.maps.Point(30, 30)

				};

			var marker = new google.maps.Marker({
				position : newCenter,
				draggable : false,
				animation : google.maps.Animation.BOUNCE,
				icon : image,
				title : building.buildingName,
				html : getIWContent(building.buildingName,
						building.buildingImg,
						building.buildingNo)

			});
			buildingMarkers.push(marker);

			var infowindow = new google.maps.InfoWindow({});
			google.maps.event.addListener(marker, 'click', function(monster) {

				infowindow.setContent(this.html);
				infowindow.open(map, this);

			});
			map.setCenter(newCenter);
			map.setZoom(20);
		}


	function getAllLocation(jsonData) {
		deleteMarkers();
		var buildingList = jsonData.buildingList;
		var size = jsonData.size;

		alert("what?");
		console.log(size + "가장 중요한 리스트의 길이이다.");
		for (var i = 0; i < parseInt(size); i++) {
			var xPoint = parseFloat(buildingList[i].buildingLocX);

			var yPoint = parseFloat(buildingList[i].buildingLocY);
			var newCenter = new google.maps.LatLng(xPoint, yPoint);
			alert(xPoint + ":" + yPoint);

			// Add the circle for this city to the map.

			var image = {
				url : "img/" + buildingList[i].buildingImg,
				// This marker is 20 pixels wide by 32 pixels tall.
				scaledSize : new google.maps.Size(100, 100),
				origin : new google.maps.Point(0, 0),
				// The anchor for this image is the base of the flagpole at 0,32.
				anchor : new google.maps.Point(30, 30)

			};

			var marker = new google.maps.Marker(
					{
						position : newCenter,
						draggable : false,
						animation : google.maps.Animation.BOUNCE,
						icon : image,
						title : buildingList[i].buildingName,
						html : getIWContent(buildingList[i].buildingName,
								buildingList[i].buildingImg,
								buildingList[i].buildingNo)
					});

			buildingMarkers.push(marker);
			console.log(buildingMarkers.length + "룰루");
			var infowindow = new google.maps.InfoWindow({});

			google.maps.event.addListener(marker, 'click', function(building) {
				infowindow.setContent(this.html);
				infowindow.open(map, this);

			});
			map.setCenter(myCenter);

		}
		markerCluster.clearMarkers();
		markerCluster.addMarkers(buildingMarkers);
		
		$("#buildingList").html(getAllbuildingList(buildingList, size));
	}

	function getAllbuildingList(buildingList, size){
		
		var content = "<div class='panel-group' id='accordion' role='tablist' aria-multiselectable='true'><div class='panel panel-default'>";
		for (var i = 0; i < parseInt(size); i++) {
			content+="<div class='panel-heading' role='tab' id='headingOne'><h4 class='panel-title'>";
	        content+="<a data-toggle='collapse' data-parent='#accordion' href='#collapseOne' aria-expanded='true' aria-controls='collapseOne'><h4 class='panel-title'>";
	        content+="<div><a onclick = getBuildingLocation('" + buildingList[i].buildingNo +"')>&nbsp;&nbsp;" + buildingList[i].buildingNo + "&nbsp; " + buildingList[i].buildingName+"</a></div>";
	        content +="</a></div>"
		}
		content+="</h4></div></div>";
		
		return content;
	}
	
	function getIWContent(buildingName, image, buildingNo) {

		var content = "<div class = 'active info-windows'>";

		content += "<div style='display:table-cell; '><font style= 'color : black;font-size : 11px; font-family : Jeju Gothic;'><b>"
				+ buildingNo + "</b></font></div>";

		var buildingNo = buildingNo;
		if (buildingName.length <= 4) {
			content += "<div style='display:table-row; vertical-align : middle;'><a href='meetingRoomList.do?buildingNo="
					+ buildingNo
					+ "' ><font style= 'color :#428bca; font-size : 19px;'><b>"
					+ buildingName + "</b></font></a></div>";
		} else if (buildingName.length <= 9) {
			content += "<div style='display:table-row; vertical-align : middle;'><a href='meetingRoomList.do?buildingNo="
					+ buildingNo
					+ "' ><font style= 'color :#428bca; font-size : 18px; '><b>"
					+ buildingName + "</b></font></a></div>";
		} else {
			content += "<div style='display:table-row; vertical-align : middle;'><a href='meetingRoomList.do?buildingNo="
					+ buildingNo
					+ "' ><font style= 'color :#428bca; font-size : 15px; '><b>"
					+ buildingName + "</b></font></a></div>";
		}

		content += '</div>';
		return content;
	}

	function showSelectedPlace() {
		deleteMarkers();
		var place = autocomplete.getPlace();
		alert(place.geometry.location);
		map.panTo(place.geometry.location);
		markers[0] = new google.maps.Marker({
			position : place.geometry.location,
			map : map
		});
		iw = new google.maps.InfoWindow({
			content : getIWContent(place)
		});
		iw.open(map, markers[0]);
	}

	function currentLocation() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var pos = new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude);

				var marker = new google.maps.Marker({
					position : myCenter,
					map : map,
					animation : google.maps.Animation.BOUNCE
				});
				markers.push(marker);

				var infowindow = new google.maps.InfoWindow({
					map : map,
					position : pos,
					content : 'Here is your Current Location.'
				});

				infowindow.open(map, marker);

				map.setCenter(pos);
				map.setZoom(14);
				setTimeout(function() {
					infowindow.close()
				}, 2000);
			}, function() {
				handleNoGeolocation(true);
			});
		} else {
			// Browser doesn't support Geolocation
			handleNoGeolocation(false);
		}
	}

	function handleNoGeolocation(errorFlag) {
		if (errorFlag) {
			var content = 'Error: The Geolocation service failed.';
		} else {
			var content = 'Error: Your browser doesn\'t support geolocation.';
		}
	}

	function setAllMap(map) {

		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);

		}
		for (var i = 0; i < buildingMarkers.length; i++) {
			buildingMarkers[i].setMap(map);

		}
	}

	function deleteMarkers() {
		clearMarkers();
		markers = [];
		buildingMarkers = [];
	}

	function clearMarkers() {
		setAllMap(null);

	}

	$(document).ready(function() {

	});

	google.maps.event.addDomListener(window, 'load', initialize);

</script>
<body>
	<input type="hidden" id="startLat" value="0">
	<input type="hidden" id="startLng" value="0">
	<input type="hidden" id="endLat" value="0">
	<input type="hidden" id="endLng" value="0">
	<input type="hidden" id="myRange" value="0">

	<!-- 검색 메뉴 시작 -->



	<div class="container">
		<div id="buildingList" style="width: 20%; height: 550px; float : left">
		</div>
		<div id="map_canvas" style="width: 80%; height: 550px; float : right"></div>


	</div>


	<!-- /.container -->

</body>
</html>