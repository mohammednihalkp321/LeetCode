import pandas as pd

def count_salary_categories(Accounts: pd.DataFrame) -> pd.DataFrame:
    low = (Accounts['income'] < 20000).sum()
    average = ((Accounts['income'] >= 20000) & (Accounts['income'] <= 50000)).sum()
    high = (Accounts['income'] > 50000).sum()

    result = pd.DataFrame({
        'category': ['Low Salary', 'Average Salary', 'High Salary'],
        'accounts_count': [low, average, high]
    })

    return result
    