package pg;

import payzippyApi.QueryRequest;
import payzippyApi.QueryResponse;
import utils.WebClient;

public class QueryExample
{
	public static void main(String[] args) throws Exception
	{
		String secretKey="asdflkafuq347riuvgyrgfbwqbvq";
		QueryRequest queryRequest =
		        (QueryRequest.getBuilder()).setMerchantId("test_flipkart").setMerchantKeyId("payment")
		                .setHashMethod("SHA256").setMerchantTransactionId("PZT13072512153264412")
		                .build(secretKey);

		QueryResponse queryResponse =
		        new QueryResponse(WebClient.INSTANCE.doQuery(queryRequest.getRequestParams(),
		                ConfigInit.QUERY_URL));

		System.out.println(queryResponse.getResponseParams());
		if (queryResponse.isValidResponse(secretKey))
		{
			System.out.println("Valid Hash");
			for (QueryResponse.TransactionResponse transactionResponse : queryResponse.getTransactionResponse())
			{
				System.out.println(transactionResponse.getTransactionStatus());
				System.out.println(transactionResponse.getMerchantTransactionId());
				System.out.println("Transactiontransaction Amount : "+transactionResponse.getTransactionAmount());
				
			}
		}
		else
		{
			System.out.println("Invalid Hash");
		}
			
		
		

	}
}
