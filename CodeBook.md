The output data set for this script contains the following variables:
* subject - The id of the subject for whom measurements were taken. The original
  study had 30 participants, so this value ranges from 1-30
* activity - Participants in the study were observed wearing a Samsung Galaxy 5 
  smartphone while doing 6 different activities.
  Data was collected in multiple windows during each activity. The activities are:
  * STANDING
  * SITTING
  * LAYING
  * WALKING
  * WALKING_DOWNSTAIRS
  * WALKING_UPSTAIRS
* Variable - Data was gathered from the accelerometer and the embedded 
  gyroscope. This data included both 3-axial linear acceleration and 3-axial 
  angular velocity. These sensor signals were pre-processed with noise filters
  and sampled in fixed-width windows of time (2.56 seconds). Based on the time 
  and frequency domains, a number of features were calculated for each window.
  These features are identified in this variable. Possible values are:
  * timebodyacceleration-mean-x
  * timebodyacceleration-mean-y
  * timebodyacceleration-mean-z
  * timebodyacceleration-standarddeviation-x
  * timebodyacceleration-standarddeviation-y
  * timebodyacceleration-standarddeviation-z
  * timegravityacceleration-mean-x
  * timegravityacceleration-mean-y
  * timegravityacceleration-mean-z
  * timegravityacceleration-standarddeviation-x
  * timegravityacceleration-standarddeviation-y
  * timegravityacceleration-standarddeviation-z
  * timebodyaccelerationjerk-mean-x
  * timebodyaccelerationjerk-mean-y
  * timebodyaccelerationjerk-mean-z
  * timebodyaccelerationjerk-standarddeviation-x
  * timebodyaccelerationjerk-standarddeviation-y
  * timebodyaccelerationjerk-standarddeviation-z
  * timebodygyro-mean-x
  * timebodygyro-mean-y
  * timebodygyro-mean-z
  * timebodygyro-standarddeviation-x
  * timebodygyro-standarddeviation-y
  * timebodygyro-standarddeviation-z
  * timebodygyrojerk-mean-x
  * timebodygyrojerk-mean-y
  * timebodygyrojerk-mean-z
  * timebodygyrojerk-standarddeviation-x
  * timebodygyrojerk-standarddeviation-y
  * timebodygyrojerk-standarddeviation-z
  * timebodyaccelerationmagnitude-mean
  * timebodyaccelerationmagnitude-standarddeviation
  * timegravityaccelerationmagnitude-mean
  * timegravityaccelerationmagnitude-standarddeviation
  * timebodyaccelerationjerkmagnitude-mean
  * timebodyaccelerationjerkmagnitude-standarddeviation
  * timebodygyromagnitude-mean
  * timebodygyromagnitude-standarddeviation
  * timebodygyrojerkmagnitude-mean
  * timebodygyrojerkmagnitude-standarddeviation
  * frequencybodyacceleration-mean-x
  * frequencybodyacceleration-mean-y
  * frequencybodyacceleration-mean-z
  * frequencybodyacceleration-standarddeviation-x
  * frequencybodyacceleration-standarddeviation-y
  * frequencybodyacceleration-standarddeviation-z
  * frequencybodyaccelerationjerk-mean-x
  * frequencybodyaccelerationjerk-mean-y
  * frequencybodyaccelerationjerk-mean-z
  * frequencybodyaccelerationjerk-standarddeviation-x
  * frequencybodyaccelerationjerk-standarddeviation-y
  * frequencybodyaccelerationjerk-standarddeviation-z
  * frequencybodygyro-mean-x
  * frequencybodygyro-mean-y
  * frequencybodygyro-mean-z
  * frequencybodygyro-standarddeviation-x
  * frequencybodygyro-standarddeviation-y
  * frequencybodygyro-standarddeviation-z
  * frequencybodyaccelerationmagnitude-mean
  * frequencybodyaccelerationmagnitude-standarddeviation
  * frequencybodyaccelerationjerkmagnitude-mean
  * frequencybodyaccelerationjerkmagnitude-standarddeviation
  * frequencybodygyromagnitude-mean
  * frequencybodygyromagnitude-standarddeviation
  * frequencybodygyrojerkmagnitude-mean
  * frequencybodygyrojerkmagnitude-standarddeviation
* Average - the average of values observed across all observation windows for 
  the specified variable, subject, and activity 
