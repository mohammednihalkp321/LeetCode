import pandas as pd

def replace_employee_id(Employees: pd.DataFrame, EmployeeUNI: pd.DataFrame) -> pd.DataFrame:
    result = Employees.merge(
        EmployeeUNI,
        on='id',
        how='left'
    )

    return result[['unique_id', 'name']]