<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Vegetable by TEMPLATED</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<!-- Cloud  Zoom -->
<script src="js/cloud-zoom.1.0.2.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery.jqpagination.min.js"></script>
<!-- Custom CSS -->
<link href="css/heroic-features.css" rel="stylesheet">
</head>
<body>
	<% session.setAttribute("target", "/member1104/productindex.jsp"); %>
	<div id="headcolor">
	<div id="menu1">
			<table id="menuhead">
			<tr>
				<c:if test="${empty mbr}">
					<div type="color:red">111</div>
	<!-- 				<li> <button id="myBtn">Login</button></li>-->
					<td class="current_page_item"><a href="index.jsp">首頁</a></td> 
					<td><a data-toggle="modal" id="myBtn">登入</a></td>
				</c:if>
				<c:if test="${not empty mbr}">
					<td><a href="testJSP.jsp">登出</a></td>
				</c:if>
				<td><a href="addMbr.jsp">註冊</a></td>
				<td><a href="mbrZone.jsp">會員專區</a></td>
				
				</tr>
			</table>
		</div>
		</div>
	<div id="header">
		<div id="logo">
			<h1><a href="#">PokeSong </a></h1>
		</div>
	</div>
	<!-- end #header -->
	<div id="wrapper">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#">電子產品</a></li>
				<li><a href="#">生活家電</a></li>
				<li><a href="#">零食餅乾</a></li>
				<li><a href="#">生鮮食品</a></li>
	<!-- 			<li><a href="#">居家生活</a></li> -->
			</ul>
		</div>
		<!-- end #menu -->
		<div id="search" >
			<form method="get" action="#">
				<div>
					<input type="text" name="s" id="search-text" value="" />
				</div>
			</form>
		</div>
	</div>
	
	<!---------------------------------------彈跳視窗--------------------------->
    <div class="container">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

<!-- 				Modal content -->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 會員登入
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="MemberServlet" method="post">
							<div class="form-group">
								<label for="usrname"><span class="glyphicon glyphicon-user"></span> 帳號</label> 
								<input type="text" class="form-control" id="usrname" name="member_id" placeholder="Enter email">
								<br><font color="red" size="-1">${errorMsgs.ErrIdEmpty}  ${errorMsgs.ErrIdFormat}  ${errorMsgs.ErrId}</font>
							</div>
							<div class="form-group">
								<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 密碼</label> 
								<input type="password" class="form-control" id="psw" name="member_password1" placeholder="Enter password">
								<br><font color="red" size="-1">${errorMsgs.ErrPasswordEmpty}  ${errorMsgs.ErrPasswordFormat} ${errorMsgs.Err} </font>
							</div>
							<div class="form-group">
								<!-- 輸入驗證碼欄位 -->
								<label for="identity">輸入驗證碼:</label>
								<input type="text" class="form-control" id="identity" name="identity" placeholder="不分大小寫">
								<br><font color="red" size="-1">${errorMsgs.ErrIdentityEmpty} ${errorMsgs.ErrIdentity}</font>
							</div>
							<img src="IdentityServlet" id="pic" style="width:100px; height:50px"/>
								<input type="button" id ="btn" value="換個圖片" >
							<div class="checkbox">
								<label><input type="checkbox" value="" checked>Remember	me</label>
							</div>
							<button type="submit" class="btn btn-success btn-block">
								<input type="hidden" name="action" value="login">
								<span class="glyphicon glyphicon-off"></span> 登入
							</button>
							
							<button class="btn btn-success btn-block">
							<a href="https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=444437052805-69ml6pka06cockj17ndvuocdnd9dnifg.apps.googleusercontent.com&redirect_uri=http://localhost:8081/testGoogle/Login.do&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email">以Google帳戶登入</a>				
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<p>
							<a href="addMbr.jsp">註冊</a>
						</p>
						<p>
							<a href="#">忘記密碼?</a>
						</p>
					</div>
				</div>

			</div>
		</div>
		
		
		
	<div id="myfavorite" style="position:fixed;top:100px;right:15px;z-index:9;font-size:9pt;"><div style="width:100px;height:100px;cursor:pointer;background:url(images/myfavorite.png);background-repeat:no-repeat;text-align:center;" onclick="to_myfavorite();"><div style="padding:24px 0px 0px 0px;font-size:11pt;font-family:微軟正黑體;color:white">我的最愛</div></div></div>	
	<div id="chkout" style="position:fixed;top:200px;right:15px;z-index:10;font-size:9pt;"><div style="width:100px;height:100px;cursor:pointer;background:url(images/ShoppingCart.png);background-repeat:no-repeat;text-align:center;" onclick="to_mycar1();"><div style="padding:2px 0px 0px 0px;font-size:11pt;font-family:微軟正黑體;color:white">結 帳</div><div style="font-weight:bold;color:red;font-family:arial;margin-top:-3px;">共 <span id="buycount_all_f" style="font-size:11pt;">0</span>  件</div></div>
	<!-- shopping car -->
	<script>
	// function mycar_bk(psn){
	//   $('body').append('<div id=bg style="display:none;position:fixed;width:100%;height:100%;background:#000;z-index:3;top:0;left:0;" ></div>'); $('#bg').animate({opacity:0.5},0);$('#bg').show();
	//   $.ajax({ type: 'post', url: '/shop2000_prog/templet/product/mycar_bk.aspx', dataType: 'json', data: {vdir:'', psn:psn }, success: function (data1) {
	//       if (data1.state1== 'ok') {
	//           $('#buycount_all_f').text(data1.buycount_tol);
	//           show_chkout_hint(psn);
	//       }else if (data1.state1== '會員方可購買') {
	//           alert('會員方可購買');mem_ksa_re();
	//       }else{
	//           alert(data1.state1);
	//       }
	//       setTimeout( "$('#bg').hide();" , 1000 );     
	//   }});
	// }
	// function show_chkout_hint(psn){
	//       $('#chkout_hint').hide();$('#chkout_hint').slideDown();
	//       setTimeout( "$('#chkout_hint').hide();" , 3000 );     
	//       $('#pcar'+psn).hide();$('#pcar'+psn).slideDown();
	// }
	</script>
	<script>
	function to_mycar1(){document.location.href="${pageContext.servletContext.contextPath}/ShowCartContent.jsp"}
	function to_mycar1_delay(){setTimeout('to_mycar1()', 500);}
	</script>
	<!-- -----------------------modal ----------------------------------->
	
	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal({
					backdrop : false
				});
			});
		});
	</script>
	<script>
	// 		驗證碼換張圖
	  	$(document).ready(function(){
	  		$("#btn").click(function(){  
	//   			alert("hi");
	  			$.get("IdentityServlet",{},function(data){
	//   				$("#pic").attr("src","${pageContext.servletContext.contextPath}/IdentityServlet");
	  				$("#pic").attr("src","IdentityServlet");
	  			})
	  		});
	  	});
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<form style="display:inline;" name="form_into" method="post" action="/product/mycar1"><input type="hidden" name="fr1" value="/"></form></div>
	<!-- end #footer -->
</body>
</html>
