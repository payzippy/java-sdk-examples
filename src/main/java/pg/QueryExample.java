package pg;

import payzippyApi.QueryRequest;
import payzippyApi.QueryResponse;
import utils.WebClient;

public class QueryExample
{
	public static void main(String[] args) throws Exception
	{

		// Change your MerchantTransactionId to the one you want to query.
		QueryRequest queryRequest =
		        (QueryRequest.getBuilder()).setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
		                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID")).setHashMethod("SHA256")
		                .setMerchantTransactionId("PZT13072512153264412")
		                .build(ConfigReader.config.getProperty("SECRET_KEY"));
		// Creating Response. Using WebClinet to hit the Url.
		QueryResponse queryResponse =
		        new QueryResponse(WebClient.INSTANCE.doQuery(queryRequest.getRequestParams(),
		                ConfigReader.config.getProperty("QUERY_URL")));

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
		}
		else
		{
			System.out.println("Invalid Hash");
		}

	}
}
