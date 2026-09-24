import pandas as pd

def actors_and_directors(ActorDirector: pd.DataFrame) -> pd.DataFrame:
    result = (
        ActorDirector
        .groupby(['actor_id', 'director_id'])
        .size()
        .reset_index(name='count')
    )

    result = result[result['count'] >= 3]
    return result[['actor_id', 'director_id']]