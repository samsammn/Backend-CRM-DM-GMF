<!DOCTYPE html>
<html>
<head>
	<title>CRM GMF</title>
</head>
<body>
	<form action="/user/create" method="post">
		{{ csrf_field() }}
		Username <input type="text" name="username" required="required"> <br/>
		Password <input type="password" name="password" required="required"> <br/>
		Name <input type="text" name="name" required="required"> <br/>
        religion <input type="text" name="religion" required="required"> <br/>
        position <input type="text" name="position" required="required"> <br/>
        birthday <input type="date" name="birthday" required="required"> <br/>
        email <input type="text" name="email" required="required"> <br/>
        role <input type="text" name="role" required="required"> <br/>
        status <input type="text" name="status" required="required"> <br/>
		status <input type="text" name="company_name" required="required"> <br/>
        
		
		<input type="submit" value="Simpan Data">
	</form>
 
</body>
</html>