# PROCEDURE AND CODE SCRIPT FOR AUGMENTED RCBD USING R LANGUAGE
# -----------------------------------------------------------------------------------------------
# 1. Install (R and R-Studio) and open (R-studio)
# 2. Setup Working Directory
# Path:- go to the desired folder and copy the path direction.
setwd("Path")

# 3. Install Augmented RCBD package 
install.packages("augmentedRCBD")

# 4. Activate Augmented RCBD package
library(augmentedRCBD)

# 5. Import File
# Option 1: directly from working directory (file Must be CSV format)
# Ex: file name: analysis.csv
analysis <- read.csv("analysis.csv")

# 6. Check for the type of data in dataset
str(analysis)

# 7. Convert 'Character' type into 'Factor'
analysis$BLOCK <- as.factor(analysis$BLOCK)
analysis$Code <- as.factor(analysis$Code)

# 8. For output run the package code
bout <- augmentedRCBD.bulk(data = analysis, block = "BLOCK", treatment = "Code", 
                           traits = c("X1", "X2", "X3", "X4"), checks = NULL, 
                           describe = TRUE, alpha = 0.05, gva = TRUE, 
                           freqdist = TRUE, check.col = "red", console = TRUE)

# Wait until console is filled with your data results.

# 9. For report generation run the code.
report.augmentedRCBD.bulk(aug.bulk = bout, target = file.path(tempdir(), "analysis.docx"))

# Example file name to be saved: "analysis.docx".

# 10. For saved file location run the code (path directory of the output file)
tempdir()

# Make sure that system hidden files and folders should be visible.
# -----------------------------------------------------------------------------------------------
# Note:
# 1. Be sure about colon, semicolon, brackets, names (alpha & cases), commas, inverted commas & etc.
# 2. Be sure about package installation and activations.
# 3. Check the code properly after modification of the original code.
# -----------------------------------------------------------------------------------------------

# Complete R-script for Augmented RCBD.

# Install and activate augmentedRCBD package
install.packages("augmentedRCBD")
library(augmentedRCBD)

# Set options for maximum print
options(max.print = 100000)

# Check the structure of the analysis dataset
str(analysis)

# Convert 'BLOCK' and 'Code' columns to factors
analysis$BLOCK <- as.factor(analysis$BLOCK)
analysis$Code <- as.factor(analysis$Code)

# Run the augmented RCBD analysis
bout <- augmentedRCBD.bulk(data = analysis, block = "BLOCK", treatment = "Code", 
                           traits = c("X1", "X2", "X3", "X4"), checks = NULL, 
                           alpha = 0.05, describe = TRUE, freqdist = TRUE, 
                           gva = TRUE, check.col = "RED", console = TRUE)

# Generate a report for the analysis
report.augmentedRCBD.bulk(aug.bulk = bout, target = file.path(tempdir(), "analysis.docx"))

# Display the directory where the output file is saved
tempdir()
