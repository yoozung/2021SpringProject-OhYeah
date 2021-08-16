<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
    
<!-- 다중조건검색 조각페이지 : inc/multipleCondition.jsp -->
<div class="multipleCondition">
	<form action="/admin/multipleCondition" method="get">
		<select name="condition">
			<option value="shopName">가게명</option>
			<option value="status">등록상태</option>
		</select>
		<input class="inline" type="text" name="keyword" placeholder="검색어를 입력해주세요" autofocus="autofocus">
		<input type="submit" value="검색">
	</form>
</div>