import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load preprocessed data
df = pd.read_csv("preprocessed_dataset.csv")

# ------------------------
# 1. Basic Overview
# ------------------------
print("Shape:", df.shape)
print("\nInfo:")
print(df.info())

print("\nFirst 5 rows:")
print(df.head())

# ------------------------
# 2. Missing Values Check (should be minimal/zero)
# ------------------------
print("\nMissing values:")
print(df.isnull().sum())

# ------------------------
# 3. Duplicate Check
# ------------------------
print("\nDuplicate rows:", df.duplicated().sum())

# ------------------------
# 4. Descriptive Statistics
# ------------------------
print("\nSummary statistics:")
print(df.describe())

# ------------------------
# 5. Distribution of Numerical Columns
# ------------------------
df.hist(figsize=(12, 8), bins=20)
plt.suptitle("Feature Distributions")
plt.show()

# ------------------------
# 6. Correlation Analysis
# ------------------------
plt.figure(figsize=(10,6))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap="coolwarm")
plt.title("Correlation Matrix")
plt.show()

# ------------------------
# 7. Target Variable (if exists)
# ------------------------
if "target" in df.columns:
    print("\nTarget value counts:")
    print(df["target"].value_counts())

    sns.countplot(x=df["target"])
    plt.title("Target Distribution")
    plt.show()

# ------------------------
# 8. Boxplots (Outlier check after preprocessing)
# ------------------------
plt.figure(figsize=(10,6))
sns.boxplot(data=df.select_dtypes(include=np.number))
plt.xticks(rotation=90)
plt.title("Outlier Check")
plt.show()

#--------------------------
# Top 10 products by sales
#--------------------------
top_products = df.groupby("Product")["TotalPrice"].sum().sort_values(ascending=False).head(10)

plt.figure(figsize=(10,5))
top_products.plot(kind="bar")
plt.title("Top 10 Best Selling Products")
plt.xlabel("Product")
plt.ylabel("Total Sales")
plt.xticks(rotation=45)
plt.show()
