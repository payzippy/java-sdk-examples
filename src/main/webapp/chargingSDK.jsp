

<%@page import="pg.ConfigInit"%>
<%@page import="payzippyApi.*"%>
<%
	try
	{
		ChargingRequest chargingRequest =
		        (ChargingRequest.getBuilder()).setMerchantId(ConfigInit.MERCHANT_ID)
		                .setMerchantKeyId(ConfigInit.MERCHANT_KEY_ID)
		                .setMerchantTransactionId(request.getParameter("merchant_transaction_id"))
		                .setBuyerEmailId(request.getParameter("buyer_email_address"))
		                .setTransactionAmount(request.getParameter("transaction_amount"))
		                .setPaymentMethod(request.getParameter("payment_method"))
		                .setCurrency(request.getParameter("currency"))
		                .setUiMode(request.getParameter("ui_mode")).setHashMethod("sha256")
		                .setTransactionType(request.getParameter("transaction_type"))
		                .putParams("callback_url", "http://localhost:8080/payzippy-api-test/chargingResp.jsp")
		                .build(ConfigInit.SECRET_KEY);

		if (request.getParameter("ui_mode").equals("REDIRECT"))
		{
			response.sendRedirect(chargingRequest.getUrl(ConfigInit.CHARGING_URL));
		}
		else if (request.getParameter("ui_mode").equals("IFRAME"))
		{
			request.setAttribute("charging_url", chargingRequest.getUrl(ConfigInit.CHARGING_URL));
			request.getRequestDispatcher("/charge-iframe.jsp").forward(request, response);
		}
	}
	catch (Exception e)
	{
		response.getWriter().println(e.getMessage());
	}
%>