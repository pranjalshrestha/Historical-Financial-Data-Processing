# Load necessary library
if (!require(quantmod)) install.packages("quantmod", dependencies = TRUE)
library(quantmod)

# Define parameters
ticker <- "TB3MS"  # FRED code for 3-Month Treasury Bill Rate
start_date <- as.Date("2015-10-01")  # Set your start date
end_date <- as.Date("2019-12-31")    # Set your end date

# Download historical data from FRED
tb3ms_data <- getSymbols(ticker, src = "FRED", from = start_date, to = end_date, auto.assign = FALSE)

# Convert to data frame and keep only the necessary columns
tb3ms_data <- data.frame(Date = index(tb3ms_data), TB3MS = as.numeric(tb3ms_data[, 1]))

# Display the first few rows (optional)
head(tb3ms_data)

# Specify the output directory
output_directory <- "/Users/pranjal/Documents/Fall 2024/Financial Econometrics/2015-2019 data/"  # Ensure it ends with a slash
output_file <- paste0(output_directory, "TB3MS.csv")  # Save file name

# Save data to CSV file
write.csv(tb3ms_data, file = output_file, row.names = FALSE)
