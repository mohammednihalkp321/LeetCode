import pandas as pd

def sales_person(SalesPerson: pd.DataFrame, Company: pd.DataFrame, Orders: pd.DataFrame) -> pd.DataFrame:
    red_company = Company[Company['name'] == 'RED']['com_id']
    red_orders = Orders[Orders['com_id'].isin(red_company)]
    sales_ids = red_orders['sales_id'].unique()
    result = SalesPerson[~SalesPerson['sales_id'].isin(sales_ids)]

    return result[['name']]