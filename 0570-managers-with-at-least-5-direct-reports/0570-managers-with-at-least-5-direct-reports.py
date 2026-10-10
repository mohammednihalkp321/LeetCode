import pandas as pd

def find_managers(Employee: pd.DataFrame) -> pd.DataFrame:
    counts = Employee.groupby('managerId').size().reset_index(name='count')
    managers = counts[counts['count'] >= 5]
    result = Employee[Employee['id'].isin(managers['managerId'])]
    return result[['name']]
