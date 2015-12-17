<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/customer/update.do" method="post">
	<input type="hidden" name="id" value="${customer.id}"/>
	<table width="100%">
		<tr>
			<td>姓名</td>
			<td><input type="text" name="name" value="${customer.name}"/> </td>
			<td>联系电话</td>
			<td><input type="text" name="mobile" value="${customer.mobile}"/> </td>
			<td>地址</td>
			<td><input type="text" name="address" value="${customer.address}"/> </td>
			<td>创建时间</td>
			<td><fmt:formatDate value="${customer.createTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</table>
	<input type="submit" name="submit" value="保存"/>
</form>
</body>
</html>