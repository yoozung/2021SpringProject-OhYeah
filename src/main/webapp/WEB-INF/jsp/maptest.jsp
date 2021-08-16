<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>예약가능한 식당 찾기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/jquery-1.10.1.min.js"></script>
<!-- 사용한 지도 Client ID : 은 xxxxx "localhost" 에서 테스트 용도로 사용할 수 있습니다. -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q95pq98e92&submodules=geocoder"></script>
<script src="/resource/js/MarkerClustering.js"></script>
<link type="text/css" rel="stylesheet" href="/resource/css/RestaurantMap/RestaurantMap.css">
</head>

<%@ include file="Fragment/inc/topBefore.jsp" %>
<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>

<!-- 
<div style="text-align:center; margin-top:10px;">
	위도 : <input type="text" name="namp_lat" />
	경도 : <input type="text" name="namp_lng" />
</div>
-->
<!-- 
<div class="container maptest">
<h4>jsp ShopList</h4>
<c:forEach var="item" items="${list}" varStatus="idx">
 ${item.shopNo}, ${item.shopName}, ${item.shopMobile}, ${item.shopSite}, ${item.shopCategory}, ${item.lat}, ${item.lng}, ${item.state}<br/> 
</c:forEach>
</div>
-->

<body>
	<div style="margin:0 auto; width:1000px; max-width:100%; height:650px;">
		<input type=radio name="radioShopState" id="radioShopState1" value="4" onclick="javascript:sortingMapByShopState(this.value)"><label for="radioShopState1">전체</label>
		<input type=radio name="radioShopState" id="radioShopState2" value="1" onclick="javascript:sortingMapByShopState(this.value)"><label for="radioShopState2">원활</label>
		<input type=radio name="radioShopState" id="radioShopState3" value="2" onclick="javascript:sortingMapByShopState(this.value)"><label for="radioShopState3">보통</label>
		<input type=radio name="radioShopState" id="radioShopState4" value="3" onclick="javascript:sortingMapByShopState(this.value)"><label for="radioShopState4">혼잡</label>
	</div>
<%@ include file="Fragment/inc/footer.jsp"%>
</body>
<script>
var curtBtn ='<img src="/resource/img/CurrentLocationButton.png" alt="현재위치로 이동">';
var curtLocation = "";

/**
var CityHall = new naver.maps.LatLng(37.566465, 126.977924);
var marker = new naver.maps.Marker({
	position: CityHall,
	map: map,
	// icon: {url: "/resource/img/SampleshopLocation.png"}
});
**/


var mapOptions = {
        zoomControl: true,
        scaleControl: false,
        mapDataControl: false,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
        }
    };

var map = new naver.maps.Map('map',mapOptions);

// 여러 markers 변수선언
var markers = [];


function sortingMapByShopState(state)
{
	console.log(state);
	//할당된 Markers
	var newMarkers = [];
	for(var i=0; i < markers.length; i++)
	{
		markers[i].setMap(null);
	}
	// 전체
	if(state >= 4)
	{
		for(var i=0; i < markers.length; i++)
		{
			markers[i].setMap(map);
			newMarkers.push(markers[i]);
		}
	}
	// 나머지 (혼잡: 3, 보통: 2, 원활: 1)
	else
	{
		for(var i=0; i < markers.length; i++)
		{
			if(state == markers[i].state)
			{
				markers[i].setMap(map);
				newMarkers.push(markers[i]);
			}
			else
			{
				markers[i].setMap(null);
			}
		}
	}
	markerCluster(newMarkers);
	map.setZoom(4);
}

function CustomMarker(lat, lng, shopNo, shopName, state, shopMobile, shopCategory) {
	//심각성 : 1
	var contents_html = "";
	
	//상태 : 혼잡 (빨강)
	if(state == 3)
	{
		contents_html =	
			'<form name="callGetLine">'+
			'<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#b12121; color:white; text-align:center;border:1px solid #831616; border-radius:14px; opacity:75%" onmouseover="javascript:overshop(\''+shopNo+'\');" onmouseout="javascript:outshop(\''+shopNo+'\');">' +
       		'<div class="shopInfo" style="font-weight: bold; font-size:14px"> '+shopName+' </div>' +
       		'<div class="shopInfo infoNoShow">'+shopNo+'</div>'+
        	'<div class="shopInfo" id="'+shopNo+'" style="font-weight: normal; font-size:13px; margin-top:3px; display:none"> '+shopMobile+'<br/>'+shopCategory+'</div>' + 
        	'<div><input type="submit" onclick="openWaitList(event)" value="대기"></div>'+
        	'</div></form>';	
	}
	
	// 상태 : 보통 (노랑)
	if(state == 2)
	{
		contents_html =
		'<form name="callGetLine">'+
		'<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#d3cc07; color:white; text-align:center;border:1px solid #a09b07; border-radius:14px; opacity:75%" onmouseover="javascript:overshop(\''+shopNo+'\');" onmouseout="javascript:outshop(\''+shopNo+'\');">' +
		'<div class="shopInfo" style="font-weight: bold; font-size:14px"> '+shopName+' </div>' +
		'<div class="shopInfo infoNoShow">'+shopNo+'</div>'+
        '<div class="shopInfo" id="'+shopNo+'" style="font-weight: normal; font-size:13px; margin-top:3px; display:none"> '+shopMobile+'<br/>'+shopCategory+'</div>' + 
        '<div><input type="submit" onclick="openWaitList(event)" value="대기"></div>'+
        '</div></form>';	
	}
	
	// 상태 : 원활 (초록)
	if(state == 1)
	{
		contents_html =	
		'<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#43f707; color:white; text-align:center;border:1px solid #3a8c1f; border-radius:14px; opacity:75%" onmouseover="javascript:overshop(\''+shopNo+'\');" onmouseout="javascript:outshop(\''+shopNo+'\');">' +
		'<div class="shopInfo" style="font-weight: bold; font-size:14px"> '+shopName+' </div>' +
		'<div class="shopInfo infoNoShow">'+shopNo+'</div>'+
        '<div class="shopInfo" id="'+shopNo+'" style="font-weight: normal; font-size:13px; margin-top:3px; display:none"> '+shopMobile+'<br/>'+shopCategory+'</div>' +
        '<div><input type="submit" onclick="openWaitList(event)" value="대기"></div>'+
        '</div>';	
	}
	
	
	
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(lat, lng),
		map: map,
		title: shopName,
		icon: {
			content: contents_html,
			size: new naver.maps.Size(38, 58),
			anchor: new naver.maps.Point(19, 58),
		},
		draggable: false
	});
	return marker;
}

