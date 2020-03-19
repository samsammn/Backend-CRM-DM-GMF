<!DOCTYPE html>
<html>
<head>
	<title>CRM GMF</title>
</head>
<body>
	<form action="/auth" method="post">
		{{ csrf_field() }}
		Username <input type="text" name="username" required="required"> <br/>
		Password <input type="password" name="password" required="required"> <br/>
		<input type="submit" value="Login">
	</form>
 
</body>
</html>