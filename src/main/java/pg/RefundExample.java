package pg;

import payzippyApi.RefundRequest;
import payzippyApi.RefundResponse;
import utils.WebClient;

public class RefundExample
{
	public static void main(String[] args) throws Exception
	{
		// change PayzippySaleTransactionId to the one you want to initiate refund
		RefundRequest refundRequest =
		        (RefundRequest.getBuilder()).setHashMethod("SHA256")
		                .setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
		                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID"))
		                .setPayzippySaleTransactionId("PZT13080912051379587").setRefundAmount("100")
		                .build(ConfigReader.config.getProperty("SECRET_KEY"));
		// Creating Response. Using WebClient to hit the Url
		RefundResponse refundResponse =
		        new RefundResponse(WebClient.INSTANCE.doRefund(refundRequest.getRequestParams(),
		                ConfigReader.config.getProperty("REFUND_URL")));
		// Using Response to do various checks
		if (refundResponse.isValidResponse(ConfigReader.config.getProperty("SECRET_KEY")))
		{
			System.out.println("Valid Response");
			if (refundResponse.isSuccess())
			{
				System.out.println("Refund Success");
			}
			else
			{
				System.out.println("Refund Unsuccessful");
				System.out.println(refundResponse.getRefundResponseMessasge());
				System.out.println("Transaction time : " + refundResponse.getTransactionTime());
			}
		}
		else
		{
			System.out.println("Invalid Response");
		}

	}
}
