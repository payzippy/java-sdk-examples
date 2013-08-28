

<%@page import="pg.ConfigReader"%>
<%@page import="payzippyApi.*"%>
<%
	try
	{
		ChargingRequestBuilder chargingBuilder=ChargingRequest.getBuilder();
		for(Object k : request.getParameterMap().keySet()){
			chargingBuilder.putParams((String)k,request.getParameter((String)k));
		}
		ChargingRequest chargingRequest =
		        chargingBuilder.setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
		                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID"))
		                .putParams("callback_url", ConfigReader.config.getProperty("CALLBACK_URL"))
		                .build(ConfigReader.config.getProperty("SECRET_KEY"));
		
		if (request.getParameter("ui_mode").equals("REDIRECT"))
		{
			response.sendRedirect(chargingRequest.getUrl(ConfigReader.config.getProperty("CHARGING_URL")));
		}
		else if (request.getParameter("ui_mode").equals("IFRAME"))
		{
			request.setAttribute("charging_url", chargingRequest.getUrl(ConfigReader.config.getProperty("CHARGING_URL")));
			request.getRequestDispatcher("/charge-iframe.jsp").forward(request, response);
		}
	}
	catch (Exception e)
	{
		response.getWriter().println(e.getMessage());
	}
%>