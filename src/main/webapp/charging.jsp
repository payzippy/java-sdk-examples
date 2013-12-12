<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Payzippy Charging API</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input
	{
	height: 30px;
}
</style>

</head>
<body>
	<%@ include file="header.html" %>
	<div class="container-fluid">
	<div class="span10">
    <p class="text-info">This page corresponds to your final checkout page.</p>
    </div>
	<form class="form-horizontal" method="post" action="chargingSDK1.jsp">
		<fieldset>

			<!-- Form Name -->
			<legend>Payzippy Charging</legend>
			<div class="well well-small span10">
				<legend>CheckOut Details</legend>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">Buyer Email Address</label>
					<div class="controls">
						<input id="buyer_email_address" name="buyer_email_address"
							type="text" value="random123@arbit.com" class="input-xlarge"
							required="">

					</div>
				</div>
				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">Transaction Type</label>
					<div class="controls">
						<select id="transaction_type" name="transaction_type"
							class="input-xlarge">
							<option>SALE</option>
							<option>PRE_AUTH</option>
						</select>
					</div>
				</div>
				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">Currency</label>
					<div class="controls">
						<select id="currency" name="currency" class="input-xlarge">
							<option>INR</option>
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">Transaction Amount</label>
					<div class="controls">
						<input id="transaction_amount" name="transaction_amount"
							type="text" value="100" class="input-xlarge" required="">

					</div>
				</div>

				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">Payment Method</label>
					<div class="controls">
						<select id="payment_method" name="payment_method"
							class="input-xlarge">
							<option>PAYZIPPY</option>
							<option>CREDIT</option>
							<option>DEBIT</option>
							<option>EMI</option>
							<option>NET</option>
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">Merchant Transaction Id</label>
					<div class="controls">
						<input id="merchant_transaction_id" name="merchant_transaction_id"
							type="text" value="OT1234" class="input-xlarge" required="">

					</div>
				</div>
				<!-- Select Basic -->
				<div class="control-group">
					<label class="control-label">UI Integration Mode</label>
					<div class="controls">
						<select id="ui_mode" name="ui_mode" class="input-xlarge">
							<option value="REDIRECT">REDIRECT</option>
							<option value="IFRAME">IFRAME</option>
						</select>
					</div>
				</div>


			</div>

			<!-- Button -->
			<div class="control-group span12">
				<label class="control-label">Pay/Charge</label>
				<div class="controls">
					<input type="submit" id="button" class="btn btn-default"
						value="Submit">
				</div>
			</div>

		</fieldset>
	</form>
	<script src="/payment/js/jquery-1.7.2.min.js"></script>
	<script>
		$(document).ready(
				
				function() {
					$("#merchant_transaction_id").val(
							"OT" + Math.floor(Math.random() * 1100000000000));
				}
		);
	</script>

</body>
</html>
