package pg;

import payzippyApi.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;


public class Charging extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		try
		{
			// Replace your MerchantID,MerchantKeyID,SecretKey(in build argument) ,callbackUrl(if you have not
			// provided default callbackUrl to payzippy) 
			ChargingRequest chargingRequest =
			        (ChargingRequest.getBuilder()).setMerchantId("test_flipkart").setMerchantKeyId("payment")
			                .setMerchantTransactionId(request.getParameter("merchant_transaction_id"))
			                .setBuyerEmailId(request.getParameter("buyer_email_address"))
			                .setTransactionAmount(request.getParameter("transaction_amount"))
			                .setPaymentMethod(request.getParameter("payment_method"))
			                .setCurrency(request.getParameter("currency")).setUiMode(request.getParameter("ui_mode"))
			                .setHashMethod("sha256")
			                .setTransactionType(request.getParameter("transaction_type"))
			                .putParams("callback_url", "http://localhost:8080/payzippy-api-test/chargingResp.jsp")
			                .build("asdflkafuq347riuvgyrgfbwqbvq");
			response.sendRedirect(chargingRequest.getUrl("http://localhost:8080/payment/api/charging/v1"));
		}
		catch (Exception e)
		{
			response.getWriter().println(e.getMessage());
		}

	}

}
