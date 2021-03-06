<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 회원조회</title>
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<link type="text/css" rel="stylesheet" href="/resource/css/adminPage.css">
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<div class="container adminMemberList">
<h4>Member List</h4>
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
		<th>이름</th>
		<th>이메일</th>
		<th>비밀번호</th>
		<th>휴대폰</th>
		<th>가입일</th>
	</tr>
	</thead>
	<tbody>	
	<c:forEach var="dto" items="${Table}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.name}</th>
			<th>${dto.email}</th>
			<th>${fn:substring(dto.password, 0, 2)}<c:forEach begin="2" end="${fn:length(dto.password)}" step="1">*</c:forEach> 
			</th>
			<th>${dto.mobile}</th>
			<th>${dto.entryDate}</th>
		</tr>	
	</c:forEach>
	</tbody>
   </table>
 
<!-- << 처음으로 < 이전으로 -->  
   <c:if test="${numPageGroup > 1}">
        <a href="./admin/adminMemberList?pageNum=1">[<<]</a>
        <a href="./admin/adminMemberList?pageNum=${(numPageGroup-2)*pageGroupSize+1 }">[<]</a>
   </c:if> 
   
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/admin/adminMemberList?pageNum=${i}">[       
          <c:if test="${currentPage == i}">
        </c:if>
        ${i}
       </a>
  </c:forEach>
 
 
 <!-- 소수점 형태이므로 인트형태로 변경  --> 
   <fmt:parseNumber var="maxPage"  value="${pageCount}" /> 
 
<!-- >> 맨뒤로 > 다음으로 -->
   <c:if test="${numPageGroup < pageGroupCount}">
      <a href="./admin/adminMemberList?pageNum=${numPageGroup*pageGroupSize+1}">[>]</a>
        
      <a href="./admin/adminMemberList?pageNum=${maxPage}">[>>]</a>
  
   </c:if>
</c:if>

</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>