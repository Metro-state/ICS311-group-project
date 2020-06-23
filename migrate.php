<?php
/**
 * Quick and simple migration engine created for the ICS311 Project
 * to help aid team members in versioning their SQL scripts
 * and automatically applying new schema changes
 *
 * @author KONG
 * @version 1.0.0
 * 
 * Version 1.0.0 (INITIAL 1.0.0)
 * - Ability to run the init command to set up the migration schema
 * - Ability to rename and version each SQL file
 * - Ability to update the schema to the latest version
 */

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "omdb";
$dbmigration = "./sql";
$dbversion_scheme = "db_schema_versions";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$conn->set_charset('utf8mb4');

switch ($argv[1]) {
  /* set up the migration schema to keep track of the schema version
   * command: php migrate.php init
   */
  case "init":
    echo "Checking for Versioning Schema...\n";
    if ($conn->query("DESCRIBE $dbversion_scheme")) {
      echo "Migration Schema already exist. Procedure abort!";
    } else {
      echo "Creating Migration Schema...\n";
        $sql = "CREATE TABLE ".$dbversion_scheme." (version INT NOT NULL DEFAULT 0 PRIMARY KEY, file VARCHAR(255) NOT NULL)";
        if ($conn->query($sql) === TRUE) {
          $conn->query("INSERT INTO ".$dbversion_scheme." VALUES(0, 'init')");
          echo "Migration Schema created!\n";
        }
    }
    break;

    /* verion a .sql file that does not have a version
     * command: php migrate.php add X_<filename>.sql
     * 
     * sql files that are ready to be versioned must have the naming convention X_<filename>.sql
     * this command will rename the file <version>_<filename>.sql and append a INSERT statement into the sql file
     * to upgrade the version in the schema
     */
    case "add":
      $sqlfile = $argv[2];
      $fileformat = "~^X_.*\.(?i)(sql)$~";
      if (!preg_match($fileformat, $sqlfile)) {
        echo "Entered a wrong file format. The input file must have the following covention: X_<filename>.sql";
        break;
      }
      $filepath = $dbmigration."/".$sqlfile;
      if (!file_exists($filepath)) {
        echo "Unable to locate ".$filepath."\n";
        break;
      }
      echo "Fetching latest version of the schema...\n";
      $res = $conn->query("SELECT version FROM ".$dbversion_scheme." ORDER BY version DESC LIMIT 1;");
	  if ($res != null) {
		  $version = $res->fetch_row()[0] + 1;
		  $newfile = preg_replace('/X/', strval($version), $filepath, 1);
		  echo "Renaming the file to ".$newfile."...\n";
		  rename($filepath, $newfile);
		  echo "Appending the new schema version to ".$newfile."...\n";
		  $fp = fopen($newfile, 'a');
		  fwrite($fp, "\n\n");
		  fwrite($fp, "INSERT INTO ".$dbversion_scheme." VALUES(".$version.", '".$newfile."');");  
		  fclose($fp);
		  echo "Versioning complete!";
		  break;
	  } else {
		  echo 'Versioning table does not exist. Please run "migrate init" first.';
		  break;
	  }
	  

    /* upgrade the schema to the latest version
     * command: php migrate.php up 
     *
     * find the version of the current schema then find the next version in the sql file
     */
    case "up":
      $current = $conn->query("SELECT version FROM ".$dbversion_scheme." ORDER BY version DESC LIMIT 1;")->fetch_row()[0];
      echo "Current version of the schema: $current\n";
      $fileformat = "~^(.+)\/([^/\d+_]+)[0-9]+_.*\.(?i)(sql)$~";
      $it = new RecursiveDirectoryIterator($dbmigration, RecursiveDirectoryIterator::SKIP_DOTS);
      foreach(new RecursiveIteratorIterator($it) as $file) {
        if (!preg_match($fileformat, $file)) {
          continue;
        }
        $next = intval(substr($file,strpos($file,'\\')+1,strpos($file,'_')-strpos($file,'\\')-1)); // refector this
        if ($next > $current) {
          echo "Applying migration on ".$file."\n";
          $sql = file_get_contents($file);
          if (!$conn->multi_query($sql)) {
            echo "Exception occured while upgrading to verion ".$next."!\n";
            echo $conn->error;
          }
          echo "Updated schema version to ".$next."!\n";
        } elseif ($next == $current) {
          echo "Already up to date, nothing changed.\n";
        }
      }
      echo "Migration complete!";
      break;
}
$conn->close();

?>