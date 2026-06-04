import pandas as pd

# Load dataset
data = pd.read_csv("dataset.csv")

# Check missing values
print("Missing Values:")
print(data.isnull().sum())

# Fill missing values
for col in data.columns:
    if data[col].dtype == 'object':
        data[col] = data[col].fillna("Unknown")
    else:
        data[col] = data[col].fillna(data[col].mean())

# Remove duplicate rows
data.drop_duplicates(inplace=True)

# Convert Date column
data['Date'] = pd.to_datetime(data['Date'])

# Create Year, Month, Day columns (helpful for analysis)
data['Year'] = data['Date'].dt.year
data['Month'] = data['Date'].dt.month
data['Day'] = data['Date'].dt.day

# Save preprocessed dataset
data.to_csv("preprocessed_dataset.csv", index=False)

print("Preprocessing Completed Successfully!")