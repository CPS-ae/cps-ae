import pandas as pd
file1 = pd.read_csv('under.csv', header=0, index_col=0)
file2 = pd.read_csv('over.csv', header=0, index_col=0)
concat = pd.concat([file1, file2], axis=1)
concat.to_csv('pload-arm.csv', index=True)
