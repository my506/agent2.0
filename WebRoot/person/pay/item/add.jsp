<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/pay" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pproject"/>
		<nested:nest property="pay">	
		<nested:hidden property="c_no" value="1"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬项目添加
					</div>
				</td>
			</tr> 	
			<tr>
				<td width="48%"><div align="right">类型名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_type">
					<html:option value="1">基本项目</html:option>
					<html:option value="2">社保项目</html:option>
					</nested:select>
				</div>
				</td>
			</tr> 	
			<tr>
				<td width="48%"><div align="right">项目名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="名称不能为空 "></nested:text>
				</div>
				</td>
			</tr> 
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="确 定"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 	 
</html:html>
