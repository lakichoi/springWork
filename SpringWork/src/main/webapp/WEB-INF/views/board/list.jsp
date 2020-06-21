<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<title>글 목록</title>


</head>

<body id="page-top">



	<%@include file="../includes/header.jsp"%>

	
	<!-- Main Content -->
	<div id="content">


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">게시글 목록</h1>
			<p class="aaaa"></p>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">목록
						</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${list }">
									<tr>
										<td>${board.bno }</td>
										<td><a href="/board/get?bno=<c:out value="${board.bno }"/>">${board.title }</a></td>
										<td>${board.writer }</td>
										<td><fmt:formatDate pattern="yy-MM-dd" value="${board.regdate }"/></td>
										<td><fmt:formatDate pattern="yy-MM-dd" value="${board.updateDate }"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-primary pull-rignt">글쓰기</button>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLable" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">게시물이 성공적으로 삭제되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							<!-- <button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button> -->
						</div>
					</div>
					<!-- END modal-content -->
				</div>
				<!-- END modla-dialog -->

			</div>
			<!-- END Modal -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->




	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="../includes/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value="${result}"/>';
							checkModal(result);
							history.replaceState({},null,null);
							
							function checkModal(result) {
								if (result === '' || history.state) {
									return;
								}
								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글이 성공적으로 등록되었습니다.");
								}else if(result === 'updateSuccess'){
									$(".modal-body").html("게시글이 성공적으로 수정되었습니다.")
								}

								$("#myModal").modal("show");
							}/* checkModal END */

							$("#regBtn").on("click", function() {
								self.location = "/board/register";
							});
							
							/* var	list='${list}';
							var bno = '<c:out value="${board.bno}"/>';
							var selector=$('rnoCount');
							
							
							replyService.rnoCount({bno:bno}, function(data){
								var str="";
								if(data==null){
									str.html("");
									return;
								}else{
									str ="["+data.count+"]";
								}
									선택자.html(str);
							}); */
						});
	</script>
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			alert("main");
			var bno = '<c:out value="${board.bno}"/>';
			var selector=$('rnoCount');
			replyService.rnoCount({bno:bno}, function(data){
				var str="";
				if(data==null){
					str.html("");
					return;
				}else{
					str ="["+data.count+"]";
				}
					str.html(str);
			});
		});
	</script> -->


</body>

</html>