import pandas as pd

def students_and_examinations(
    Students: pd.DataFrame,
    Subjects: pd.DataFrame,
    Examinations: pd.DataFrame
) -> pd.DataFrame:

    result = Students.merge(Subjects, how='cross')

    counts = (
        Examinations
        .groupby(['student_id', 'subject_name'])
        .size()
        .reset_index(name='attended_exams')
    )
    result = result.merge(
        counts,
        on=['student_id', 'subject_name'],
        how='left'
    )
    result['attended_exams'] = result['attended_exams'].fillna(0).astype(int)
    result = result.sort_values(['student_id', 'subject_name'])

    return result[['student_id', 'student_name', 'subject_name', 'attended_exams']]