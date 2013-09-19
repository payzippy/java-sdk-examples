package pg;

import java.util.Map;

import com.payzippy.sdk.RefundRequest;
import com.payzippy.sdk.RefundResponse;
import com.payzippy.sdk.utils.WebClient;

public class RefundExample
{
	public static void main(String[] args) throws Exception
	{
		// change PayzippySaleTransactionId to the one you want to initiate refund
		RefundRequest refundRequest =
		        (RefundRequest.getBuilder()).setHashMethod("SHA256")
		                .setMerchantId(ConfigReader.config.getProperty("MERCHANT_ID"))
		                .setMerchantKeyId(ConfigReader.config.getProperty("MERCHANT_KEY_ID"))
		                .setPayzippySaleTransactionId("enter_your_payzippy_transaction_id").setRefundAmount("100")
		                .build(ConfigReader.config.getProperty("SECRET_KEY"));
		// Creating Response. Using WebClient to hit the Url
		Map<String, Object> response =
		        WebClient.INSTANCE.doRefund(refundRequest.getRequestParams(),
		                ConfigReader.config.getProperty("REFUND_URL"));
		System.out.println(response);
		RefundResponse refundResponse = new RefundResponse(response);
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
				System.out.println("Refund Response Message : " + refundResponse.getRefundResponseMessasge());
				System.out.println("Transaction time : " + refundResponse.getTransactionTime());
			}
		}
		else
		{
			System.out
			        .println("Invalid Response (Reasons: Invalid hash, Validation failure, Payzippy technical Error)");
		}

	}
}
