<div id="menu-left">

<a href="list_movies.php">
  	<div <?php if($left_selected == "RELEASES")
  	{ echo 'class="menu-left-current-page"'; } ?>>
  	<img src="./images/cinema_2.png">
  	<br/>Releases<br/></div>
  </a>

  <a href="movies_warnings.php">
  	<div <?php if($left_selected == "WARNINGS")
  	{ echo 'class="menu-left-current-page"'; } ?>>
  	<img src="./images/warnings.png">
  	<br/>Warnings<br/></div>
  </a>

  <a href = "movies_errors.php">
  	<div <?php if($left_selected == "ERRORS")
  	{ echo 'class="menu-left-current-page"'; } ?>>
  	<img src="./images/errors.png">
  	<br/>Errors<br/></div>
  </a>

  <a href = "movies_not_found.php">
    <div <?php if($left_selected == "NOTFOUND")
    { echo 'class="menu-left-current-page"'; } ?>>
    <img src="./images/not_found.png">
    <br/>NotFound<br/></div>
  </a>

  <a href = "movies_goofy.php">
  	<div <?php if($left_selected == "GOOFY")
  	{ echo 'class="menu-left-current-page"'; } ?>>
  	<img src="./images/goofy.png">
  	<br/>Goofy<br/></div>
  </a>


</div>
