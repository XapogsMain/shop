<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Auth</title>
		<link href="<?=$this->path;?>styles/style.css" type="text/css" rel="stylesheet" />
	</head>
	<body id="auth-page">
		<div id="auth_form">
			<form action="<?=$this->path;?>admin" method="POST">
				<table>
					<tr>
						<td colspan="2"><h2>Auth form</h2></td>
					</tr>
					<tr>
						<td>Login:</td><td><input type="text" name="login" /></td>
					</tr>
					<tr>
						<td>Pass:</td><td><input type="password" name="pass" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="send" value="Enter" /></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>