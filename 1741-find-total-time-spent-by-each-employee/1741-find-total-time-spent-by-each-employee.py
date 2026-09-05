def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    employees["total"] = employees["out_time"] - employees["in_time"]

    return employees.groupby(["event_day", "emp_id"]
    )["total"].sum().reset_index().rename(
        columns={"event_day": "day", "total": "total_time"})