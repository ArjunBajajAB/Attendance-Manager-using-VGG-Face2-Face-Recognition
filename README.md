# Attendance Management System using VGG Face2 Face Recognition
# First Version

## Overview 

The program opens a window for a student and ask his/her credentials. If user provides the correct credentials he/she can proceed, else they are asked to enter them again. Further the user has 2 options - Check his/her attendance, Mark his/her attendance. If user selects mark attendance, his/her webcam is turned on and the user can position themselves as per instructions and press click to capture their image. The image captured is then matched with the image in the database and if the match is confirmed the user is given the option of subjects as per his semester and course for which he can mark attendance, pressing any subject button will mark his attendance for the subject and date if he has not already marked it. If already marked he will be shown the message of already marked attendance. In the check attendance section he can check his current month/previous month/overall attendance for any subject he has.

## Important Notice
This project is tested on Ubuntu 20.04 LTS and Windows 10 home and is working fine.

## Open Source Model
Python libraries used
1. Opencv
2. Keras
3. Tkinter
4. Numpy
5. datetime
6. Tensorflow 
7. PIL
8. mysql.connector
9. os
10. pyscreenshot

### First install the above mentioned libraries

## How to run

python3 Attendance_Manager.py or python Attendance_Manager.py


## Important Files

1. Attendance_Manager.py - This is the front end file, the main project file.
2. HelperFunctions.py - This files contain all the helper functions


## Design
The application is written in the file Attendance_Manager.py file and all the helper functions are in the HelperFunctions.py 

## Important Note
This application requires a GPU to function efficiently but no worries if you do not have one. If you are running the app without a GPU, comment line '13' and '14' in the file 'HelperFunctions.py' otherwise you will get an error.

Versions of the software used are 
1. Python -  3.8.5
2. Tensorflow - tensorflow-gpu 2.2.0
3. CUDA - 10.2
4. CuDNN - v8.0.5 (November 9th, 2020), for CUDA 10.2 
5. GPU - Nvidia Geforce GTX 1650

## Report

The first edition is doing good when the user captures his/her image in bright light.

## Need Update

The project is the first edition. I will keep update.

## References
For backend deep learning model-
1. VGG Face 2 model for face recognition
