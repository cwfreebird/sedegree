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
                                    <a tabindex="-1" href="<c:url value="/login.do?logout" />">注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/user/index.do">首页</a></li>
            			<li class="active"><a href="${pageContext.request.contextPath}/customer/list.do" target="_self">客户信息</a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
    
    <div class="container-fluid">
    	<div class="row-fluid">
	        <!-- block -->
	        <div class="block">
	            <div class="navbar navbar-inner block-header">
	                <div class="muted pull-left">客户信息</div>
	            </div>
	            <div class="block-content collapse in">
	                <div class="span12">
	                   <div class="table-toolbar">
	                      <div class="btn-group">
	                         <a href="${pageContext.request.contextPath}/customer/add.do"><button class="btn btn-warning">新增 <i class="icon-plus icon-white"></i></button></a>
	                      </div>
	                      <div class="btn-group pull-right">
	                         <button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
	                         <ul class="dropdown-menu">
	                            <li><a href="#">Print</a></li>
	                            <li><a href="#">Save as PDF</a></li>
	                            <li><a href="#">Export to Excel</a></li>
	                         </ul>
	                      </div>
	                   </div>
	                    
	                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered " id="cusotmerTable">
	                        <thead>
	                            <tr>
	                                <th width="10%">姓名</th>
									<th width="15%">联系电话</th>
									<th>地址</th>
									<th width="10%">状态</th>
									<th width="15%">创建时间</th>
									<th width="10%">操作</th>
	                            </tr>
	                        </thead>
	                        <c:choose>
								<c:when test="${empty customers}">
									<tr>
										<td colspan="10">没有记录</td>
									</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="customer" items="${customers}" varStatus="status">
											<tr>
												<td>${customer.name}</td>
												<td>${customer.mobile}</td>
												<td>${customer.address}</td>
												<td><c:if test="${customer.status eq 'Y'}">有效</c:if><c:if test="${customer.status eq 'N'}">无效</c:if></td>
												<td><fmt:formatDate value="${customer.createTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>
													<div class="btn-group">
								                         <a href="${pageContext.request.contextPath}/customer/detail/${customer.id}.do" style="padding: 2px;"><button class="btn btn-success btn-mini">修改 <i class="icon-pencil icon-white"></i></button></a>
								                         <a href="#matrix_${status.index}" data-toggle="modal"><button class="btn btn-info btn-mini">二维码<i class="icon-barcode icon-white"></i></button></a>
								                    </div>
								                    <div id="matrix_${status.index}" class="modal hide">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">&times;</button>
															<h3>${customer.name}</h3>
														</div>
														<div class="modal-body">
															<p><img src='${pageContext.request.contextPath}/resource/images/1.jpg'></p>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /block -->
	    </div>
        <footer>
            <p>&copy; 次度 2016</p>
        </footer>
    </div>
	
	<script src="${pageContext.request.contextPath}/resource/vendors/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resource/assets/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
	    $("#cusotmerTable").DataTable({
	        "order": [[ 4, "desc" ]]
	    } );
	});
    $(function() {
        $('.tooltip').tooltip();	
		$('.tooltip-left').tooltip({ placement: 'left' });	
		$('.tooltip-right').tooltip({ placement: 'right' });	
		$('.tooltip-top').tooltip({ placement: 'top' });	
		$('.tooltip-bottom').tooltip({ placement: 'bottom' });

		$('.popover-left').popover({placement: 'left', trigger: 'hover'});
		$('.popover-right').popover({placement: 'right', trigger: 'hover'});
		$('.popover-top').popover({placement: 'top', trigger: 'hover'});
		$('.popover-bottom').popover({placement: 'bottom', trigger: 'hover'});

		$('.notification').click(function() {
			var $id = $(this).attr('id');
			switch($id) {
				case 'notification-sticky':
					$.jGrowl("Stick this!", { sticky: true });
				break;

				case 'notification-header':
					$.jGrowl("A message with a header", { header: 'Important' });
				break;

				default:
					$.jGrowl("Hello world!");
				break;
			}
		});
    });

    </script>
</body>
</html>