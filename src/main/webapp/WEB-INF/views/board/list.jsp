<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id="regBtn" class="btn btn-xs pull-right" type="button">Register
					New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno }" /></td>
								<td><a class="move" href='<c:out value="${board.bno}"/>'>
								<c:out value="${board.title }" /><b>[<c:out value="${board.replyCnt}"/>]</b></td>
								<td><c:out value="${board.writer }" /></td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${board.regdate }" /></td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${board.upgragdedate}" /></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-12">
					<form action="/board/list" method="get" id="searchForm">
						<select name="type">
							<option value="" ${PageMaker.cri.type ==null?'selected':'' }>--</option>
							<option value="T" ${PageMaker.cri.type eq 'T'?'selected':'' }>제목</option>
							<option value="C" ${PageMaker.cri.type eq 'C'?'selected':'' }>내용</option>
							<option value="W" ${PageMaker.cri.type eq 'W'?'selected':'' }>작성자</option>
							<option value="TC" ${PageMaker.cri.type eq 'TC'?'selected':'' }>제목+내용</option>
							<option value="TW" ${PageMaker.cri.type eq 'TW'?'selected':'' }>제목+작성자</option>
							<option value="TWC" ${PageMaker.cri.type eq 'TWC'?'selected':'' }>제목+작성자+내용</option>
						</select> <input type="text" name="keyword" value="${PageMaker.cri.keyword }"> <input type="hidden"
							name="pageNum" value="${PageMaker.cri.pageNum}"> <input
							type="hidden" name="amount" value="${PageMaker.cri.amount}">
						<button class="btn btn-default">Search</button>
					</form>


					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTables-example_paginate">
						<ul class="pagination">
							<c:if test="${PageMaker.prev }">
								<li class="paginate_button previous"><a
									href="${PageMaker.startPage-1 }">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${PageMaker.startPage }"
								end="${PageMaker.endPage }">
								<li
									class="paginate_button ${PageMaker.cri.pageNum == num?'active':'' }"><a
									href="${num }"><c:out value="${num}"></c:out></a></li>

							</c:forEach>
							<c:if test="${PageMaker.next }">
								<li class="paginate_button next"><a
									href="${PageMaker.endPage+1 }">Next</a></li>
							</c:if>
						</ul>
					</div>
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum"	value="${PageMaker.cri.pageNum}"> 
						<input type="hidden" name="amount" value="${PageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${PageMaker.cri.keyword}">
						<input type="hidden" name="type" value="${PageMaker.cri.type}">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade in" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<%@include file="../include/footer.jsp"%>
<script>
	$(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({}, null, null);
		function checkModal(result) {
			if (result === '') {
				return;
			}
			if (result === 'success') {
				$('.modal-body').html("정상적으로 처리되었습니다.");

			} else if (parseInt(result) > 0) {
				$('.modal-body').html("게시글" + parseInt(result) + "번이 등록되었습니다.");
			}

			$("#myModal").modal('show');
		}

		$("#regBtn").click(function() {
			self.location = '/board/register'

		});

		var actionForm = $("#actionForm");
		$('.paginate_button a').on("click", function(e) {
			actionForm.attr("action", "/board/list");
			console.log("click");
			e.preventDefault();
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type = 'hidden' name = 'bno' value = '"
											+ $(this).attr('href') + "' >");
							actionForm.attr("action", "/board/get");
							actionForm.submit();
						});


		$('#searchForm button').on('click', function(e){
			var searchForm = $('#searchForm');
			
			if(!searchForm.find('option:selected').val()){
				alert('검색종류를 선택하세요.');
				return false;
			}
			
			if(!searchForm.find('input[name="keyword"]').val()){
				alert('검색어를 입력하세요.');
				return false;
			}
			
			searchForm.find('input[name="pageNum"]').val('1');
			e.preventDefault();
			searchForm.submit();
		});

	})
</script>