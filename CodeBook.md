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
| *bodyAccX.S1*, | 128 signals data recorded for body acceleration in the X |
| *bodyAccX.S2*, | direction.                                               |
| so on up to    |                                                          |
|*bodyAccX.S128* |                                                          |
|                |                                                          |
| *bodyAccY.S1*, | 128 signals data recorded for body acceleration in the Y |
| *bodyAccY.S2*, | direction.                                               |
| so on up to    |                                                          |
|*bodyAccY.S128* |                                                          |
|                |                                                          |
| *bodyAccZ.S1*, | 128 signals data recorded for body acceleration in the Z |
| *bodyAccZ.S2*, | direction.                                               |
| so on up to    |                                                          |
|*bodyAccZ.S128* |                                                          |
|                |                                                          |
| *bodyGyX.S1*,  | 128 signals data recorded for body angular velocity in   |
| *bodyGyX.S2*,  | the X direction.                                         |
| so on up to    |                                                          |
| *bodyGyX.S128* |                                                          |
|                |                                                          |
| *bodyGyY.S1*,  | 128 signals data recorded for body angular velocity in   |
| *bodyGyY.S2*,  | the Y direction.                                         |
| so on up to    |                                                          |
| *bodyGyY.S128* |                                                          |
|                |                                                          |
| *bodyGyZ.S1*,  | 128 signals data recorded for body angular velocity in   |
| *bodyGyZ.S2*,  | the Z direction.                                         |
| so on up to    |                                                          |
| *bodyGyZ.S128* |                                                          |
|                |                                                          |
| *totAccX.S1*,  | 128 signals data estimated for body total acceleration   | 
| *totAccX.S2*,  | in the X direction.                                      |
| *totAccX.S128* |                                                          |
|                |                                                          |
| *totAccY.S1*,  | 128 signals data estimated for body total acceleration   | 
| *totAccY.S2*,  | in the Y direction.                                      |
| so on up to    |                                                          |
| *totAccY.S128* |                                                          |
|                |                                                          |
| *totAccZ.S1*,  | 128 signals data estimated for body total acceleration   | 
| *totAccZ.S2*,  | in the Z direction.                                      |
| so on up to    |                                                          |
| *totAccZ.S128* |                                                          |

Subject id and activity are 2 variables, measurements of 561 features i.e. 561 variables, body acceleration in three directions, body angular velocity in three directions and total acceleration in three directions, total 9 variables and 128 readings for each of nine variables giving a total of 1152 variables, all
together adds up to 1715 variables. After combining train and test data there
are 10,299 observations for each of these 1715 variables.

The units for body acceleration values and total acceleration values is 'g'
The unit for body angular velocity is radians/sec.