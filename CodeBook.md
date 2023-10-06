### Final Data frame description
There are 1715 variables in the tidy-format data set, generated from this
project. 

|    Variable    |              Description                                 |
|----------------|----------------------------------------------------------|
|    *sub*       | integer type data, represents subject id which ranges    |
|                | from 1-30.                                               |
|                |                                                          |
|    *act*       | character type data, represents activity description,    |
|                | each subject carried out. The values are WALKING,        |   
|                | WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING  |
|                | and LAYING.                                              |
|                |                                                          |
|                | _Henceforth all variables are numeric type data_.        |
| *feat.FTR1*,   | correspond to the 561 feature vector with time and       |
| *feat.FTR2*,   | frequency domain variables, that were used in the        |
|   so on up to  | previous study.                                          |
| *feat.FTR561*  |                                                          |
|                |                                                          |
| *bodyAccX.S1*, | The mean of each of 128 variables/columns for body       |
| *bodyAccX.S2*, | acceleration in the X direction grouped by subject and   |
| so on up to    | activity.                                                |
|*bodyAccX.S128* |                                                          |
|                |                                                          |
| *bodyAccY.S1*, | The mean of each of 128 variables/columns for body       |
| *bodyAccY.S2*, | acceleration in the Y direction grouped by subject and   |
| so on up to    | activity.                                                |
|*bodyAccY.S128* |                                                          |
|                |                                                          |
| *bodyAccZ.S1*, | The mean of each of 128 variables/columns for body       |
| *bodyAccZ.S2*, | acceleration in the Z direction grouped by subject and   |
| so on up to    | activity.                                                |
|*bodyAccZ.S128* |                                                          |
|                |                                                          |
| *bodyGyX.S1*,  | Mean of each of 128 variables/columns for body angular   |
| *bodyGyX.S2*,  | velocity in the X direction grouped by subject and       |
| so on up to    | activity.                                                |
| *bodyGyX.S128* |                                                          |
|                |                                                          |
| *bodyGyY.S1*,  | Mean of each of 128 variables/columns for body angular   |
| *bodyGyY.S2*,  | velocity in the Y direction grouped by subject and       |
| so on up to    | activity.                                                |
| *bodyGyY.S128* |                                                          |
|                |                                                          |
| *bodyGyZ.S1*,  | Mean of each of 128 variables/columns for body angular   |
| *bodyGyZ.S2*,  | velocity in the Z direction grouped by subject and       |
| so on up to    | activity.                                                |
| *bodyGyZ.S128* |                                                          |
|                |                                                          |
| *totAccX.S1*,  | Mean of each of 128 variables/columns for total          | 
| *totAccX.S2*,  | acceleration in the X direction grouped by subject and   |
| *totAccX.S128* | activity.                                                |
|                |                                                          |
| *totAccY.S1*,  | Mean of each of 128 variables/columns for total          | 
| *totAccY.S2*,  | acceleration in the Y direction grouped by subject and   |
| so on up to    | activity.                                                |
| *totAccY.S128* |                                                          |
|                |                                                          |
| *totAccZ.S1*,  | Mean of each of 128 variables/columns for total          | 
| *totAccZ.S2*,  | acceleration in the Z direction grouped by subject and   |
| so on up to    | activity.                                                |
| *totAccZ.S128* |                                                          |

Subject id and activity are 2 variables, measurements of 561 features i.e. 561 variables, body acceleration in three directions, body angular velocity in three directions and total acceleration in three directions, total 9 variables and 128 readings for each of nine variables giving a total of 1152 variables, all
together adds up to 1715 variables.

The units for body acceleration values and total acceleration values is 'g'
The unit for body angular velocity values is radians/sec.