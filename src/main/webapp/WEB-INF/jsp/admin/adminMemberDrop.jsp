<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 회원삭제</title>
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<link type="text/css" rel="stylesheet" href="/resource/css/adminPage.css">
<script>
function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='test_check']:checked").each(function(i)) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    }
 
    $.ajax({
        url: 'test_check'
        , type: 'post'
        , dataType: 'text'
        , data: {
            valueArrTest: checkArr
        }
    });
}
</script>


</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 asd1 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SHOP MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/admin/adminShopAccept">등록신청관리</a>
							<a class="dropdown-item" href="/admin/adminShopList">식당조회</a>
							<a class="dropdown-item" href="/admin/adminShopUpdate">수정관리</a>
							<a class="dropdown-item" href="/admin/adminShopDrop">삭제관리</a>
						</div>
					</div>
					<div class="col-6 asd2 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MEMBER MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/admin/adminMemberList">회원조회</a>
							<a class="dropdown-item" href="/admin/adminMemberDrop">회원삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
<div class="container adminMemberDrop">
<h4>Member Drop</h4>

<form action="/memberDrop" method="post">
<input type="submit" value="전체선택" id="btn-all" onclick="checkAll()">
<input type="reset" value="전체취소" id="btn-all" onclick="clearAll()">
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>비밀번호</th>
		<th>휴대폰</th>
		<th>가입일</th>
		<th>선택</th>
	</tr>
	
	<!-- 검색조건에 해당하는 결과가 없는 경우 메세지 출력 -->
	<c:if test="${not empty message}">
		<tr>
			<th colspan=10>${message}</th>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.name}</th>
			<th>${dto.email}</th>
			<th>${fn:substring(dto.password, 0, 2)}<c:forEach begin="2" end="${fn:length(dto.password)}" step="1">*</c:forEach> 
			</th>
			<th>${dto.mobile}</th>
			<th>${dto.entryDate}</th>
			<th><input type="checkbox" name="test_check" value="email"></th>
		</tr>
	</c:forEach>
</table>


<<input type="submit" value="회원삭제" id="btn" />
<input type="reset" value="취소"  id="btn" />
</form>
</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/admin.js"></script>
</html>