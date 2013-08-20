package pg;

import payzippyApi.RefundRequest;
import payzippyApi.RefundResponse;
import utils.WebClient;

public class RefundExample
{
	public static void main(String[] args) throws Exception
	{
		String secretKey="asdflkafuq347riuvgyrgfbwqbvq";
		RefundRequest refundRequest =
		        (RefundRequest.getBuilder()).setHashMethod("SHA256").setMerchantId("test_flipkart")
		                .setMerchantKeyId("payment").setPayzippySaleTransactionId("PZT13080912051379587")
		                .setRefundAmount("100").build(secretKey);

		RefundResponse refundResponse =new RefundResponse(WebClient.INSTANCE.doRefund(refundRequest.getRequestParams(),"http://localhost:8080/payment/api/refund/v1"));

		if (refundResponse.isValidResponse(secretKey))
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
				System.out.println("Transaction time : "+refundResponse.getTransactionTime());
			}
		}
		else
		{
			System.out.println("Invalid Response");
		}
		
	}
}
