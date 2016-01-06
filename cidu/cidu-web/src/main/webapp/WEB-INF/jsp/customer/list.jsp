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
                                    <a tabindex="-1" href="<c:url value="/logout.do" />">注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/index.do">首页</a></li>
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
	                         <a href="#addCustomerDiv" data-toggle="modal" style="padding: 2px;"><button class="btn btn-primary ">新增 <i class="icon-plus icon-white"></i></button></a>
	                         <button class="btn btn-primary " id="downloadImages">下载二维码 <i class="icon-download-alt icon-white"></i></button>
	                         <a href="#updateFlagDiv" data-toggle="modal" style="padding: 2px;"><button class="btn btn-primary " id="updateFlag">设置标识 <i class="icon-edit icon-white"></i></button></a>
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
	                   <form action="" id="form" target="_blank" method="post">
	                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered " id="cusotmerTable">
	                        <thead>
	                            <tr>
	                                <th width="5%"></th>
	                                <th>id</th>
	                                <th width="10%">姓名</th>
									<th width="15%">联系电话</th>
									<th>地址</th>
									<th width="6%">使用标识</th>
									<th width="6%">状态</th>
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
												<td><input type="checkbox" name="fileIds" value="${customer.id}"></td>
												<td>${customer.id}</td>
												<td>${customer.name}</td>
												<td>${customer.mobile}</td>
												<td>${customer.address}</td>
												<td><span class="label label-success"><c:if test="${customer.flag eq '0'}">未使用</c:if></span><span class="label label-warning"><c:if test="${customer.flag eq '1'}">已使用</c:if></span></td>
												<td><c:if test="${customer.status eq 'Y'}">有效</c:if><c:if test="${customer.status eq 'N'}">无效</c:if></td>
												<td><fmt:formatDate value="${customer.createTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>
													<div class="btn-group">
								                         <a href="${pageContext.request.contextPath}/customer/detail/${customer.id}.do" style="padding: 2px;"><button type="button" class="btn btn-success btn-mini">修改 <i class="icon-pencil icon-white"></i></button></a>
								                         <a href="#matrixDiv" data-toggle="modal"><button class="btn btn-info btn-mini" name="matrixButton" _custName="${customer.name}" _custId="${customer.id}">二维码<i class="icon-barcode icon-white"></i></button></a>
								                    </div>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
	                    </table>
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
	<div id="addCustomerDiv" class="modal hide" style="width: 350px;">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>新增客户</h3>
		</div>
		<div class="modal-body">
			<div class="block-content collapse in">
			<form action="<c:url value="/customer/add.do"></c:url>" class="form-horizontal" method="post">
				<label class="control-label">请选择新增记录数<span class="required">*</span></label>
				<div class="controls">
					<select class="span6 m-wrap" name="records" style="width: 100px;">
						<option value="1">1</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</div>
				<div class="form-actions">
                  <button type="submit" class="btn btn-primary">新增</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
			</div>
		</div>
	</div>
	<div id="updateFlagDiv" class="modal hide" style="width: 40%;">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>修改使用标识</h3>
		</div>
		<div class="modal-body">
			<div class="block-content collapse in">
			<form action="<c:url value="/customer/updateFlag.do"></c:url>" class="form-horizontal" id="updateFlagForm" method="post">
				<input type="hidden" name="updateFlagForm_fileIds" id="updateFlagForm_fileIds">
				<div class="control-group">
                  <label class="control-label">使用标识</label>
                  <div class="controls">
                  <label style="float: left; padding-right: 10px;">
                      <input type="radio" name="updateFlagForm_flag" value="0">未使用
                  </label>
                  <label>
                      <input type="radio" name="updateFlagForm_flag" value="1">已使用
                  </label>
                  </div>
                </div>
				<div class="form-actions">
                  <button type="button" class="btn btn-primary" id="updateFlagSubmit">保存</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
			</div>
		</div>
	</div>
	<div id="matrixDiv" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3 id="matrix_customer_name">${customer.name}</h3>
		</div>
		<div class="modal-body">
			<p id="matrix_image_url"><img src='${matrixImageUrl}${customer.id}.gif'></p>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resource/vendors/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resource/assets/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
	    $("#cusotmerTable").DataTable({
	        "order": [[ 7, "desc" ]],
	        "columnDefs": [
               {
                   "targets": [ 0 ],
                   "searchable": false,
                   "orderable":false
               },
               {
                   "targets": [ 1 ],
                   "visible": false,
                   "searchable": true
               }
           	],
           	"language": {
           		"search":         "查询:",
           		"zeroRecords":    "没有匹配的记录",
           		"infoEmpty":      "显示 0 条记录",
           	    "infoFiltered":   "(没有匹配的记录 共 _MAX_ 条记录)",
           	 	"lengthMenu":     "显示 _MENU_ 条记录",
         	    "info":           "第 _PAGE_ 页,共 _PAGES_ 页"
         	 }
	    });
	    
	    
	});
    $(function() {
    	$("#downloadImages").click(function(){
    		$("#form").attr("action" , "<c:url value="/customer/download.do"></c:url>");
	    	
	    	if($(":checkbox[name='fileIds']:checked").length == 0){
	    		alert("请先选中记录");
	    		return;
	    	}
	    	
	    	$("#form").submit();
	    	/* 
	    	$.ajax({
	    		type: "post",
				cache: false,
				url:"${pageContext.request.contextPath}/customer/download.do",
				data:{"fileIds": fileIds,"${_csrf.parameterName}":"${_csrf.token}"},
				success: function (result){
					
				},
	    		error: function (XMLHttpRequest, textStatus, errorThrown){
		            alert("下载出错");
	        	}
	    	}); */
	    });
    	
    	$("#updateFlag").click(function(){
	    	if($(":checkbox[name='fileIds']:checked").length == 0){
	    		alert("请先选中记录");
	    		return false;
	    	}
	    });
    	
    	$(":button[name='matrixButton']").click(function(){
	    	$("#matrix_customer_name").html($(this).attr("_custName"));
	    	$("#matrix_image_url").html("<img src='${matrixImageUrl}" + $(this).attr("_custId") + ".gif'>");
	    	//alert($("#matrix_customer_name").html());
	    	//alert($("#matrix_image_url").html());
	    	//return false;
	    });
    	
    	$("#updateFlagSubmit").click(function(){
			var fileIds = "";
    		
	    	$(":checkbox[name='fileIds']:checked").each(function(){
    			fileIds += $(this).val() + ",";
	    	});
	    	
			$("#updateFlagForm_fileIds").val(fileIds.substring(0, fileIds.length - 1));
	    	
			if(typeof($(":radio[name='updateFlagForm_flag']:checked").val()) === "undefined"){
				alert("请选择使用标识");
				return;
			}
			
			$("#updateFlagForm").submit();
	    });

    });
	
    </script>
</body>
</html>