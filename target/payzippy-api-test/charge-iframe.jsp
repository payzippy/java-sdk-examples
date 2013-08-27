<!doctype html>
<html>
<head>
<title>Charging Iframe Example</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input
	{
	height: 30px;
}
</style>
</head>
<body>
	<center>
	<h2>Integration With IFrame</h2>
	<iframe
		src="<% out.println(request.getAttribute("charging_url"));%>"
		frameborder="1" height="450" width="50%" style=""></iframe>
	</center>
	
	
</body>
</html>