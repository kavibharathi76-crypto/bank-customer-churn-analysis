import pandas as pd

df = pd.read_csv("churn.csv")

print(df.head())

print(df.shape)

print(df.columns)

print(df.dtypes)

print(df.isnull().sum())

print(df.duplicated().sum())

print(df['CustomerId'].nunique())

print(df['Exited'].value_counts())

print(df['Exited'].value_counts(normalize=True)*100)

print(pd.crosstab(df['Geography'],df['Exited']))

churn_rate=pd.crosstab(df['Geography'],df['Exited'],normalize='index')*100

print(churn_rate.round(2))

gender_churn= pd.crosstab(df['Gender'],df['Exited'],normalize='index')*100

print(gender_churn.round(2))

print(
    pd.crosstab(
        df["IsActiveMember"],
        df["Exited"],
        normalize="index"
    ) * 100
)

df["AgeGroup"] = pd.cut(
    df["Age"],
    bins=[0, 30, 40, 50, 60, 100],
    labels=["Under30", "30-39", "40-49", "50-59", "60+"], right=False
)

print(df[["Age", "AgeGroup"]].head(20))

agegroup_churn= (pd.crosstab(df["AgeGroup"],df['Exited'],normalize='index')*100)

print(agegroup_churn.round(2))

print(pd.crosstab(
    [df["AgeGroup"], df["IsActiveMember"]],
    df["Exited"],
    normalize="index"
) * 100)

print(pd.crosstab([df["AgeGroup"],df["IsActiveMember"]],df["Exited"]))

age_50_59 = df[df["AgeGroup"] == "50-59"]

print(pd.crosstab(
    age_50_59["NumOfProducts"],
    age_50_59["Exited"],
    normalize="index"
) * 100)

print(pd.crosstab(
    age_50_59["NumOfProducts"],
    age_50_59["Exited"]
))

print(age_50_59.groupby("Exited")["Balance"].mean())

print(age_50_59.groupby("Exited")["Balance"].median())

df = pd.read_csv("churn.csv")
