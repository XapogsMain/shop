<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Admin Home</title>
		<style type="text/css">
			body{
				background-color: #3c85f2;
			}
			#orders{
				margin: 150px auto;
				width: 1024px;
				background-color: #FFF;
			}
			table{
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div id="orders">
			<h1 align="center">Orders</h1>
			<a href="?logout=true">Logout</a>
			<table border=1>
				<tr>
					<th>ID</th>
					<th>Date</th>
					<th>Order</th>
					<th>Price</th>
					<th>Completed</th>
				</tr>
				<?if($this->data != ""): for($i = 0; $i < count($this->data); $i++):?>
				<tr>
					<td><?=$this->data[$i]["id"];?></td>
					<td><?=$this->data[$i]["data"];?></td>
					<td><?=$this->data[$i]["goods"]?></td>
					<td><?=$this->data[$i]["sum"];?></td>
					<td><a href="?complete=<?=$this->data[$i]["id"];?>">OK</a></td>
				</tr>
				<?endfor;?>
			</table>
			<?else:?>No orders<?endif;?>
		</div>
	</body>
</html>