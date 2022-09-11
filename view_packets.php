<html>
    <head>

        <title> My portal</title>


    </head>
    <body>
	<?php
		$mysqli= mysqli_connect("localhost","viktor","1234","bd2_ask1");
		if(mysqli_connect_errno())
			{
			printf("Connect failed: %s \n",mysqli_connect_errno());
			exit();
			}
		else {
			$sql= "select * from packets";
			$res= mysqli_query($mysqli,$sql);
			if ($res == TRUE) {
				echo "<table border=1";
				echo "<tr>
							<th>PACKET_ID</th>".
							"<th>DESTINATION</th>".
							"<th>START</th>".
							"<th>END</th>".
							"<th>TRANSPORT</th>".
							"<th>PRICE</th>".
							"<th>CUSTOMER_ID</th>".
							"</tr>";
				while ($newArray=mysqli_fetch_array($res,MYSQLI_BOTH))
				{
					$id=$newArray['packet_id'];
					$dest=$newArray['destination'];
					$start=$newArray['start'];
					$end=$newArray['end'];
					$transport=$newArray['transport'];
					$price=$newArray['price'];
					$customer_id=$newArray['customer_id'];
					
					echo "<tr><td>".$id."</td><td>".$dest."</td><td>".$start."</td><td>".$end."</td><td>".$transport."</td><td>".$price."</td><td>".$customer_id."</td></tr> ";
				}
				echo "</table>";
			}

				
			else {
				echo "ERROR";
			}
		
		mysqli_close($mysqli);
		}
		?>			
       
    </body>
</html>





</html>