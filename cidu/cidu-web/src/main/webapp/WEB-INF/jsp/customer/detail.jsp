<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${pageContext.request.contextPath}/resource/dist/images/favicon.ico">
<title>首页</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/resource/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">Sedegree<%-- <img src="${pageContext.request.contextPath}/resource/images/logo.png"/> --%></a>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
                            	<i class="icon-user"></i> ${userName}
                            	<i class="caret"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- <li>
                                    <a tabindex="-1" href="#">Profile</a>
                                </li>
                                <li class="divider"></li> -->
                                <li>
                                    <a tabindex="-1" href="<c:url value="/logout.do" />">注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav">
                    	<sec:authorize access="hasRole('ADMIN')">
                        <li><a href="${pageContext.request.contextPath}/index.do">首页</a></li>
            			<li class="active"><a href="${pageContext.request.contextPath}/customer/list.do" target="_self">客户信息</a></li>
            			</sec:authorize>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
    
	<div class="container-fluid">
	    <!-- morris stacked chart -->
	    <div class="row-fluid">
	        <!-- block -->
	        <div class="block">
	            <div class="navbar navbar-inner block-header">
	                <div class="muted pull-left">修改客户信息</div>
	            </div>
	            <div class="block-content collapse in">
	                <div class="span12">
	                     <form action="<c:url value="/customer/update.do"></c:url>" class="form-horizontal" method="post">
	                     	<input type="hidden" name="id" value="${customer.id}"/>
	                      <fieldset>
	                        <!-- <legend>Form Horizontal</legend> -->
	                        <div class="control-group">
	                          <label class="control-label" for="name">姓名</label>
	                          <div class="controls">
	                            <input class="input-xlarge focused" id="name" type="text" name="name" value="${customer.name}" placeholder="请输入姓名">
	                          </div>
	                        </div>
	                        <div class="control-group">
	                          <label class="control-label" for="mobile">联系电话</label>
	                          <div class="controls">
	                            <input class="input-xlarge focused" id="mobile" type="text" name="mobile" value="${customer.mobile}" placeholder="请输入联系电话">
	                          </div>
	                        </div>
	                        <div class="control-group">
	                          <label class="control-label" for="address">地址</label>
	                          <div class="controls">
	                            <input class="input-xlarge focused" id="address" type="text" name="address" value="${customer.address}" placeholder="请输入地址">
	                          </div>
	                        </div>
	                        <sec:authorize access="hasRole('ADMIN')">
	                        <div class="control-group">
	                          <label class="control-label">使用标识</label>
	                          <div class="controls">
	                          <label style="float: left; padding-right: 10px;">
	                              <input type="radio" name="flag" value="0" <c:if test="${customer.flag eq '0'}">checked</c:if>>未使用
	                          </label>
	                          <label>
	                              <input type="radio" name="flag" value="1" <c:if test="${customer.flag eq '1'}">checked</c:if>>已使用
	                          </label>
	                          </div>
	                        </div>
	                        <div class="control-group">
	                          <label class="control-label">状态</label>
	                          <div class="controls">
	                          <label style="float: left; padding-right: 10px;">
	                              <input type="radio" name="status" value="Y" <c:if test="${customer.status eq 'Y'}">checked</c:if>>有效
	                          </label>
	                          <label>
	                              <input type="radio" name="status" value="N" <c:if test="${customer.status eq 'N'}">checked</c:if>>无效
	                          </label>
	                          </div>
	                        </div>
	                        </sec:authorize>
	                        <div class="control-group">
	                          <label class="control-label">创建时间</label>
	                          <div class="controls">
	                            <span class="input-xlarge uneditable-input"><fmt:formatDate value="${customer.createTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></span>
	                          </div>
	                        </div>
	                        <div class="form-actions">
	                          <button type="submit" class="btn btn-primary">保存</button>
	                          <button type="reset" class="btn">取消</button>
	                          <sec:authorize access="hasRole('ADMIN')">
	                          <button type="button" class="btn btn-info" onclick="window.history.back(-1);">返回</button>
	                          </sec:authorize>
	                        </div>
	                      </fieldset>
	                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    </form>
	                </div>
	            </div>
	        </div>
	        <!-- /block -->
	    </div>
	    <footer>
            <p>&copy; 次度 2016</p>
        </footer>
	</div>
	
	<script src="${pageContext.request.contextPath}/resource/vendors/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resource/assets/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.js"></script>
    <script>
    $(function() {
        
    });
    </script>
</body>
</html>