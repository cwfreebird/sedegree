<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${pageContext.request.contextPath}/resource/dist/images/favicon.ico">
<title>首页</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resource/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${pageContext.request.contextPath}/resource/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${pageContext.request.contextPath}/resource/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <style type="text/css">
    .nowrap-text {
    	line-height: 54px;
		white-space: pre-wrap;
    }
    </style>
</head>
<body role="document">
	<nav class="navbar navbar-inverse ">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <img src="${pageContext.request.contextPath}/resource/images/logo.png"/>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <div class="alert alert-warning" role="alert">
    	<h2>次度男装，与您一起共同关注老人与儿童,<a href='<c:url value="/customer/detail/${customer.id}.do"></c:url>'>点击修改联系信息</a></h2>
    	<h3>联系人　：<span class="label label-warning">${customer.name}</span></h3>
    	<h3>联系电话：<span class="label label-warning">${customer.mobile}</span></h3>
        <h3>联系地址：<span class="label label-warning nowrap-text">${customer.address}</span></h3>
    </div>
	
    <footer>
        <p>&copy; 次度男装 2016</p>
    </footer>
    
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resource/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/resource/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resource/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>