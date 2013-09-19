
<%@page import="com.payzippy.sdk.utils.WebClient"%>
<%@ page import="pg.ConfigReader" %>
<%@page import="com.payzippy.sdk.*" %>
<html>
<head>

</head>
<body>
	<%
		try
		{
			ChargingRequest chargingRequest =
			        (ChargingRequest.getBuilder()).setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
			                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID"))
			                .setMerchantTransactionId(request.getParameter("merchant_transaction_id"))
			                .setBuyerEmailId(request.getParameter("buyer_email_address"))
			                .setTransactionAmount(request.getParameter("transaction_amount"))
			                .setPaymentMethod(request.getParameter("payment_method"))
			                .setCurrency(request.getParameter("currency"))
			                .setUiMode(request.getParameter("ui_mode")).setHashMethod("sha256")
			                .setTransactionType(request.getParameter("transaction_type"))
			                .putParams("callback_url", ConfigReader.config.getProperty("CALLBACK_URL"))
			                .build(ConfigReader.config.getProperty("SECRET_KEY"));

			if (request.getParameter("ui_mode").equals("REDIRECT"))
			{
				request.setAttribute("charging_params", chargingRequest);
				request.getRequestDispatcher("charging-redirect.jsp").forward(request, response);

			}
			else if (request.getParameter("ui_mode").equals("IFRAME"))
			{
				request.setAttribute("charging_url", chargingRequest.getUrl(ConfigReader.config.getProperty("CHARGING_URL")));
				request.getRequestDispatcher("charge-iframe.jsp").forward(request, response);
			}
		
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>