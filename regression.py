import numpy as np 
from scipy import sparse 
from sklearn.datasets import make_classification
from sklearn.decomposition import PCA 
from sklearn.cross_validation import ShuffleSplit, train_test_split 
from sklearn import metrics 
from sklearn.learning_curve import learning_curve 
from sklearn.linear_model import LinearRegression 
from sklearn.ensemble import GradientBoostingRegressor 
from sklearn.grid_search import GridSearchCV 
import pandas as pd

# load csv
data = pd.read_csv('WPU01130217.csv')
data.head()

# drop first column
print(data.data)
#X_train, X_test, y_train, y_test = train_test_split(cal.data, cal.target) 

print(data)