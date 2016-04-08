## Coursera Data Cleaning Course Project

Repository for the submission to the Course for evaluation

### Descrption

The purpose of this project is to demonstrate the way data is collected, worked with, and cleaned. The goal is to prepare tidy data that can be used for later analysis.

The data from the link <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> is downloaded. It is then extracted and the name of extracted folder is renamed from `UCI HAR Dataset` to `dataset`.

The `dataset` folder is at the same level as the folder which contains the repository. The repository folder contains, apart from two .md files, the main script named `run_analysis.R`

Next step is to set the source diretory of R to the directory that contains the above script. 

At this point, you can run the script. The script will read the raw data files and process the inputs to produce a `tidyData.txt` file in the directory which contains the script. `tidyData.txt` can be used for further analysis. 

### Additional Information
You can find additional information in the file `CodeBook.md`