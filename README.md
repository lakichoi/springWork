# springWork

## A. 개요
Spring FrameWork를 활용한 게시판 CRUD와 AJAX/JSON을 활용한 RestAPI 방식의 댓글시스템 구현.

## B. 구현목록
- Board   
  1.게시판 목록   
2.게시글 쓰기    
3.게시글 읽기     
4.게시글 수정   
5.게시글 삭제   

- Reply   
6.댓글 목록   
7.댓글 읽기   
8.댓글 쓰기   
9.댓글 수정   
10.댓글 삭제
   
![BoardList](https://user-images.githubusercontent.com/60164218/85234055-d525f880-b445-11ea-91c9-1bedb2c77cde.PNG)   
게시판 목록 : 페이지네이션, 검색은 부트스트랩 내장 JS로 처리.   
---   
<br>   

![BoardCreate](https://user-images.githubusercontent.com/60164218/85234051-d22b0800-b445-11ea-874b-bb30040cb8cb.PNG)   
게시글 등록 : addFlashAttribute()를 이용하여 중복 등록 방지.   
---   
<br>   
![ModalCreate](https://user-images.githubusercontent.com/60164218/85234250-fd622700-b446-11ea-82b9-da1d52c55167.PNG)   
알림창 : 등록 성공 Modal창 구현.   
---   
<br>  
![BoardRead](https://user-images.githubusercontent.com/60164218/85234056-d5be8f00-b445-11ea-93ad-7ce094083e68.PNG)   
게시글 읽기 : 게시글 수정 / 리스트로 이동 가능한 버튼 구현   
---   
<br>   
![BoardUpdate](https://user-images.githubusercontent.com/60164218/85234057-d6572580-b445-11ea-9343-ee53e9058fc3.PNG)   
게시글 수정 : 수정완료 / 게시글삭제 / 리스트로 이동 가능한 버튼 구현   
---   
<br>   
![ReList](https://user-images.githubusercontent.com/60164218/85234060-d6efbc00-b445-11ea-9580-da370cde3901.PNG)   
댓글 목록 : AJAX / JSON을 활용하여 게시글 읽기창에서 확인가능한 댓글 목록 리스트 구현.   
---   
<br>   
![ReCreate](https://user-images.githubusercontent.com/60164218/85234059-d6efbc00-b445-11ea-8f5b-6db95329e0cd.PNG)   
댓글 등록 : Modal창을 활용하여 페이지 이동 없이 댓글 등록 기능 구현.   
---   
<br>    
![ReUpdateDelete](https://user-images.githubusercontent.com/60164218/85234061-d7885280-b445-11ea-9389-67c8a87f692b.PNG)   
댓글 읽기 : 댓글을 클릭하면 수정, 삭제가능한 Modal창 구현.   
---   

## C. 개발 환경   
- Tool   
  - OS : Window10   
  - JAVA : JDK 1.8   
  - Server : Tomcat 8.5   
  - Eclipse : 2020-03   
  - MySQL : 8.0.20   
  - Spring FrameWork   
  - BootStrap   
  - Git   

- Language   
  - Java 1.8   
  - SQL   
  - AJAX / JSON
  - HTML5   
  - CSS3   
  - JQuery   
  - XML   




