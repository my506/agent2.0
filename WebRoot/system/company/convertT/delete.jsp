<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						ϵ������ɾ��
					</div>
				</td>
			</tr>
			<tr>   
			<td width="33%"><div align="center">���</div></td> 
			<td width="33%"><div align="center">����</div></td>
			<td width="33%"><div align="center">ɾ��</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_convertT"></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>   
			<td><div align="center">${x.index+1 }</div></td>
			<td><div align="center">${row.c_name }</div></td>
			<td  valign="middle" align="center"> 		
			<html:form  action="/company" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="convertT"/>
			<nested:nest property="company">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<nested:hidden property="c_name" value="${row.c_name }"></nested:hidden>
			<html:submit value="ɾ ��"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
