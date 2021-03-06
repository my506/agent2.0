<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type="text/javascript">
	function js_all()
	{
	   		var select_all = document.getElementsByName("select_all")[0]; 
		 	var count =document.getElementsByName("file.c_postid").length; 		
		    for (var i=0;i<count;i++)
		    {
		    	    document.getElementsByName("file.c_postid")[i].checked=select_all.checked  
		    } 
	}
	</script>
</head>		
	<body> 
		<html:form  action="/file" onsubmit="return check_form(this)" enctype="multipart/form-data" >
		<html:hidden property="jobname" value="filesigned_add"/>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						文件添加
					</div>
				</td>
			</tr> 					
			<nested:nest property="filesigned">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>  
			<tr>
				<td width="25%"><div align="center">发文部门</div></td>
				<td width="25%" >
				<div align="center">
					<nested:text property="c_dname" value="" styleId="req" title="发文部门不能为空 "></nested:text>
				</div>
				</td>	
				<td width="25%"><div align="center">发文字号</div></td>
				<td width="25%" >
				<div align="center">
					<nested:text property="c_dcode" value="" styleId="req" title="发文字号不能为空 "></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="25%"><div align="center">拟稿人</div></td>
				<td width="25%" >
				<div align="center">
					<nested:text property="c_write" value="" styleId="req" title="拟稿人不能为空 "></nested:text>
				</div>
				</td>	
				<td width="25%"><div align="center">校对人</div></td>
				<td width="25%" >
				<div align="center">
					<nested:text property="c_check" value="" styleId="req" title="校对人不能为空 "></nested:text>
				</div>
				</td>
			</tr> 			 
			</nested:nest>				
			<nested:nest property="file">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>  			
			<sql:query var="q2" dataSource="${db_mssql }" sql="select a.c_no,a.c_name,b.c_name dept ,c.c_name org,c.c_no orgid from t_post a ,t_dept b ,t_organization c 
			where a.c_deptid=b.c_no and a.c_orgid=c.c_no order by c.c_name,b.c_name"></sql:query>
			<tr>
				<td width="25%"><div align="center">阅读权限设置 </div></td>
				<td width="25%" >
				<div align="center">
					 <input type="checkbox" name="select_all" onclick="js_all()" >全选					 
				</div>
				</td>	
				<td width="25%"> </td>
				<td width="25%" >
				<div align="center">					 
				</div>
				</td>
			</tr> 
			<tr>
			<c:forEach items="${q2.rows }" var="row" varStatus="x" >			
				<td width="50%" colspan="2"><div align="center"> 
					<nested:checkbox property="c_postid" styleId="c_postid" value="${row.c_no }">
					<sql:query var="temp1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.orgid }"></sql:query> 
					<sql:query var="temp2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${temp1.rows[0].c_orgtypeid } "></sql:query>
					[
					<c:choose>
					<c:when test="${temp2.rows[0].c_order eq 3 }">
					${row.org }
					</c:when>
					<c:when test="${temp2.rows[0].c_order eq 4 }">
					<sql:query var="temp31" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp1.rows[0].c_parent }"></sql:query>
					<sql:query var="temp32" dataSource="${db_mssql }" sql="select * from t_dept where c_no=${temp1.rows[0].c_deptid }"></sql:query>
					${temp31.rows[0].c_name } 
					${temp32.rows[0].c_name } 
					
					${row.org }					
					</c:when>
					<c:when test="${temp2.rows[0].c_order eq 5 }">					
					<sql:query var="temp41" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp1.rows[0].c_parent }"></sql:query> 
					
					<sql:query var="temp42" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp41.rows[0].c_parent }"></sql:query>
					<sql:query var="temp43" dataSource="${db_mssql }" sql="select * from t_dept where c_no=${temp41.rows[0].c_deptid }"></sql:query>
					${temp42.rows[0].c_name }  
					${temp43.rows[0].c_name } 
					
					${temp41.rows[0].c_name } 
					${row.org }						
					</c:when>
					</c:choose>
					]->${row.dept }->${row.c_name } 
					</nested:checkbox> </div></td>
				<c:if test="${ (x.index+1) mod 2 ==0 }"> 
				  </tr><tr>
				</c:if>
			</c:forEach>
			</tr>						  
			<nested:hidden property="c_sys" value="1"></nested:hidden> 
			<nested:hidden property="c_flag" value="1"></nested:hidden> 
			<tr>
				<td width="25%"><div align="center">上挂目录</div></td>
				<td width="25%" >
				<div align="center">
					<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_catalog where c_sys = 1 "></sql:query>
					<nested:select property="c_catalogid">
					<c:forEach items="${q3.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>	
				<td width="25%"><div align="center">上挂文件</div></td>
				<td width="25%" >
				<div align="left">
					<nested:file property="file" styleId="req" title="上挂文件不能为空"></nested:file>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="25%"><div align="center">文件名称</div></td>
				<td width="25%" >
				<div align="center">
					<nested:text property="c_name" value="" styleId="req" title="文件名称必须填写" size="40"></nested:text>
				</div>
				</td>	
				</nested:nest>	
				<nested:nest property="sprocess">
				<td width="25%"><div align="center" style="color: red">上级签字人姓名</div></td>
				<td width="25%" >
				<div align="center">
					<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
					<nested:hidden property="c_sys" value="1"></nested:hidden>   
					<nested:hidden property="c_send" value="${sessionScope.c_jobnumber }" ></nested:hidden>
					<nested:text property="c_receive" value="" styleId="req" title="签批人姓名不能为空" ></nested:text>
				</div>
				</td>
			 
			<tr>
				<td width="25%"><div align="center">备注</div></td>
				<td width="25%" colspan="3" >
				<div align="center">
					<nested:textarea property="c_note" value=""  cols="150" rows="4"></nested:textarea>
				</div>
				</td>					 
			</tr> 
			</nested:nest>		
			<tr>
				<td width="50%" colspan="2" align="right"><html:submit value="确 定"/></td>
				<td width="50%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
