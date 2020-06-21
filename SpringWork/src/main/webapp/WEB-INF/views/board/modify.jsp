<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../includes/header.jsp"%>

			<script type="text/javascript">
				$(document).ready(function() {
					var formObj = $("form");
					$('button').on("click", function(e) {
						e.preventDefault();
						var operation = $(this).data("oper");
						console.log(operation);

						if (operation === 'remove') {
							formObj.attr("action", "/board/remove");
						} else if (operation === 'list') {
							self.location = "/board/list";
							return;
						}
						formObj.submit();
					});
				});
			</script>


			<div class="row">
				<div class="col-lg-5" style="margin: 0 auto;">
					<div class="card shadow mb-4">
						<div class="card-header py-3 border-left-primary
						">
							<h1 class="page-header m-0 font-weight-bold text-primary">수정</h1>
						</div>
						<!-- END col-lg-12 -->

						<div class="card-body">

							<form action="/board/modify" method="post">
								<div class="form-group">
									<label>No</label> <input class="form-control" name="bno"
										value='<c:out value="${board.bno }"/>' readonly="readonly">
								</div>
								<div class="form-group">
									<label>Title</label> <input class="form-control" name="title"
										value='<c:out value="${board.title }"/>'>
								</div>
								<div class="form-group">
									<lable>Text area</lable>
									<textarea class="form-control" rows="3" name="content"><c:out
											value="${board.content }" /></textarea>
								</div>
								<div class="form-group">
									<label>Writer</label> <input class="form-control" name="writer"
										value='<c:out value="${board.writer }"/>'>
								</div>
								<button type="submit" data-oper='modify' class="btn btn-warning">수정</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
								<button type="submit" data-oper='list' class="btn btn-primary">리스트</button>
							</form>
						</div>
					</div>
				</div>
				<!-- END panel-body -->
			</div>
			<!-- END row -->


			<%@include file="../includes/footer.jsp"%>
		</div>
	</div>
</body>
</html>