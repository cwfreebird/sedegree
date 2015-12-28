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
            <li><a href="${pageContext.request.contextPath}/user/index.do">首页</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/customer/list.do" target="_self">用户信息</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <div class="container theme-showcase" role="main">
    	<div class="row">
	    	<div class="panel panel-info">
	            <div class="panel-heading">
	              <h3 class="panel-title">用户信息</h3>
	            </div>
	            <div class="panel-body">
	            	<div class="row">
        				<div class="col-md-12">
        					<table class="table table-striped">
								<thead>
									<tr>
										<th>姓名</th>
										<th>联系电话</th>
										<th>地址</th>
										<th>状态</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty customers}">
									<tr>
										<td colspan="10">没有记录</td>
									</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="customer" items="${customers}">
											<tr>
												<td>${customer.name}</td>
												<td>${customer.mobile}</td>
												<td>${customer.address}</td>
												<td>${customer.status}</td>
												<td><fmt:formatDate value="${customer.createTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><a href="${pageContext.request.contextPath}/customer/detail/${customer.id}.do">修改</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
        				</div>
	        		</div>
	            </div>
	        </div>
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