package pg;

import payzippyApi.*;
import utils.WebClient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.io.IOException;

public class Query extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		try
		{
			// Replace your MerchantID,MerchantKeyID,SecretKey(in build argument)
			QueryRequest queryRequest =
			        (QueryRequest.getBuilder()).setMerchantId("test_flipkart").setMerchantKeyId("payment")
			                .setHashMethod("SHA256")
			                .setMerchantTransactionId(request.getParameter("merchant_transaction_id"))
			                .setPayzippyTransactionId(request.getParameter("payzippy_transaction_id"))
			                .putParams("transaction_type", request.getParameter("transaction_type"))
			                .build("asdflkafuq347riuvgyrgfbwqbvq");

			QueryResponse queryResponse =
			        new QueryResponse(WebClient.INSTANCE.doQuery(queryRequest.getRequestParams(),
			                "http://localhost:8080/payment/api/query/v1"));

			out.println(queryResponse.getResponseParams());
			out.println("\n");
			if (queryResponse.isValidResponse("asdflkafuq347riuvgyrgfbwqbvq"))
				out.println("Valid Hash");
			else
				out.println("Invalid Hash");

		}
		catch (Exception e)
		{
			out.println(e.getMessage());
		}

	}

}
