<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="../includes/header.jsp"%>
			<div class="row">
				<div class="col-lg-5" style="margin: 0 auto;">
					<div class="card shadow mb-4">
						<div class="card-header py-3 border-left-primary
						">
							<h1 class="page-header m-0 font-weight-bold text-primary">글쓰기</h1>
						</div>


						<!-- END col-lg-12 -->

						<div class="card-body">
							<form action="/board/register" method="post">

								<div class="form-group">
									<input class="form-control" name="title" placeholder="제목">
								</div>
								<div class="form-group">

									<textarea class="form-control" rows="10" name="content"
										placeholder="내용"></textarea>
								</div>
								<div class="form-group">
									<input class="form-control" name="writer" placeholder="작성자">
								</div>
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="reset" class="btn btn-primary">취소</button>

							</form>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>