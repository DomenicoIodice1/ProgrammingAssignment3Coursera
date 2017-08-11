# ProgrammingAssignment3Coursera

Basically the script I submitted allows to merge the separated tables, training and test in UCI HAR Dataset folder, to create an an unique tidy data set, extracting calculating only activity mean and standard deviation as requested.

Code book:
- features contains data in "features.txt"
  y_train contains data in y_train.txt
  
  x_train contains data in x_train.txt
  
  subject_train contains data in subject_train.txt"
  
  y_test contains data in y_test.txt")
  
  x_test contains data in x_test.txt"
  
  subject_test contains data in subject_test.txt")
  
  x_merge contains a table of x_train files modified in fuction of y_train and the corresponding test files
  
  mean_columns contains grep means
  
  stdev_columns contains grep standard deviations
  
  columns establish columns in data set
  
  x_final contains merged data of the preceding variables in an unique data set reordered by the number indentifing activities
  
  stats avarage tidy data of the x_final data set
