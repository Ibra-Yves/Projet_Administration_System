
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

$nom = $_POST['nom'];
$age = $_POST['age'];

$sql = "INSERT INTO personne (nom, age)
VALUES ('$nom', '$age')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}



$conn->close();

header('Location: ./index.php');
die();
?>
