<?php
  $data=$_POST["packet_id"];
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

$sql = "select packets.packet_id, customers.customer_name, customers.customer_surname, customers.customer_phone, customers.customer_address 
from packets inner join customers on packets.packet_id=customers.packet_id where packets.packet_id=$data";
$res = $conn->query($sql);

if ($res->num_rows > 0) {
  // output data of each row
  echo "<table border=1";
  echo "<tr>
							<th>PACKET_ID</th>".
							"<th>CUSTOMER_NAME</th>".
							"<th>CUSTOMER_SURNAME</th>".
							"<th>CUSTOMER_PHONE</th>".
							"<th>CUSTOMER_ADDRESS</th>".
							"</tr>";
  while ($newArray = $res->fetch_assoc())
  {
          $id=$newArray['packet_id'];
					$name=$newArray['customer_name'];
					$surname=$newArray['customer_surname'];
					$phone=$newArray['customer_phone'];
					$address=$newArray['customer_address'];

    echo "<tr><td>".$id."</td><td>".$name."</td><td>".$surname."</td><td>".$phone."</td><td>".$address."</td></tr> ";
    
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
  
?>
