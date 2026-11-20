
import pandas as pd
import numpy as np

np.random.seed(42)

# Number of transactions
total_transactions = 100000

# Generate transaction IDs
transaction_ids = [
    f"TXN{i:06d}" for i in range(1, total_transactions + 1)
]

# Generate customer IDs
customer_ids = [
    f"CUST{np.random.randint(1, 101):03d}"
    for i in range(total_transactions)
]


# Customer cities
cities = [
    "Delhi",
    "Mumbai",
    "Bengaluru",
    "Hyderabad",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Bareilly",
    "Chennai",
    "Kolkata"
]

selected_cities = np.random.choice(cities, total_transactions)

# Merchant categories
merchant_categories = [
    "Grocery",
    "Food",
    "Shopping",
    "Travel",
    "Utilities",
    "Entertainment"
]

# Assign a fixed city to each customer
customer_city_map = {
    f"CUST{i:03d}": np.random.choice(cities)
    for i in range(1, 101)
}

selected_cities = [
    customer_city_map[cid] for cid in customer_ids
]

# Generate merchant IDs
merchant_ids = [
    f"MER{i:03d}"
    for i in np.random.randint(1, 51, total_transactions)
]

# Assign a fixed category to each merchant
merchant_category_map = {
    f"MER{i:03d}": np.random.choice(merchant_categories)
    for i in range(1, 51)
}

selected_categories = [
    merchant_category_map[mid] for mid in merchant_ids
]

selected_categories = np.random.choice(
    merchant_categories,
    total_transactions
)

# Transaction types
transaction_types = ["P2P", "P2M"]

selected_transaction_types = np.random.choice(
    transaction_types,
    total_transactions
)

# Keep merchant details only for P2M transactions
selected_merchant_ids = [
    mid if tx_type == "P2M" else None
    for mid, tx_type in zip(merchant_ids, selected_transaction_types)
]

selected_merchant_categories = [
    category if tx_type == "P2M" else None
    for category, tx_type in zip(selected_categories, selected_transaction_types)
]


# Generate transaction amounts
amounts = np.random.randint(100, 5001, total_transactions)

# Payment apps
payment_apps = ["PhonePe", "Google Pay", "Paytm", "BHIM", "Other UPI"]
selected_apps = np.random.choice(payment_apps, total_transactions)

# Banks
# Available banks
banks = [
    "SBI",
    "HDFC",
    "ICICI",
    "Axis",
    "PNB",
    "Kotak",
    "Bank of Baroda",
    "Canara Bank",
    "Union Bank",
    "IDFC First"
]

# Generate sender bank
selected_sender_banks = np.random.choice(
    banks,
    total_transactions
)

# Generate receiver bank
selected_receiver_banks = np.random.choice(
    banks,
    total_transactions
)

# Transaction statuses with probabilities
statuses = ["SUCCESS", "FAILED", "PENDING"]

selected_statuses = np.random.choice(
    statuses,
    total_transactions,
    p=[0.85, 0.10, 0.05]
)

# Transaction dates
transaction_dates = pd.to_datetime(
    np.random.choice(
        pd.date_range("2025-01-01", "2025-12-31"),
        total_transactions
    )
)

# Transaction hours (0 to 23)
transaction_hours = np.random.randint(0, 24, total_transactions)


# Failure reasons with probabilities
failure_reasons = [
    "Bank Server Error",
    "Network Error",
    "Insufficient Balance",
    "Incorrect UPI PIN",
    "Transaction Limit Exceeded"
]

failure_probabilities = [0.35, 0.25, 0.20, 0.15, 0.05]

# Assign failure reason only when transaction fails
selected_failure_reasons = [
    np.random.choice(
        failure_reasons,
        p=failure_probabilities
    ) if status == "FAILED" else None
    for status in selected_statuses
]


# Processing time in milliseconds
processing_times = np.random.randint(500, 10001, total_transactions)

# Create DataFrame
df = pd.DataFrame({
    "transaction_id": transaction_ids,
    "customer_id": customer_ids,
    "amount": amounts,
    "payment_app": selected_apps,
    "sender_bank": selected_sender_banks,
    "receiver_bank": selected_receiver_banks,
    "status": selected_statuses,
    "transaction_date": transaction_dates,
    "transaction_hour": transaction_hours,
    "failure_reason": selected_failure_reasons,
    "processing_time_ms": processing_times,
    "city": selected_cities,
    "merchant_id": selected_merchant_ids,
    "merchant_category": selected_merchant_categories,
    "transaction_type": selected_transaction_types
})

# Display dataset
print(df.to_string(index=False))

# print("\nTransaction Status Distribution:")
# print(df["status"].value_counts())

# print("\nFailure Reason Distribution:")
# print(df["failure_reason"].value_counts())

# print("\nBank Details:")
# print(df[["sender_bank", "receiver_bank"]])

# Save dataset as CSV
df.to_csv("data/raw/upi_transactions.csv", index=False)

print("\nDataset saved successfully!")

# # Dataset validation
# print("\nDataset Shape:")
# print(df.shape)

# print("\nTotal Rows:")
# print(len(df))

# print("\nTotal Columns:")
# print(len(df.columns))

# print("\nColumn Names:")
# print(df.columns.tolist())

# # Check duplicate transactions
# duplicate_count = df["transaction_id"].duplicated().sum()

# print("\nDuplicate Transaction IDs:")
# print(duplicate_count)

# # Check missing values
# print("\nMissing Values in Each Column:")
# print(df.isnull().sum())

# # Check transaction status percentages
# print("\nTransaction Status Percentages:")
# print(
#     df["status"].value_counts(normalize=True).mul(100).round(2)
# )

# Final Dataset Quality Check

print("\n========== FINAL DATA QUALITY REPORT ==========")

print("Total Transactions:", len(df))

print("Unique Transaction IDs:", df["transaction_id"].nunique())

print("Invalid Transaction IDs:",
      df["transaction_id"].isnull().sum())

print("Invalid Amounts:",
      ((df["amount"] < 100) | (df["amount"] > 5000)).sum())

print("Invalid Dates:",
      df["transaction_date"].isnull().sum())

print("Invalid Status Values:",
      (~df["status"].isin(["SUCCESS", "FAILED", "PENDING"])).sum())

print("Invalid Payment Apps:",
      (~df["payment_app"].isin(
          ["PhonePe", "Google Pay", "Paytm", "BHIM", "Other UPI"]
      )).sum())

print("Invalid Sender Banks:",
      (~df["sender_bank"].isin(banks)).sum())

print("Invalid Receiver Banks:",
      (~df["receiver_bank"].isin(banks)).sum())