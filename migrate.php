<?php
/**
 * Quick and simple migration engine created for the ICS311 Project
 * to help aid team members in versioning their SQL scripts
 * and automatically applying new schema changes
 *
 * @author KONG
 */
 
/* configurations - edit these to suit your needs */
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "omdb";

$dbversion_scheme = "db_schema_versions";

/* connect to DB */
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

switch ($argv[1]) {
  /* set up the migration schema to keep track of the schema version
   * command: php migrate.php init
   */
  case "init":
    echo "Checking for Versioning Schema...\n";

    /* check if table already exist */
    $sql = "SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = '.$dbversion_scheme.'";
    if ($conn->query($sql) === TRUE) {
      echo "Migration Schema already exist. Procedure abort!";
    } else {
      echo "Creating Migration Schema...\n";
        /* the versioning table */
        $sql = "CREATE TABLE db_schema_versions (version INT NOT NULL PRIMARY KEY)";
        if ($conn->query($sql) === TRUE) {
          echo "Migration Schema created!\n";
        }
    }
    break;
}

?>