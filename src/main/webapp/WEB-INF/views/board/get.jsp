<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Read page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>BNO</label> <input class="form-control"
						placeholder="Enter text" name="bno" readonly="readonly"
						value='<c:out value="${board.bno}"/>'>
				</div>
				<div class="form-group">
					<label>Title</label> <input class="form-control"
						placeholder="Enter text" name="title" readonly="readonly"
						value='<c:out value="${board.title}"/>'>
				</div>
				<div class="form-group">
					<label>content</label>
					<textarea class="form-control" rows="3" name="content"
						readonly="readonly"><c:out value="${board.content}" /></textarea>
				</div>
				<div class="form-group">
					<label>writer</label> <input class="form-control"
						placeholder="Enter text" name="writer" readonly="readonly"
						value='<c:out value="${board.writer}"/>'>
				</div>
				<button id="list" class="btn btn-default listBtn">List</button>
				<button class="btn btn-info modBtn"
					onclick="location.href='modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
			</div>
			<form id="actionForm" action="/board/list" method="get">
				<input type="hidden" name="bno" value="${board.bno}"> <input
					type="hidden" name="pageNum" value="${cri.pageNum}"> <input
					type="hidden" name="amount" value="${cri.amount}">
			</form>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New
					Reply</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
				</ul>
			</div>
			<!-- /.panel-body -->
			<div class="panel-footer"></div>
			<!-- /.panel-footer -->
		</div>

	</div>
</div>

<div class="modal fade in" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label><input class="form-control" name="reply"
						value="New Reply">
				</div>
				<div class="form-group">
					<label>replyer</label><input class="form-control" name="replyer"
						value="replyer">
				</div>
				<div class="form-group">
					<label>replyDate</label><input class="form-control"
						name="replyDate" value="2021-11-27 11:40">
				</div>

			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning"
					data-dismiss="modal">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger"
					data-dismiss="modal">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default"
					data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<%@include file="../include/footer.jsp"%>
<script src="/resources/js/reply.js"></script>


<script>
	$(function() {
		console.log(replyService);

		var bnoValue = '<c:out value="${board.bno}" />';
		showList(1)
		/*
		replyService.remove(10,function(){
			console.log("count : " + count);
			if(result==="success"){
				alert("REMOVED");
			}
		});
		 */

		/*
		replyService.update({rno:11,bno:bnoValue, reply:"update data"},function(result){
			alert("수정완료..........");
			
		});
		 */
		/*
		replyService.getList({bno : bnoValue,page : 1},function(list){
			for(var i = 0, len= list.length||0;i<len;i++){
				console.log(list[i]);
			}
		});
		 */

		/*
		replyService.add({reply:"JS TEST",replyer:"tester",bno:bnoValue},function(result){
			alert("result: " + result);
		})
		
		 */

		/*
		
		
		replyService.get(11,function(data){
			console.log(data);
		})
		 */
		var replyUL = $(".chat");
		pageNum;
		function showList(page) {
			replyService
					.getList(
							{
								bno : bnoValue,
								page : pageNum
							},
							function(replyCnt,list) {
								var str = "";
								if(page == -1){
									pageNum = Math.ceil(replyCnt/10.0);
									showList(pageNum);
									return;
								}
								if (list == null || list.length == 0) {
									replyUL.html("");
									return;
								}
								for (var i = 0, len = list.length || 0; i < len; i++) {
									//console.log(list[i]);
									str += '<li class="left clearfix" data-rno="'+list[i].rno+'">';
									str += '<div><div class="header"><strong class="primary-font">'
											+ list[i].replyer + '</strong>';
									str += '<small class="pull-right text-muted">'
											+ replyService
													.displayTime(list[i].replyDate)
											+ '</small></div>';
									str += '<p>' + list[i].reply
											+ '</p></div></li>';
								}
								replyUL.html(str);
								showReplyPage(replyCnt);
							});

		}

		var modal = $('.modal');
		var modalInputReply = modal.find('input[name="reply"]');
		var modalInputReplyer = modal.find('input[name="replyer"]');
		var modalInputReplyDate = modal.find('input[name="replyDate"]');
		var modalRemoveBtn = $('#modalRemoveBtn')
		var modalModifyBtn = $('#modalModBtn')
		var modalRegisterBtn = $('#modalRegisterBtn');
		
		var pageNum = 1;
		var replyPageFooter = $('.panel-footer');
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum/10.0)*10;
			var startNum = endNum -9;
			var prev = startNum !=1;
			var next = false;
			if(endNum*10>= replyCnt){
				endNum = Math.ceil(replyCnt/10);
			}if(endNum*10<replyCnt){
				next = true;
			}
			var str="<ul class = 'pagination pull-right'>";
			if(prev){
				str+="<li class='paginate_button previous'><a href='"+${startNum-1 }+"'>Previous</a></li>"
			}
			for(var i = startNum;i<=endNum;i++){
				var active = (pageNum==i)?'active':'';
				str+="<li class='paginate_button' "+active+"><a href='"+i+"'>"+i+"</a></li>"
			}
			if(next){
				str+="<li class='paginate_button next'><a href='"+${endNum+1}+"'>Next</a></li>"
			}
			
			str+="</ul>"
			replyPageFooter.html(str);
		}
		replyPageFooter.on('click','li a',function(e){
			e.preventDefault();
			console.log("page click");
			var targetPageNum = $(this).attr("href");
			console.log(targetPageNum);
			pageNum = targetPageNum; 
			showList(pageNum);
			
			
			
		})

		$('#addReplyBtn').on('click', function(e) {
			modal.find('input').val('');
			modalInputReplyer.attr("readonly",false);
			modalInputReplyDate.closest('div').hide();
			modal.find('button[id!=modalCloseBtn]').hide();
			modalRegisterBtn.show();
			modal.modal('show');
		})
		$('#modalCloseBtn').on('click', function(e) {
			modal.modal('hide')

		})

		modalRegisterBtn.on("click", function() {
			var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
			}
			replyService.add(reply, function(result) {
				modal.find('input').val('');
				modal.modal('hide');
				showList(-1);

			})
		})

		$('.chat').on(
				"click",
				'li',
				function(e) {
					var rno = $(this).data('rno');
					console.log(rno);
					replyService.get(rno, function(data) {
						//console.log(data);
						modalInputReply.val(data.reply);
						modalInputReplyer.val(data.replyer).attr('readonly',
								'readonly');
						modalInputReplyDate.val(
								replyService.displayTime(data.replyDate)).attr(
								'readonly', 'readonly');
						modal.data('rno', data.rno)
						modal.find('button[id!=modalCloseBtn]').hide();
						modalRemoveBtn.show();
						modalModifyBtn.show();
						modal.modal('show');
					})

				})

		modalModifyBtn.on("click", function() {
			var reply = {
				rno : modal.data('rno'),
				bno : bnoValue,
				reply : modalInputReply.val()
			};
			replyService.update(reply, function(result) {
				alert(result);
				modal.modal('hide');
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function() {
			var reply = modal.data('rno');
			replyService.remove(reply, function(result) {
				alert(result);
				modal.modal('hide');
				showList(pageNum);

			});
		});

	});

	$(function() {
		$("#list").on("click", function(e) {
			e.preventDefault;
			var actionform = $("#actionForm");
			actionform.submit();

		})

	})
</script>