import pandas as pd

def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    order_count = orders.groupby('customer_number').size()
    
    customer = order_count.idxmax()
    
    return pd.DataFrame({'customer_number': [customer]})
