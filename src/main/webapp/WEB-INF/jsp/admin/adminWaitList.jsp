<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<div class="container adminWaitList">
<%@ include file="multipleCondition.jsp" %>
<h4>All Shop List</h4>
<<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
   <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
   
   <c:if test="${endPage > pageCount}" >
     <c:set var="endPage" value="${pageCount}" />
   </c:if>
  
   <table class="table">
   	<thead>
	<tr>
		<th>신청 번호</th>
		<th>신청자 이름</th>
		<th>인원수</th>
		<th>신청자 전화번호</th>
		<th>가게 이름</th>
		<th>가게 번호</th>
		<th>줄서기 신청일</th>
		<th>대기 상태</th>
	</tr>
	</thead>
	<tbody>	
	<c:forEach var="dto" items="${Table}" varStatus="status">
		<tr>
			<th>${dto.waitNo}</th>
			<th>${dto.waitName}</th>
			<th>${dto.headCount}</th>
			<th>${dto.waitMobile}</th>
			<th>${dto.shopName}</th>
			<th>${dto.shopNo}</th>
			<th>${dto.waitDate}</th>
			<th>${dto.watiStatus}</th>
		</tr>	
	</c:forEach>
	</tbody>
   </table>
 
<!-- << 처음으로 < 이전으로 -->  
   <c:if test="${numPageGroup > 1}">
        <a href="./admin/adminWaitList?pageNum=1">[<<]</a>
        <a href="./admin/adminWaitList?pageNum=${(numPageGroup-2)*pageGroupSize+1 }">[<]</a>
   </c:if> 
   
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/admin/adminWaitList?pageNum=${i}">[       
          <c:if test="${currentPage == i}">
        </c:if>
        ${i}
       </a>
  </c:forEach>
 
 
 <!-- 소수점 형태이므로 인트형태로 변경  --> 
   <fmt:parseNumber var="maxPage"  value="${pageCount}" /> 
 
<!-- >> 맨뒤로 > 다음으로 -->
   <c:if test="${numPageGroup < pageGroupCount}">
      <a href="./admin/adminWaitList?pageNum=${numPageGroup*pageGroupSize+1}">[>]</a>
        
      <a href="./admin/adminWaitList?pageNum=${maxPage}">[>>]</a>
  
   </c:if>
</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>