<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세읽기</title>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../includes/header.jsp"%>

			<div class="row">
				<div class="col-lg-5 " style="margin: 0 auto;">
					<div class="card shadow mb-4">
						<div class="card-header py-3 border-left-primary
						">
							<h1 class="page-header m-0 font-weight-bold text-primary">상세 읽기</h1>
						</div>
						<!-- END col-lg-12 -->

						<div class="card-body">

							<div class="form-group">
								<label>No</label> <input class="form-control" name="bno"
									value='<c:out value="${board.bno }"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<label>Title</label> <input class="form-control" name="title"
									value='<c:out value="${board.title }"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<lable>Text area</lable>
								<textarea class="form-control" rows="3" name="content"
									readonly="readonly"><c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> <input class="form-control" name="writer"
									value='<c:out value="${board.writer }"/>' readonly="readonly">
							</div>

							<button data-oper='modify' class="btn btn-warning"
								onclick="location.href=	'/board/modify?	bno=<c:out value="${board.bno }"/>'	">수정</button>
							<button data-oper='list' class="btn btn-primary"
								onclick="location.href=	'/board/list'	">리스트</button>
						</div>

						<!-- END panel-body -->
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-lg-5" style="margin: 0 auto;">
					<div class="card shadow mb-4">
						<div class="card-header py-3 border-left-primary
						">
							<div class="m-0 font-weight-bold text-primary"
								style="display: flex; justify-content: space-between; align-items: center;">
								댓글
								<button id='addReplyBtn'
									class="btn btn-primary btn-sm pull-right">댓글 입력</button>
							</div>
						</div>

						<!-- 댓글 목록 -->
						<div class="card-body">
							<ul class="chat" style="list-style: none; padding-left: 0px;">
								<li class="left clearfix" data-rno='12'>
									<div style="display: flex; justify-content: space-between;">
										<strong class="primary-font"></strong> <small
											class="pull-right text-muted"></small>
									</div>
									<div class="card list-group">
										<!-- 댓글 박스 -->
										<p></p>
									</div>
								</li>
							</ul>

							<!-- END panel-body -->
						</div>
					</div>
				</div>
			</div>
			<!-- END row -->
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content card shadow mb-4">
						<div class="modal-header card-header py-3 border-left-primary
						">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">댓글 창</h4>
						</div>
						<div class="modal-body card-body">
							<div class="form-group">
								<label>댓글</label> <input class="form-control" name='reply'
									value="댓글 입력">
							</div>
							<div class="form-group">
								<label>댓글 작성자</label> <input class="form-control" name='replyer'
									value="댓글 작성자">
							</div>
							<div class="form-group">
								<label>댓글 작성일</label> <input class="form-control"
									name='replyDate' value="댓글 작성일">
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
							<button id='modalRegisterBtn' type="button"
								class="btn btn-primary">등록</button>
							<button id='modalCloseBtn' type="button" class="btn btn-primary"
								data-dismiss="modal">닫기</button>
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
									var bno = '<c:out value="${board.bno}"/>';
									var replyUL = $(".chat");
									showList();
									function showList() {
										replyService
												.getList(
														{
															bno : bno
														},
														function(list) {
															var str = "";
															if (list == null
																	|| list.length == 0) {
																replyUL
																		.html("");
																return;
															}
															for (var i = 0, len = list.length || 0; i < len; i++) {
																str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
																str += "<div style='display: flex; justify-content: space-between;'><strong class='primary-font'>"
																		+ list[i].replyer
																		+ "</strong>";
																str += "<small class='pull-right text-muted'>"
																		+ replyService
																				.displayTime(list[i].replyDate)
																		+ "</small></div>";
																str += "<div class='card list-group'><p>"
																		+ list[i].reply
																		+ "</p></div></li><br>";
																console
																		.log(list[i]);
															}
															replyUL.html(str);
														});//getList END
									}//showList END

									var modal = $(".modal");
									var modalInputReply = modal
											.find("input[name='reply']");
									var modalInputReplyer = modal
											.find("input[name='replyer']");
									var modalInputReplyDate = modal
											.find("input[name='replyDate']");

									var modalModBtn = $("#modalModBtn");
									var modalRemoveBtn = $("#modalRemoveBtn");
									var modalRegisterBtn = $("#modalRegisterBtn");

									$("#addReplyBtn")
											.on(
													"click",
													function(e) {
														modal.find("input")
																.val("");
														modalInputReplyDate
																.closest("div")
																.hide();
														modal
																.find(
																		"button[id != 'modalCloseBtn']")
																.hide();

														modalRegisterBtn.show();
														$(".modal").modal(
																"show");

														modalRegisterBtn
																.on(
																		"click",
																		function(
																				e) {
																			var reply = {
																				reply : modalInputReply
																						.val(),
																				replyer : modalInputReplyer
																						.val(),
																				bno : bno
																			};
																			replyService
																					.add(
																							reply,
																							function(
																									result) {
																								alert(result);

																								modal
																										.find(
																												"input")
																										.val(
																												"");
																								modal
																										.modal("hide");
																								showList();
																							});//add END
																		});//modalRegisterBtn END
													});//addReplyBtn END

									$(".chat")
											.on(
													"click",
													"li",
													function(e) {
														var rno = $(this).data(
																"rno");
														replyService
																.get(
																		rno,
																		function(
																				reply) {
																			modalInputReply
																					.val(reply.reply);
																			modalInputReplyer
																					.val(reply.replyer);
																			modalInputReplyDate
																					.val(
																							replyService
																									.displayTime(reply.replyDate))
																					.attr(
																							"readonly",
																							"readonly");
																			modal
																					.data(
																							"rno",
																							reply.rno);

																			modal
																					.find(
																							"button[id !='modalCloseBtn']")
																					.hide();
																			modalModBtn
																					.show();
																			modalRemoveBtn
																					.show();

																			$(
																					".modal")
																					.modal(
																							"show");
																		});

													});//ul-li END

									modalModBtn.on("click", function(e) {
										var reply = {
											rno : modal.data("rno"),
											reply : modalInputReply.val()
										};
										replyService.update(reply, function(
												result) {
											alert(result);
											modal.modal("hide");
											showList();
										});
									});//modalModBtn

									modalRemoveBtn.on("click", function(e) {
										var rno = modal.data("rno");
										replyService.remove(rno, function(
												result) {
											alert(result);
											modal.modal("hide");
											showList();
										});
									});//modalRemoveBtn

								});
			</script>
			<!-- 			<script type="text/javascript">
			replyService.getList({bno:12}, function(list){
				for(var i=0, len=list.length; i<len; i++){
					console.log(list[i]);
				}
			});
			</script> -->
		</div>
	</div>
</body>
</html>