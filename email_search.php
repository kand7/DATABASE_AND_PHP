<?php
$data1=$_POST["email"];
$data2=$_POST["category"];
$servername = "localhost";
$username = "viktor";
$password = "1234";
$dbname = "bd2_ask1";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "select packets.customer_id, customers.customer_name, customers.customer_surname, customers.customer_address, packets.destination, packets.category_name,
packets.price from packets inner join customers on packets.customer_id=customers.customer_id having customer_address='$data1' order by customer_id ASC";
$res = $conn->query($sql);

if ($res->num_rows > 0) {
  // output data of each row
  echo "<table border=1";
  echo "<tr>
							<th>CUSTOMER_ID</th>".
							"<th>CUSTOMER_NAME</th>".
							"<th>CUSTOMER_SURNAME</th>".
							"<th>CUSTOMER_ADDRESS</th>".
							"<th>CUSTOMER_DESTINATION</th>".
							"<th>CUSTOMER_CATEGORY_NAME</th>".
							"<th>CUSTOMER_PRICE</th>".
							"</tr>";
  while ($newArray = $res->fetch_assoc())
  {
					$id=$newArray['customer_id'];
					$name=$newArray['customer_name'];
					$surname=$newArray['customer_surname'];
					$address=$newArray['customer_address'];
					$destination=$newArray['destination'];
					$catname=$newArray['category_name'];
					$price=$newArray['price'];

    echo "<tr><td>".$id."</td><td>".$name."</td><td>".$surname."</td><td>".$address."</td><td>".$destination."</td><td>".$catname."</td><td>".$price."</td></tr>";

 // DEN EKTYPWNEI TO SUM.  AN EKANA GROUP BY ID MOY EMFANIZE SE MIA EGGRAFH MONO 1 DESTIONATION ( PARALO POY EIXE PARAPANW ) KAI EVGAZE TO SUM DIPLA
 // ITHELA NA FTIAKSW ENAN DEFTERO PINAKA ME ID KAI SUM ALLA DEN MOY EVGAINE
 //TO QUERY TOY THA HTAN ETSI select packets.customer_id,sum(packets.price) from packets inner join customers on packets.customer_id=customers.customer_id group by customer_id;
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
  
?>