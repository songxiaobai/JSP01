<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.net.URLEncoder"%>
<html>
	<head>
	
	</head>
	<body>
		<%
			Cookie c[] = request.getCookies();
			if(null == c || c.length < 2){
				%>
				<center>
			<form action="LoginCheck.jsp" method="post" onsubmit="return checkLogin(this)">
				<table>
					<caption>登录程序</caption>
					<tr>
						<td align="right">账号：</td>
						<td><input type="text" name = "stuNO"/></td>
					</tr>
					<tr>
						<td align="right">密码：</td>
						<td><input type="password" name = "password"/></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="submit" value="登录"/><input type="reset" value="重置"/></td>
					</tr>
				</table>
				
			</form>
		</center>
				<%
			}else{
				String stuNO = "";
				String password = "";
				for(int i = 0;i<c.length;i++){
					if(c[i].getName() .equals("stuNO")){
						stuNO = c[i].getValue();
						stuNO = URLEncoder.encode(stuNO,"utf-8");
						stuNO = new String(stuNO.getBytes(),"gbk");
						System.out.println(stuNO + "=======================");
						continue;
					}
					if(c[i].getName() .equals("password")){
						password = c[i].getValue();
						continue;
					}
					
				}
				%>
				<jsp:forward page="LoginCheck.jsp">
					<jsp:param value="<%=stuNO %>" name="stuNO"/>			
					<jsp:param value="<%=password %>" name="password"/>		
				</jsp:forward>
				<%
			}
		%>
	</body>
	<script type="text/javascript">
	/**
	 * 脚本验证是否输入账号及密码
	 * @param {Object} f
	 * @return {TypeName} 
	 */
		function checkLogin(f){
			var stuNO = f.stuNO.value;
			var password = f.password.value;
			if(stuNO== null || stuNO == ""){
				alert("请输入账号");
				f.stuNO.focus();//取得焦点
				return false;
			}
			if(password== null || password == ""){
				alert("请输入密码");
				f.password.focus();//取得焦点
				return false;
			}
			return true;
		}
	</script>
</html>
