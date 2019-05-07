
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
<form action="./send_data.php" method="post">
  Nouvel utilisateur
 <p>Votre nom : <input type="text" name="nom" /></p>
 <p>Votre âge : <input type="text" name="age" /></p>
 <p><input type="submit" value="OK"></p>
</form>

<?php
$servername = "51.77.203.64";
$username = "root";
$password = "*******";
$dbname = "user";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM personne";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Id: " . $row["user_id"]. " - Name: " . $row["nom"]. " - Age: " . $row["age"] . "<br>";
    }
    echo "<br><br><br>";
} else {
    echo "Aucun users    afficher";
}
$conn->close();
?>

</body>
</html>
