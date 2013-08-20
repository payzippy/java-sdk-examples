<%@page import="pg.ConfigInit"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="payzippyApi.*" %>
<html>
<head>
<title>CallBack Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input
	{
	height: 30px;
}
</style>

</head>
<body>
<%
	out.println("<CENTER> <h1> RESPONSE PARAMETERS: </h1>");
	String msg = "";
	Enumeration keys = request.getParameterNames();
	Map<String,Object> requestParams=new HashMap<String,Object>();
	
	while(keys.hasMoreElements()){
		String k=(String)keys.nextElement();
		String v=request.getParameter(k);
		requestParams.put(k,v);
		msg+=k+" = "+v+"<BR />";
	}
	if (requestParams.size() == 0)
		return;
	ChargingResponse chargingResponse=new ChargingResponse(requestParams);
	if(chargingResponse.isValidResponse(ConfigInit.SECRET_KEY)){
		out.println("<p class='text-success' ><b>VALID RESPONSE<BR/></p>");
		if(chargingResponse.isSuccess()){
			out.println("<p class='text-success' >");
		}
		else{
			out.println("<p class='text-error' >");
		}
		out.println(chargingResponse.getTransactionStatus()+"<BR/>");
		out.println(chargingResponse.getTransactionResponseMessage()+"<BR/>");
		out.println(chargingResponse.getTransactionResponseCode()+"<BR/></b></p>");
		
	}
	else{
		out.println("<p class='text-error' >INVALID RESPONSE<BR/>");
	}
	out.println(msg);
	out.close();
%>
</body>
</html>