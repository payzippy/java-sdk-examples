package pg;

import java.util.Map;

import com.payzippy.sdk.QueryRequest;
import com.payzippy.sdk.QueryResponse;
import com.payzippy.sdk.utils.WebClient;

public class QueryExample
{
	public static void main(String[] args) throws Exception
	{

		// Change your MerchantTransactionId to the one you want to query.
		QueryRequest queryRequest =
		        (QueryRequest.getBuilder()).setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
		                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID")).setHashMethod("SHA256")
		                .setPayzippyTransactionId("enter_your_payzippy_transaction_id")
		                .build(ConfigReader.config.getProperty("SECRET_KEY"));
		// Creating Response. Using WebClinet to hit the Url.
		Map<String, Object> response =
		        WebClient.INSTANCE.doQuery(queryRequest.getRequestParams(),
		                ConfigReader.config.getProperty("QUERY_URL"));
		System.out.println(response);
		QueryResponse queryResponse = new QueryResponse(response);
		// Using Response to various checks.
		if (queryResponse.isValidResponse(ConfigReader.config.getProperty("SECRET_KEY")))
		{
			System.out.println("Valid Hash");
			for (QueryResponse.TransactionResponse transactionResponse : queryResponse.getTransactionResponse())
			{
				System.out.println(transactionResponse.getTransactionStatus());
				System.out.println(transactionResponse.getMerchantTransactionId());
				System.out.println("Transactiontransaction Amount : " + transactionResponse.getTransactionAmount());
			}
			System.out.println("Status Message : " + queryResponse.getStatusMessage());
			System.out.println("Error Message : " + queryResponse.getErrorMessage());
		}
		else
		{
			System.out
			        .println("Invalid Response (Reasons: Invalid hash, Validation failure, Payzippy technical Error)");
		}

	}
}
