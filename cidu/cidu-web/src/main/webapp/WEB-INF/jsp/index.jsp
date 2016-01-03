<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
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
          <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
                            	<i class="icon-user"></i> ${userName}
                            	<i class="caret"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a tabindex="-1" href="<c:url value="/login.do?logout" />">注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/user/index.do">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/list.do" target="_self">用户信息</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <div class="container theme-showcase" role="main">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="${pageContext.request.contextPath}/resource/images/1.jpg" data-src="holder.js/1140x700/auto/#666:#444/text:First slide" alt="First slide">
          </div>
          <div class="item">
            <img src="${pageContext.request.contextPath}/resource/images/2.jpg" data-src="holder.js/1140x700/auto/#666:#444/text:Second slide" alt="Second slide">
          </div>
          <div class="item">
            <img src="${pageContext.request.contextPath}/resource/images/3.jpg" data-src="holder.js/1140x700/auto/#555:#333/text:Third slide" alt="Third slide">
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>
    </div>

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