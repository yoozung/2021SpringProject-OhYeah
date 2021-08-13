<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/resource/css/inc.css" />
<link rel="stylesheet" type="text/css" href="/resource/css/sign/signUp.css" />
</head>
<body>
	 <div class="container signUpPage">
        <form action="/signUpPage/SignUp" id="signUpForm" method="POST">
            <div class="signUpForm">
                <div class="row title">
                    <div class="col-4"></div>
                    <div class="col-4 titleLogo">
                        <span class="Coral">오</span><span>늘의</span>
                        <br />
                        <span class="Coral Coral2">예</span><span>약</span>
                    </div>
                    <div class="col-4"></div>
                </div>
                <div class="row blank signInfo">
                    <div class="col-12">
                        <a>필수정보</a>
                    </div>
                </div>
                <div class="row form">
                    <div class="col-12">
                        <div class="row input">
                            <div class="col-2 inputHead">
                                <label for="email">이메일</label>
                            </div>
                            <div class="col-10 inputBody">
                                <input type="text" name="email" placeholder="아이디로 사용됩니다." />
                            </div>
                        </div>
                        <div class="row input">
                            <div class="col-2 inputHead">
                                <label for="password">비밀번호</label>
                            </div>
                            <div class="col-10 inputBody">
                                <input type="password" name="password" placeholder="6자~20자" />
                            </div>
                        </div>
                        <div class="row input">
                            <div class="col-2 inputHead">
                                <label for="name">이름</label>
                            </div>
                            <div class="col-10 inputBody">
                                <input type="text" name="name" placeholder="" />
                            </div>
                        </div>
                        <div class="row input">
                            <div class="col-2 inputHead">
                                <label for="mobile">전화번호</label>
                            </div>
                            <div class="col-10 inputBody">
                                <input type="text" name="mobile" placeholder="010-0000-0000 형식으로 입력" />
                            </div>
                        </div>
                        <div class="row input">
                            <div class="col-2 inputHead">
                                <label for="role">사용자 구분</label>
                            </div>
                            <div class="col-10 inputBody">
                                <select class="custom-select" form="signUpForm" name="role">
                                    <option value="ROLE_CONSUMER">일반회원</option>
                                    <option value="ROLE_OWNER">사업자회원</option>
                                </select>
                            </div>
                        </div>
                        <div class="row input">
                            <div class="col-6 inputBody">
                                <input class="cancle" type="button" value="취소하기" />
                            </div>                         
                            <div class="col-6 inputBody">
                                <input class="submit" type="submit" value="회원가입" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>