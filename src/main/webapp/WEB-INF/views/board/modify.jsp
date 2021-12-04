<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<input type="hidden" name="bno" value="${PageMaker.cri.bno}">
				<input type="hidden" name="pageNum" value="${PageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${PageMaker.cri.amount}">
				<input type="hidden" name="kwyword" value="${cri.keyword}">
				<input type="hidden" name="type" value="${cri.type}">
				<form action="">
					<div class="form-group">
						<label>BNO</label> <input class="form-control"
							placeholder="Enter text" name="bno"
							value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control"
							placeholder="Enter text" name="title"
							value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>content</label>
						<textarea class="form-control" rows="3" name="content"><c:out
								value="${board.content}" /></textarea>
					</div>
					<div class="form-group">
						<label>writer</label> <input class="form-control"
							placeholder="Enter text" name="writer"
							value='<c:out value="${board.writer}"/>'>
					</div>
					<button class="btn btn-default" data-oper="modify">Modify</button>
					<button class="btn btn-danger" data-oper="remove">Remove</button>
					<button class="btn btn-info" data-oper="list">List</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<script>
	$(function() {
		var formObj = $('form');
		$('button').on('click', function(e) {
			e.preventDefault();
			var operation = $(this).data('oper');
			console.log(operation);

			if (operation === 'remove') {
				formObj.attr('action','/board/delete').attr('method','post')
			} else if (operation === 'modify') {
				formObj.attr('action','/board/modify').attr('method','post')

			} else if (operation === 'list') {
				self.location='/board/list'
				return
			}
			formObj.submit();

		})
	})
</script>