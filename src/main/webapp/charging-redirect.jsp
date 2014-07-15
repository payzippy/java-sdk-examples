<%@page import="pg.ConfigReader"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.payzippy.sdk.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
	</head>
	<body onload="document.formACS.submit()">
		<%ChargingRequest chargingRequest=(ChargingRequest)request.getAttribute("charging_params"); %>
		<form name="formACS" action=<%out.println(ConfigReader.config.getProperty("CHARGING_URL")); %> method="post">
			<%for(String k:chargingRequest.getRequestParams().keySet()){ %>
				<input type="hidden" name="<%out.print(k); %>"
					value="<% out.print(chargingRequest.getRequestParams().get(k)); %>" />
			<%} %>
		</form>
	</body>
</html>