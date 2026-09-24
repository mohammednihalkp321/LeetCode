import pandas as pd

def daily_leads_and_partners(DailySales: pd.DataFrame) -> pd.DataFrame:
    result = DailySales.groupby(['date_id', 'make_name']).agg(
        unique_leads=('lead_id', 'nunique'),
        unique_partners=('partner_id', 'nunique')
    ).reset_index()

    return result