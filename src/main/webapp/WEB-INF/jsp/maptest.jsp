<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
<div style="text-align:center; margin-top:10px;">
	위도 : <input type="text" name="namp_lat" />
	경도 : <input type="text" name="namp_lng" />
</div>
<script>
var curtBtn ='<img src="/resource/img/CurrentLocationButton.png" alt="현재위치로 이동">';
/* var curtLocation = { "lat": "37.5147509", "lng": "127.1003536" }; */
var curtLocation = "";
var CityHall = new naver.maps.LatLng(37.566465, 126.977924);


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

var marker = new naver.maps.Marker({
	position: CityHall,
	map: map,
	icon: {url: "/resource/img/SampleStoreLocation.png"}
});


//혼잡도 : 3
var redmarker = new naver.maps.Marker({
	  position: new naver.maps.LatLng(37.5231227, 127.1069538),
	  map: map,
	  title: '혼잡',
	  icon: {
	      content: [
	                  '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#b12121; color:white; text-align:center;border:1px solid #831616; border-radius:14px; opacity:75%" onmouseover="javascript:overStore(\'store3\');" onmouseout="javascript:outStore(\'store3\');">' +
	                      '<div style="font-weight: bold; font-size:14px"> 식당1 </div>' +
	                      '<div id="store3" style="font-weight: normal; font-size:13px; margin-top:3px; display:none"> 매드포갈릭<br/>02-222-1111<br/>양식</div>' +
	                      '<div><input type="button" onclick="openWaitList()" value="줄 서기"></div>' +
	                  '</div>'
	              ].join(''),
	      size: new naver.maps.Size(38, 58),
	      anchor: new naver.maps.Point(19, 58),
	  },
	  draggable: false
});


//혼잡도 : 3
var redmarker = new naver.maps.Marker({
	  position: new naver.maps.LatLng(37.5310868, 127.0879853),
	  map: map,
	  title: '혼잡',
	  icon: {
	      content: [
	                  '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#b12121; color:white; text-align:center;border:1px solid #831616; border-radius:14px; opacity:75%">' +
	                      '<div style="font-weight: bold; font-size:14px"> 식당4 </div>' +
	                      '<div style="font-weight: normal; font-size:13px; margin-top:3px"> 만다린<br/>02-222-4444<br/>중식</div>' +
	                      '</div>'
	              ].join(''),
	      size: new naver.maps.Size(38, 58),
	      anchor: new naver.maps.Point(19, 58),
	  },
	  draggable: false
});


//혼잡도 : 2

var yellowmarker = new naver.maps.Marker({
  position: new naver.maps.LatLng(37.5332648, 127.0930493),
  map: map,
	title: '보통',
	icon: {
      content: [
                  '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#d3cc07; color:white; text-align:center;border:1px solid #a09b07; border-radius:14px; opacity:75%">' +
                      '<div style="font-weight: bold; font-size:14px"> 식당2 </div>' +
                      '<div style="font-weight: normal; font-size:13px; margin-top:3px"> 스시효<br/>02-222-2222<br/>일식</div>' +
                      '</div>'
              ].join(''),
      size: new naver.maps.Size(38, 58),
      anchor: new naver.maps.Point(19, 58),
	}
});


//혼잡도 : 1

var greenmarker = new naver.maps.Marker({
  position: new naver.maps.LatLng(37.5270708, 127.0872128),
  map: map,
	title: '원활',
	icon: {
      content: [
                  '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#43f707; color:white; text-align:center;border:1px solid #3a8c1f; border-radius:14px; opacity:75%">' +
                      '<div style="font-weight: bold; font-size:14px"> 식당3 </div>' +
                      '<div style="font-weight: normal; font-size:13px; margin-top:3px"> 진상샤브샤브<br/>02-222-3333<br/>한식</div>' +
                      '</div>'
              ].join(''),
      size: new naver.maps.Size(38, 58),
      anchor: new naver.maps.Point(19, 58),
	}
});


//혼잡도 : 1

var greenmarker = new naver.maps.Marker({
  position: new naver.maps.LatLng(37.5156721, 127.0937066),
  map: map,
	title: '원활',
	icon: {
      content: [
                  '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;background-color:#43f707; color:white; text-align:center;border:1px solid #3a8c1f; border-radius:14px; opacity:75%">' +
                      '<div style="font-weight: bold; font-size:14px"> 식당5 </div>' +
                      '<div style="font-weight: normal; font-size:13px; margin-top:3px"> 참설농탕<br/>02-222-5555<br/>한식</div>' +
                      '</div>'
              ].join(''),
      size: new naver.maps.Size(38, 58),
      anchor: new naver.maps.Point(19, 58),
	}
});


function overStore(childID)
{
	$("#"+childID).show();
}

function outStore(childID)
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

var contentString = [
    '<div class="iw_inner">',
    '   <h3>서울특별시청</h3>',
    '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br>',
    '       <img src="./img/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br>',
    '       02-120 | 공공,사회기관 > 특별,광역시청<br>',
    '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

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
</body>
</html>