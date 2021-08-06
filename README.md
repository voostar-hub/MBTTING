# MBTTING
## 프로젝트명 : Mbtting(엠비팅)

> 그린 컴퓨터 아카데미 자바 과정 이수 하면서 만든 첫번째 팀 프로젝트입니다.<br>
> 사용가이드와 최종발표 PPT를 참고하셔도 됩니다.

<strong>1팀 구성</strong><br>
1. <strong>김준형</strong>(본인)<br>
2. 김경윤<br>
3. 신제원<br>


## 개발기간
2021/05/01 ~ 2021/05/28(28일)

## 프로젝트의 목적<br>
### MBTI열풍이 불었습니다. 16가지의 성격 유형검사는 MZ세대로 부터 시작해<br>
### 많은 사람들에게 흥미거리로 자리잡았습니다.<br>
### 같은 MBTI끼리만 떠들 수있는 인터넷 공간이 있으면 어떨까라는 생각에서 시작했습니다.<br>

### 같은 MBTI를 가진 사람들과 커뮤니티를 통해 교류하고<br>
### 다양한 사람들과 대화를 해볼 수 있는 MBTI와 Meeting(만나다)를 합쳐<br>
### MBTTING이라는 이름의 웹페이지를 만들어 보았습니다.<br><br>

## 사용된 기술 스택

### 언어
<img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/>&nbsp; 
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/>&nbsp;
### 관련 기술
<img src="https://img.shields.io/badge/JSP-007396?style=flat-square&logo=&logoColor=white"/>&nbsp; 
<img src="https://img.shields.io/badge/JQuery-0769AD?style=flat-square&logo=JQuery&logoColor=white"/>&nbsp;
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/>&nbsp; 
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3#&logoColor=white"/>&nbsp; 
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white">
### DB
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>&nbsp;
### Server
<img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=ApacheTomcat&logoColor=white"/>&nbsp;
<br><br><br>

## 홈페이지메인화면
![image](https://user-images.githubusercontent.com/74701876/125419250-8f825f44-48fb-4007-86a3-0c23e0ff875d.png)
<br><br><br>

## 데이터베이스 ERD(ERDCloud로 작성)
![erd](https://user-images.githubusercontent.com/74701876/125426441-b4a3a9b0-d05e-4ec1-9bfd-541f3b7e4540.png)


<br><br><br>

## 내가 수행한 작업
> <b>로그인 및 회원 가입</b> - 회원가입, 로그인, 아이디 찾기, 비밀번호 찾기<br>
> <b>마이페이지</b> - 내 정보 수정, 내가 작성한 글, 회원 탈퇴<br>
> <b>사이트 소개</b> - 서비스 소개, 게시판 및 채팅 이용 방법<br>
> <b>ERD<b> - ERDCloud로 ERD 제작
<hr>
  
# 내가 수행한 작업 설명

## 로그인 및 회원 가입 상세
> - 로그인
> - 회원가입 : 유효성 검사
> - 아이디, 비밀번호 찾기
  

## 로그인 화면
![그림1](https://user-images.githubusercontent.com/82127619/128467853-0329dea1-3c59-4eb7-929b-96da6ded1252.png)
![아이디찾기](https://user-images.githubusercontent.com/82127619/128468148-93b3c8c2-0320-49ce-b35e-5cec637cf170.png)
![비밀번호찾기](https://user-images.githubusercontent.com/82127619/128468156-c205d39f-9115-490d-a912-2ec3e74ac512.png)

- 회원가입 한 아이디/비밀번호 입력
- 로그인 후 서비스 이용 가능
  

## 회원가입 화면
![그림2](https://user-images.githubusercontent.com/82127619/128468385-28e6d060-89be-406f-8ebf-aeb6c40db0e5.png)
![MBTI](https://user-images.githubusercontent.com/82127619/128468591-b816e940-6266-43dd-8835-c801a1abc376.png)
![주소](https://user-images.githubusercontent.com/82127619/128468603-525685fb-8ec9-4274-b9c9-0fa8d61b9473.png)
![유효성검사](https://user-images.githubusercontent.com/82127619/128468605-f0af64ee-554d-4fe5-9ec1-5c1e930c438f.png)

- 회원 가입 시 필요한 정보 입력
- 아이디, 비밀번호, 닉네임은 중복검사 필수
- 각 항목별 유효성 검사 후 회원가입
  
## 마이페이지 화면
![내정보관리](https://user-images.githubusercontent.com/82127619/128468925-75caa73d-5419-4d07-8077-31f084416671.png)
![내정보수정](https://user-images.githubusercontent.com/82127619/128468943-cdb4834b-fc07-4b51-9254-7cb2dc093b14.png)
![내가작성한글](https://user-images.githubusercontent.com/82127619/128468946-41ef93c3-f68a-4dd3-b32d-85c48f1ecb62.png)
![회원탈퇴](https://user-images.githubusercontent.com/82127619/128468957-015ead24-41aa-4d9c-8572-8b52e24f2774.png)

  
- 마이페이지 접속 시 비밀번호 재 입력
- 내 정보 수정 시 아이디, 이름 제외 정보 수정 가능. 닉네임은 트리거를 이용하여 변경
- 작성자 조회로 내가 작성한 글 출력, 페이징 처리
- 비밀번호 재 입력 후 회원 탈퇴 

  
## 서비스 소개 화면
![서비스소개](https://user-images.githubusercontent.com/82127619/128469361-402c8551-d56a-40a5-bdf6-53e6de9be617.png)
![게시판이용방법](https://user-images.githubusercontent.com/82127619/128469362-d2800710-e9d6-4fcf-af34-0f103f4d7048.png)
![채팅이용방법](https://user-images.githubusercontent.com/82127619/128469365-fb3855a7-f31f-41d2-928f-be7bd5c9f766.png)
  
  
- 화면 상단 서비스 소개 클릭 시 서비스 소개, 게시판 이용방법, 채팅 이용 방법 노출
  
  
## 마무리
#### JSP프로젝트는 빨리 끝내기 위해 급하게 하느라 많은 기능을 넣진 못했다.
#### Git으로 merge를 하면서 발생한 오류들을 수정하면서 많이 배웠다.
  
  
### 아쉬운점
- 팀원이 한명 중간에 나가서 내 분량이 갑자기 많이 늘어서 시간이 부족했다
- git을 좀더 활발하게 사용해서 협업하고 싶었지만 많이 사용하지는 못했다.
