<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="payzippyApi.*" %>

<%
	String msg = "<CENTER> <H1> RESPONSE PARAMETERS: </H1>";
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
	if(chargingResponse.isValidResponse("asdflkafuq347riuvgyrgfbwqbvq")){
		msg+="VALID RESPONSE<BR/>";
	}
	else{
		msg+="INVALID RESPONSE <BR />";
	}
	out.println(msg);
	out.close();
%>