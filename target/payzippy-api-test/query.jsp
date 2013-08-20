<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Payzippy Query API</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input
	{
	height: 30px;
}
</style>
</head>
<body>
	<form class="form-horizontal" method="post" action="query">
		<fieldset>

			<!-- Form Name -->
			<legend>Payzippy Query</legend>

			<!-- Text input-->
			<div class="control-group">
				<label class="control-label">Payzippy Transaction Id</label>
				<div class="controls">
					<input id="payzippy_transaction_id" name="payzippy_transaction_id"
						type="text" placeholder="" class="input-xlarge">
				</div>
			</div>

			<!-- Text input-->
			<div class="control-group">
				<label class="control-label">Merchant Transaction Id</label>
				<div class="controls">
					<input id="merchant_transaction_id" name="merchant_transaction_id"
						type="text" placeholder="Merchant Transaction Id"
						class="input-xlarge">
				</div>
			</div>

			<!-- Select Basic -->
			<div class="control-group">
				<label class="control-label">Transaction Type</label>
				<div class="controls">
					<select id="transaction_type" name="transaction_type"
						class="input-xlarge">
						<option>SALE</option>
						<option>REFUND</option>
					</select>
				</div>
			</div>
			<!-- Button -->
			<div class="control-group">
				<label class="control-label">Fetch Details</label>
				<div class="controls">
					<input type="submit" id="button" class="btn btn-default" value="Submit">
				</div>
			</div>

		</fieldset>
	</form>
	
</body>
</html>