// Marker 찍기
function loadShopMarker()
{
	<c:forEach var="item" items="${list}" varStatus="idx">
	var marker = CustomMarker(${item.lat}, ${item.lng}, "${item.shopNo}", "${item.shopName}", ${item.state}, "${item.shopMobile}", "${item.shopCategory}");
	markers.push(marker);
	 </c:forEach>
	 return markers;
}

// MarkerCluster 
function markerCluster(applyMarker) 
{
	var htmlMarker1 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-1.png);background-size:contain;"></div>',
			size: N.Size(40, 40),
			anchor: N.Point(20, 20)
		},
		htmlMarker2 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-2.png);background-size:contain;"></div>',
			size: N.Size(40, 40),
			anchor: N.Point(20, 20)
		},
		htmlMarker3 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-3.png);background-size:contain;"></div>',
			size: N.Size(40, 40),
			anchor: N.Point(20, 20)
		},
		htmlMarker4 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-4.png);background-size:contain;"></div>',
			size: N.Size(40, 40),
			anchor: N.Point(20, 20)
		},
		htmlMarker5 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-5.png);background-size:contain;"></div>',
			size: N.Size(40, 40),
			anchor: N.Point(20, 20)
		};
	    
	 var markerClustering = new MarkerClustering({
	        minClusterSize: 2,
	        maxZoom: 8,
	        map: map,
	        markers: applyMarker,
	        disableClickZoom: false,
	        gridSize: 120,
	        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
	        indexGenerator: [10, 100, 200, 500, 1000],
	        stylingFunction: function(clusterMarker, count) {
	            $(clusterMarker.getElement()).find('div:first-child').text(count);
	        }
	    });	
}

$(document).ready(function(){
	var tmpMarkers = loadShopMarker();
	markerCluster(tmpMarkers);
});


function overshop(childID)
{
	$("#"+childID).show();
}

function outshop(childID)
{
	$("#"+childID).hide();
}

naver.maps.Event.once(map, 'init_stylemap', function(){
	var customCtrl = new naver.maps.CustomControl(curtBtn,{
		position: naver.maps.Position.LEFT_BOTTOM
	});
	
	customCtrl.setMap(map);
	
	naver.maps.Event.addDOMListener(customCtrl.getElement(), 'click', function(){
		if(curtLocation) {
			map.setCenter(curtLocation);
			map.setZoom(18);
		}
		else {
			alert("위치 액세서가 거부되었습니다.\n사용하려면 위치 액세스를 허용해주시기 바랍니다.");
		}
	});
});

var onSuccessGeolocation = function(position) {
	curtLocation = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
	map.setCenter(curtLocation);
	map.setZoom(17);
	
	
	var marker = new naver.maps.Marker({
	    position: curtLocation,
	    map: map,
	    icon: {url: "/resource/img/CurrentLocationIcon.png"}
	});
	
	
}

var onErrorGeolocation = function() {
	
	// 어떤 브라우저로 열렸는지 확인
	var agent = navigator.userAgent.toLowerCase(), name = navigator.appName;
	
	if (name == 'Microsoft Internet Explorer' || agent.indexOf('trident') > -1 || agent.indexOf('edge/') >-1) {
		alert("지원하지 않는 브라우저입니다.");
	}
	else {
		console.log("현재 위치를 가져오는 에러가 발생하였습니다.");
	}
}

if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
}
else {
	console.log("Geolocation Not supported Required");
}



naver.maps.Event.addListener(map, 'click', function(e){
	// 제이쿼리 사용
	// e 는 클릭시 넘어오는 이벤트 (네이밍은 원하는 대로 하셔도 됩니다)
	// e 에서 필요한 것을 꺼내서 쓰면 됩니다.
	// e.coord.lat() 는 위도 (Latitude)  보통 약어로 lat
	// e.coord.lng() 는 경도 (Longitude) 보퉁 약어로 lng
	
	// 다른 마커에서 정보창 확인시 닫은 후 마커 생성가능
	if(infowindow.getMap()){
		infowindwo.close();
	}
	else {
		$('[name=namp_lat]').val( e.coord.lat() ); // 위도
		$('[name=namp_lng]').val( e.coord.lng() ); // 경도
		marker.setPosition(e.latlng);
	}
	//$('[name=namp_lat]').val( e.coord.lat() ); // 위도
	//$('[name=namp_lng]').val( e.coord.lng() ); // 경도
	//marker.setPosition(e.latlng);
	//alert(e.coord.lat() + ', ' + e.coord.lng());
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});
</script>
<script type="text/javascript" src="/resource/js/maptest.js"></script>
</html>