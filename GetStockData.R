# Load necessary library

if(!require(quantmod)) install.packages("quantmod", dependencies = TRUE)
library(quantmod)


# Define parameters
ticker <- "^GSPC"  # Replace with your desired company's ticker symbol
start_date <- as.Date("2014-01-01")  # Set your start date
end_date <- as.Date("2024-10-31")    # Set your end date

# Download daily historical data
stock_data <- getSymbols(ticker, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)

# Convert to monthly data
monthly_data <- to.monthly(stock_data, indexAt = "firstof", OHLC = TRUE)

# Display the first few rows (optional)
head(monthly_data)

# Check and rename columns if needed (they should be in the desired format)
colnames(monthly_data) <- c("Open", "High", "Low", "Close", "Adj Close", "Volume")

# Add Date as a separate column
monthly_data <- data.frame(Date = index(monthly_data), monthly_data)

# Specify the output directory
output_directory <- "/Users/pranjal/Documents/Fall 2024/Eco 476/"  # Ensure it ends with a slash
output_file <- paste0(output_directory, "S&P 500.csv")

# Save monthly data to CSV file
write.csv(monthly_data, file = output_file, row.names = FALSE)