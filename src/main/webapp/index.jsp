<html>
<head>
<title>Payzippy SDK</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="#">PayZippy SDK</a>

				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="charging.jsp">SDK Integration Examples</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h3>Structure of the SDK</h3>

		<pre>

    |- com.payzippy.sdk
        |- ChargingRequest.java
        |- ChargignRequestBuilder.java
        |- ChargingResponse.java
        |- constants.java
        |- QueryRequest.java
        |- QueryRequestBuilder.java
        |- RefundRequest.java
        |- RefundRequestBuilder.java
        |- RefundResponse.java
    |- com.payzippy.sdk.utils
    	|- HashUtils.java
    	|- RequestUtil.java
    	|- ValidityCheck.java
    	|- WebClient.java
    	
    </pre>

		<hr />

		<h3>Examples</h3>

		<p>
			To check out the sample SDK integrations, go to the <a
				href="charging.jsp">SDK Integration Examples</a> page.
		</p>
		<hr />
		<h3>API Usage</h3>
		<ul>
			<li><h4>ChargingRequest</h4></li>
			<p>
				To create a ChargingRequest first get the instance of
				ChargingRequestBuilder using
				<code> ChargingRequest.getBuilder() </code>
				then set the parameters using setters
				<code> builder.setMerchantId("merchant_id") </code>
				or if setter is not present for some particular parameter use putParams
				<code> builder.putParams(parameterKey,parameterValue) </code>
				. After setting the parameters use build method on
				ChargingRequestBuilder to get instance of ChargingRequest(build will
				create hash for you and validate your parameter). Once you have
				ChargingRequest you can call getUrl on it to get the request Url.<br>
				<b>Example :</b><br>
				<code>
					ChargingRequest chargingRequest =
					(ChargingRequest.getBuilder()).setMerchantId(MERCHANT_ID)<br>
					.setMerchantKeyId(MERCHANT_KEY_ID)<br>
					.setMerchantTransactionId(request.getParameter("merchant_transaction_id"))<br>
					.setBuyerEmailId(request.getParameter("buyer_email_address"))<br>
					.setTransactionAmount(request.getParameter("transaction_amount"))<br>
					.setPaymentMethod(request.getParameter("payment_method"))<br>
					.setCurrency(request.getParameter("currency"))<br>
					.setUiMode(request.getParameter("ui_mode")).setHashMethod("sha256")<br>
					.setTransactionType(request.getParameter("transaction_type"))<br>
					.putParams("callback_url",
					"http://localhost:8080/payzippy-api-test/chargingResp.jsp")<br>
					.build(SECRET_KEY);<br>
				 	String Url_to_hit=chargingRequest.getUrl(CHARGING_BASE_URL);
				</code>
			</p>
			<li><h4>ChargingResponse</h4></li>
			<p>
				To create ChargingResponse pass the response parameter map to
				constructor
				<code>ChargingResponse chargingResponse=new
					ChargingResponse(requestParams);</code>
			</p>
			<li><h4>QueryRequest</h4></li>
			<p>
				Building QueryRequest is very similar to ChargingRequest. Get the
				builder, set the parameters and then use build method to create
				QueryRequest instance. Once you have
				QueryRequest instance you can call getUrl on it to get the request Url, hit it or
				use our WebClient to do the same. See utils/WebClient.
				<br> <b>Example</b><br>
				<code>
					QueryRequest queryRequest =
					(QueryRequest.getBuilder()).setMerchantId(MERCHANT_ID)<br>
					.setMerchantKeyId(MERCHANT_KEY_ID).setHashMethod("SHA256")<br>
					.setMerchantTransactionId("merchantTransactionId_to_query").build(SECRET_KEY);<br>
					String Url_to_hit=queryRequest.getUrl(QUERY_BASE_URL);<br>
				</code>
			</p>
			<li><h4>QueryResponse</h4></li>
			<p>
				To create QueryResponse pass the response string (which will be
				json) to the constructor
				<code>QueryResponse queryResponse = new
					QueryResponse(json_response_string);</code>
			</p>
			<li><h4>RefundRequest</h4></li>
			<p>
				Similar to QueryRequest<br> <b>Example : <code>
						RefundRequest refundRequest =
						(RefundRequest.getBuilder()).setHashMethod("SHA256").setMerchantId(MERCHANT_ID)<br>
						.setMerchantKeyId(MERCHANT_KEY_ID).setPayzippySaleTransactionId(payzippy_sale_transaction_id)<br>
						.setRefundAmount(refund_amount).build(SECRET_KEY);<br>
						String Url_to_hit=refundRequest.getUrl(REFUND_BASE_URL)
					</code></b>
			</p>
			<li><h4>RefundResponse</h4></li>
			<p>Similar to QueryResponse.</p>
			<li><h4>Utils/WebClient</h4></li>
			<p>
				In order to hit url for query and refund case(as these are server to server calls) you can use WebClient
				from utils package.<br> <b>Example :</b><br>
				<code>
					QueryResponse queryResponse = new
					QueryResponse(WebClient.INSTANCE.doQuery(queryRequest.getRequestParams(),
					QUERY_BASE_URL));<br> RefundResponse refundResponse = new
					RefundResponse(WebClient.INSTANCE.doRefund(refundRequest.getRequestParams(),
					REFUND_BASE_URL));<br>
				</code>
			</p>
		</ul>
		<hr />
	</div>

</body>
</html>

