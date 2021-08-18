<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<style type="text/css">
table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }

  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
tr:hover { background-color: #eeeeff; cursor: pointer; }
</style>
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<div class="container adminShopList">
<%@ include file="multipleCondition.jsp" %>
<h4>All Shop List</h4>
<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
   <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
   
   <c:if test="${endPage > pageCount}" >
     <c:set var="endPage" value="${pageCount}" />
   </c:if>
   
<table class="table">
	<thead>
	<tr>
		<th>번호</th>
		<th>가게번호</th>
		<th>가게명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>사장번호</th>
		<th>사이트</th>
		<th>분류</th>
		<th>좌석수</th>
		<th>등록일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${Table}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.shopNo}</th>
			<th>${dto.shopName}</th>
			<th>${dto.shopMobile}</th>
			<th>${dto.shopAddress}</th>
			<th>${dto.memberNo}</th>
			<th>${dto.shopSite}</th>
			<th>${dto.shopCategory}</th>
			<th>${dto.shopSeat}</th>
			<th>${dto.registerDate}</th>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!-- << 처음으로 < 이전으로 -->  
   <c:if test="${numPageGroup > 1}">
        <a href="./admin/adminShopList?pageNum=1">[<<]</a>
        <a href="./admin/adminShopList?pageNum=${(numPageGroup-2)*pageGroupSize+1 }">[<]</a>
   </c:if> 
   
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/admin/adminShopList?pageNum=${i}">[       
          <c:if test="${currentPage == i}">
        </c:if>
        ${i}
       </a>
  </c:forEach>
 
 
 <!-- 소수점 형태이므로 인트형태로 변경  --> 
   <fmt:parseNumber var="maxPage"  value="${pageCount}" /> 
 
<!-- >> 맨뒤로 > 다음으로 -->
   <c:if test="${numPageGroup < pageGroupCount}">
      <a href="./admin/adminShopList?pageNum=${numPageGroup*pageGroupSize+1}">[>]</a>
        
      <a href="./admin/adminShopList?pageNum=${maxPage}">[>>]</a>
  
   </c:if>
</c:if>
</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>