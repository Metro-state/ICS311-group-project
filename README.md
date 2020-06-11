# A Basic Composer (ABC) 
## Description
This repository houses the main project for the course ICS311
## Making xlsx file format work with git
- download xltrail (https://github.com/xlwings/git-xl/releases/download/0.4.2/git-xl-windows-0.4.2.exe)
- refreshenv (or re-open your CLI)
- git xl install
Now when you run a git diff, xlsx file format will now be understood by git.

- git diff
```diff --xl a/iteration_2_template.xlsx b/iteration_2_template.xlsx
--- a/iteration_2_template.xlsx/Worksheets/OMDB Queries
+++ b/iteration_2_template.xlsx/Worksheets/OMDB Queries
-84 cells
+85 cells
```
