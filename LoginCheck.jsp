<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.net.URLEncoder"%>
<%!
public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
public static final String URL = "jdbc:oracle:thin:@603-4:1521:orcl";
public static final String USERNAME = "jjm";
public static final String PASSWORD = "jjm";
%>
<%
	request.setCharacterEncoding("utf-8");
	String stuNO = request.getParameter("stuNO");//接受参数
	String password = request.getParameter("password");//接受参数
	Connection conn = null;
	PreparedStatement pstate = null;
	ResultSet res = null;
	String userName = "";
	boolean flag = false;
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		String sql = "select user_name from usert_info  where user_name = ? and user_password = ?";
		pstate = conn.prepareStatement(sql);
		pstate.setString(1,stuNO);
		pstate.setString(2,password);
		res = pstate.executeQuery();
		while(res.next()){
			Cookie c[] = request.getCookies();
			if(null == c || c.length<2){
				stuNO = URLEncoder.encode(stuNO,"utf-8");
				Cookie stuNOCookie = new Cookie("stuNO",stuNO);
				Cookie passwordCookie = new Cookie("password",password);
				stuNOCookie.setMaxAge(60);
				passwordCookie.setMaxAge(60);
				response.addCookie(stuNOCookie);
				response.addCookie(passwordCookie);//添加Cookie
			}
			userName = res.getString(1);
			flag = true;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			res.close();
			pstate.close();
			conn.close();
		}catch(Exception e2){
			e2.printStackTrace();
		}
	}
%>
<html>
	<head>
	</head>
		<body>
		<% 
			if(flag){
				
				%>
				<h1>登录成功，欢迎您：<%=userName %></h1>
				<%
			}else{
				
				%>
				<h1>登录失败，请重新<a href = "Login.jsp">登录</a></h1>
				<%
			}
		%>
			<h1></h1>
		</body>
</html>

