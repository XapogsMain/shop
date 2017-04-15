<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title><?=$this->title;?></title>
		<link rel="stylesheet" type="text/css" href="styles/style.css" />
		<script type="text/javascript" src="scripts/jquery.js"></script>
		<script type="text/javascript" src="scripts/js.cookie.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				for(var i = 1; i <= <?=count($this->goods);?>; i++)
					$("#desc_"+i).hide();
				var current = 0;
				var data = {};
				<?for($i = 0; $i < count($this->goods); $i++):?>
				data[<?=$this->goods[$i]['id'];?>] = {name: '<?=$this->goods[$i]["title"];?>', img: '<?=$this->goods[$i]["small_img"];?>', price: <?=$this->goods[$i]["price"];?>};
				<?endfor;?>
				var cart = Cookies.get("cart");
				if(cart != undefined){
					cart = JSON.parse(cart);
				}else{
					cart = {};
				}
				update(cart);
				$(".list").click(function(){
					change = $(this).data("id");
					if(change != current){
						$("#desc_"+current).hide();
						$("#desc_"+change).fadeIn();
						current = change;
					}
				});
				$(".addCart").click(function(){
					key = $(this).data("id").toString();
					if(key in cart) cart[key]++;
					else cart[key] = 1;
					updateCookie(cart);
				});
				$(".removeGood").click(function(){
					key = $(this).data("key");
					if(cart[key] > 1) cart[key]--;
					else delete cart[key];
					updateCookie();
				});
				function updateCookie(){
					update(cart);
					Cookies.set("cart", JSON.stringify(cart));
				}
				function update(goods){
					if(Object.keys(goods).length > 0){
						$("#isGood").show();
						$("#noGoods").hide();
						var rows = "";
						var sum = 0;
						$("#cartgoods table").html('<tr><th>Preview</th><th>Name</th><th>Price</th><th>Count</th><th>Remove</th></tr><tr><th colspan="5">Total: <span></span>$</th></tr>');
						for(var key in goods){
							obj = data[key];
							rows += "<tr>";
							rows += "<td><img src='images/"+obj.img+"' /></td>";
							rows += "<td>"+obj.name+"</td>";
							rows += "<td>"+obj.price+"</td>";
							rows += "<td>"+goods[key]+"</td>";
							rows += "<td><button class='removeGood' data-key='"+key+"'>X</button></td>";
							rows += "</tr>";
							sum += obj.price*goods[key];
						}
						$("#cartgoods tr:last th span").html(sum);
						$(rows).insertAfter($("#cartgoods tr:first"));
					}
					else{
						$("#isGood").hide();
						$("#noGoods").show();
					}	
				}
			});
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div id="wrap">
				<header>
					<span>Logo</span>
				</header>
				<div id="main">
					<div id="about-us">
						<h1>About US</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nisi ante. Suspendisse at est est. Donec tincidunt dolor enim, in placerat ipsum elementum ac. Proin et tortor feugiat, commodo sem vitae, blandit leo. Nunc at mi nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed faucibus vulputate tortor vel efficitur. Sed eleifend neque non sem dignissim consectetur. Nam eu bibendum sem. Aenean vulputate enim et erat efficitur scelerisque. Curabitur sed elementum lacus.</p>
						<p>Donec venenatis venenatis nunc sit amet porta. Morbi ut mi placerat, facilisis mi nec, molestie ipsum. Nullam nec erat at nibh vulputate accumsan eu et purus. Curabitur et justo lobortis, dignissim arcu quis, malesuada ligula. Sed ac dui massa. Morbi quam diam, faucibus id mauris vitae, suscipit consectetur arcu. Curabitur sodales enim quam, vel faucibus ligula pretium vel. Aliquam eget nisi est. Maecenas vel libero sed nisl pretium elementum.</p>
					</div>
					<div id="goods">
						<div id="good_list">
							<?for($i = 0; $i < count($this->goods); $i++):?>
							<div class="list" data-id="<?=$i;?>"><img src="images/<?=$this->goods[$i]['small_img'];?>" /></div>
							<?endfor;?>
						</div>
						<div id="good_desc">
							<?for($i = 0; $i < count($this->goods); $i++):?>
							<div id="desc_<?=$i;?>">
								<h1><?=$this->goods[$i]['title'];?></h1>
								<table>
									<tr>
										<td colspan="2">
											<?=$this->goods[$i]['main_text'];?>
										</td>
									</tr>
									<tr>
										<td>
											<img src="images/<?=$this->goods[$i]['big_img'];?>" />
										</td>
										<td>
											<?=$this->goods[$i]['left_text'];?>
										</td>
									</tr>
									<tr>
										<td><button class="addCart" data-id="<?=$this->goods[$i]['id'];?>">Add to Cart</button></td>
										<td><span class="price">Price: €<?=$this->goods[$i]['price'];?></span></td>
									</tr>
								</table>
							</div>
							<?endfor;?>
						</div>
					</div>
					<div id="cart">
						<h1>Cart</h1>
						<div id="isGood">
							<div id="cartgoods">
								<table>
									
								</table>
							</div>
							<form method="POST" action="buy">
								<table>
									<tr>
										<th>Name:</th><td><input type="text" name="name" placeholder="Enter your name..." /></td>
									</tr>
									<tr>
										<th>SurName:</th><td><input type="text" name="surname" placeholder="Enter your surname..." /></td>
									</tr>
									<tr>
										<td colspan=2><button type="submit">BUY</button></td>
									</tr>
								</table>
							</form>
						</div>
						<div id="noGoods">
							<h3>No goods selected!</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<span>&copy;WebShop@hz che suvatj v footer :D</span>
		</footer>
	</body>
</html>