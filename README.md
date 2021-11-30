# 오늘의 예약 - 오예
### 프로젝트 기간
2021.08.09 ~ 2021.08.19

### 주제
<pre>
 맛집이라고 소문난 인기가 많은 식당 또는 사람이 붐비는 점심시간에 식당을 방문할 경우 높은 확률로 만석인 경우가 많습니다. 
이러한 상황은 이용객의 혼란을 발생시키고 시간적 효율성이 떨어지게 됩니다. 또한 대기인원 발생시 점원은 대기자 목록 작성, 대기자 호출 등과 같은 업무가 추가됩니다. 
이 경우 한정된 직원으로 많은 업무를 부담하게 되어 가게의 회전율은 낮아집니다.
더불어 현재 전 세계를 강타한 Covid-19는 국내 영업매장 운영에도 많은 영향을 끼쳐 출입명부 작성, 테이블간 거리두기, 체온측정 등 추가 업무를 발생시켰습니다.
위와 같은 점을 보완하고자 본 프로젝트는 식당에서는 대기 목록을 제공하고 이용객은 식당에서 제공한 대기 목록에 이름과 전화번호를 적어 대기 목록을 작성하고, 대기순서가 됐을 경우 전화 또는 문자로 호출하는 경우가 대부분이었습니다. 이 대기관리 과정을 모바일을 통해 관리 가능하게끔 서비스를 제공하고 추가로 지도를 기반으로 하여 사용자의 편의에 도움이 되는 서비스를 기획했습니다.
</pre>

### 개발목표
- 원격 대기 서비스를 통해 식당 이용자들의 효율적인 시간관리
- 거리두기 방역 지침 준수 가능성 높임
- 지도를 활용한 각 식당의 대기 현황을 명시적으로 표현함으로써 소비자의 선택을 돕고 편의성을 제고

<br>

<pre>
<h4>패키지 구조</h4>
com.team04.member
com.team04.restaurant
com.team04.waitlist
형태로 데이터베이스 테이블을 기준으로 패키지를 생성했습니다.

com.team04.member 패키지 아래에는 회원과 관련된 기능(예. 로그인, 회원가입, 로그인 정보 찾기 등)와 관련된 파일이나 하위 패키지 생성 또는 수정
com.team04.restaurant 패키지 아래에는 식당과 관련된 기증( 예. 식당 등록 신청, 식당 정보 조회, 등록된 식당 정보 삭제 신청 등)과 관련된 파일이나 하위 패키지 생성 또는 수정
com.team04.waitlist 패키지 아래에는 식당 대기와 관련된 기능에 대한 파일이나 하위 패키지 생성 또는 수정
</pre>

<br>

## 개발환경
### IDE
|name|version|
|------|---|
|SpringBoot(Maven)|4.10.0|
|SQL Developer|11.2.0.2.0|


### Java
|name|version|
|------|---|
|SpringBoot(Maven)|4.10.0|
|JPA||
|MySQL|8.0.21|
|Mybatis|-|

<br>

## 화면구성
[UI](https://ovenapp.io/view/9eABQulP10gb1y0gp5rxUfAHKtsCSljM/)


## SRS
[SRS](https://docs.google.com/spreadsheets/d/1ZG4hMNLIsA4QF6825t7WGt0zab87J6Ff/edit?usp=sharing&ouid=103603984830369786368&rtpof=true&sd=true)

## UsecaseDiagram
[UsecaseDiagram](https://github.com/yoozung/2021SpringProject-OhYeah/wiki/UsecaseDiagram)

## DB Modeling
[DB](https://github.com/yoozung/2021SpringProject-OhYeah/wiki/DB-Modeling)

## Workflow
[Workflow](https://github.com/yoozung/2021SpringProject-OhYeah/wiki/Workflow)
