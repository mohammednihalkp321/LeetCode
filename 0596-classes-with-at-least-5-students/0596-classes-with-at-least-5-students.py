import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    count = courses.groupby("class").size()
    return count[count >= 5].reset_index(name="count")[["class"]]