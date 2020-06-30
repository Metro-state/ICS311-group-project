<?php
	$nav_selected = "MOVIES";
	$left_buttons = "YES";
	$left_selected = "WARNINGS";

	include("./nav.php");
	global $db;
?>

<div class="right-content">
	<div class="container">

	<table>
		</tbody>
			<h3 style = "color: #01B0F1;">Movies --> Meta Data </h3>
				<?php
					if (isset($_GET['id'])) {
						$id = $_GET['id'];
					}
					$sql = "SELECT * from movies";
					$result = $db->query($sql);

					if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						echo '<tr>
								<td>'.$row["name_native"].'</td>
								<td>'.$row["name_english"].' </span> </td>
								<td>'.$row["year_made"].'</td>
							</tr>';
					}
				} else {
					echo "0 results";
				}

				 $result->close();
				?>
			</tbody>
		</table>
	</div>
</div>

<?php include("./footer.php"); ?>
