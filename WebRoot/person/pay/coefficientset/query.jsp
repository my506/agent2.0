<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
		function set()
		{  
			var c_orgtypeid=document.getElementsByName("c_orgtypeid")[0].value 
			Organization.get_typeorg(c_orgtypeid, get);
			return false;
		}
		function get(datas)
		{					
			DWRUtil.removeAllOptions('c_orgid');					
			DWRUtil.addOptions('c_orgid', datas, 'value', 'label'); 			 
		} 		 
	</script>
</head> 
		<body onload="set()">	 		
		<form action="../../../toModule.do?prefix=/person&page=/pay/coefficientset/query2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬系数值查询
						</div>
					</td>
				</tr>	
				<tr>
				<td align="right" width="50%">机构类型</td>
				<td> 
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype order by c_order "></sql:query>
				<select name="c_orgtypeid" id="c_orgtypeid" onchange="set()">
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name } </option>
					</c:forEach>
				</select>
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">机构名称</td>
				<td> 
				<select name="c_orgid" id="c_orgid" > 
				</td>				
				</tr>		
				<tr>
				<td align="right" width="50%">
					<input type="submit" value=" 下一步 "/>
				</td>	<td align="center" width="50%"> 				
				</tr> 
				</table>
			</form>	 
			</body>			 
</html:html>
