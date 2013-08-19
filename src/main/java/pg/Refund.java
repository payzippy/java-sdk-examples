package pg;

import payzippyApi.*;
import utils.WebClient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.io.IOException;

public class Refund extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		try
		{
			// Replace your MerchantID,MerchantKeyID,SecretKey(in build argument)
			RefundRequest refundRequest =
			        (RefundRequest.getBuilder()).setHashMethod("SHA256").setMerchantId("test_flipkart")
			                .setMerchantKeyId("payment")
			                .setPayzippySaleTransactionId(request.getParameter("payzippy_sale_transaction_id").trim())
			                .setMerchantTransactionId(request.getParameter("merchant_transaction_id").trim())
			                .setRefundAmount(request.getParameter("refund_amount"))
			                .build("asdflkafuq347riuvgyrgfbwqbvq");
			RefundResponse refundResponse =
			        new RefundResponse(WebClient.INSTANCE.doRefund(refundRequest.getRequestParams(),
			                "http://localhost:8080/payment/api/refund/v1"));
			out.println(refundResponse.getResponseParams().toString());
			out.println("\n");
			if (refundResponse.isValidResponse("asdflkafuq347riuvgyrgfbwqbvq"))
			{
				out.println("Valid Response");
			}
			else
			{
				out.println("Invalid Response");
			}
			if (refundResponse.isSuccess())
			{
				out.println("Refund Success");
			}
			else
			{
				out.println("Refund Unsuccessful");
			}
		}
		catch (Exception e)
		{
			out.println(e.getMessage());
		}
		
	}

}
