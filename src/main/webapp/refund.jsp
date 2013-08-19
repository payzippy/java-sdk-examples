
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
Payzippy Refund API
</title>
<link href="css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
</head>
<style>
select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input{
 height:30px;
}
</style>
<body>
<form class="form-horizontal" method="post" action="refund">
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Payzippy Refund</legend>

<!-- Text input-->
<div class="control-group">
  <label class="control-label">Merchant Transaction Id</label>
  <div class="controls">
    <input id="merchant_transaction_id" name="merchant_transaction_id" type="text" placeholder="Merchant Transaction Id" class="input-xlarge">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label">Payzippy Sale Transaction Id</label>
  <div class="controls">
    <input id="payzippy_sale_transaction_id" name="payzippy_sale_transaction_id" type="text" placeholder="Payzippy Transaction Id" class="input-xlarge">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label">Refund Amount</label>
  <div class="controls">
    <input id="refund_amount" name="refund_amount" value="100" type="text" placeholder="Refund Amount" class="input-xlarge" required="">
  </div>
</div>

<!-- Button -->
<div class="control-group">
  <label class="control-label">Issue Refund</label>
  <div class="controls">
    <input type="submit" id="button" class="btn btn-default" value="Submit">
  </div>
</div>

</fieldset>
</form>
</body>
</html>
