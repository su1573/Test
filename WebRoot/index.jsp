<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function checkLogin(userName){
		var userId = userName.value;
		if(userId == ""){
			alert("用户名不能为空");
			userName.focus();
			return ;
		}
		//获取xmlHttpRequest对象
		createXmlHttpRequest();
		//拼写访问服务器的url
		var url = "servlet/CheckUserExistServlet?userId="+userId;
		//xmlHttpRequest对象设置回掉函数
		xmlHttpRequest.onreadystatechange=checkUserExistCallBack;
		//设置请求参数
		xmlHttpRequest.open("GET",url,true);
		//发送请求
		xmlHttpRequest.send(null);
	
	}
	
	function createXmlHttpRequest(){
		if(window.XMLHttpRequest){ //判断当前浏览器是不是支持xmlHttpRequest对象，支持返回true
			xmlHttpRequest = new XMLHttpRequest(); //浏览器支持xmlHttpRequest对象，并创建xmlHttpRequest对象
		}else{
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");//浏览器不支持xmlHttpRequest对象，并创建代理xmlHttpRequest对象
		}
	}
	
	function checkUserExistCallBack(){
	
		//请求完成并成功返回，等于4和200
		if(xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200){
			var result = xmlHttpRequest.responseText;
			
			if(result == "true"){
				document.getElementById("userInfo").innerHTML="该用户名已被占用";
			}else{
				document.getElementById("userInfo").innerHTML="该用户名可以使用";
			}
			
		}
	}
	

	function clearInfo(){
		document.getElementById("userInfo").innerHTML="";
	}
	
	</script>

  </head>
  
  <body>
    <form action="" method="post">
    	用户名：<input type="text" name="loginId" id="loginId" onblur="checkLogin(this)" onfocus="clearInfo()">
    	<span id="userInfo" style="color: red;font-size: 12px"></span><br>
    	密码：<input type="password" id="loginPwd"><br>
    	<input type="submit" value="注册">
    	<input type="reset" value="重置">
    </form>
  </body>
</html>
