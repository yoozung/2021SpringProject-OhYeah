<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>네이버 지도 api 예제 : 간단 예제 : 클릭한 위치 위도·경도 보기 (클릭 이벤트 적용)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!-- 예제 시작 -->

<!-- 사용한 지도 Client ID : mn7cwsrvym 은 "localhost" 에서 테스트 용도로 사용할 수 있습니다. -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=q95pq98e92&submodules=geocoder"></script>

<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<div id="naverMap" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
<div style="text-align:center; margin-top:10px;">
	위도 : <input type="text" name="namp_lat" />
	경도 : <input type="text" name="namp_lng" />
</div>

<script>

var mapOptions = {
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
        }
    };

var map = new naver.maps.Map('naverMap',mapOptions);

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


var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map
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

<!-- 예제 종료 -->


</body>
</html>