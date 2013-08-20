
<%@page import="utils.WebClient"%>
<%@page import="pg.ConfigInit"%>
<%@page import="payzippyApi.*" %>
<html>
<head>

</head>
<body>
<%
	try{
	ChargingRequest chargingRequest =
	(ChargingRequest.getBuilder()).setMerchantId(ConfigInit.MERCHANT_ID).setMerchantKeyId(ConfigInit.MERCHANT_KEY_ID)
	        .setMerchantTransactionId(request.getParameter("merchant_transaction_id"))
	        .setBuyerEmailId(request.getParameter("buyer_email_address"))
	        .setTransactionAmount(request.getParameter("transaction_amount"))
	        .setPaymentMethod(request.getParameter("payment_method"))
	        .setCurrency(request.getParameter("currency")).setUiMode(request.getParameter("ui_mode"))
	        .setHashMethod("sha256").setTransactionType(request.getParameter("transaction_type"))
	        .putParams("callback_url", "http://localhost:8080/payzippy-api-test/chargingResp.jsp")
	        .build(ConfigInit.SECRET_KEY);
	
		if (request.getParameter("ui_mode").equals("REDIRECT"))
		{
			request.setAttribute("charging_params", chargingRequest);
			request.getRequestDispatcher("charging-redirect.jsp").forward(request, response);
			
		}
		else if (request.getParameter("ui_mode").equals("IFRAME"))
		{
			request.setAttribute("charging_url", chargingRequest.getUrl("http://localhost:8080/payment/api/charging/v1"));
			request.getRequestDispatcher("/charge-iframe.jsp").forward(request, response);
		}
	}
	catch (Exception e)
	{
		response.getWriter().println(e.getMessage());
	}
%>
</body>
</html>