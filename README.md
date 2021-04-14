# Attendance Management System using Face Recognition
# First Version

## Overview 

The program opens a window for a student and ask his/her credentials. If user provides the correct credentials he/she can proceed, else they are asked to enter them again. Further the user has 2 options - Check his/her attendance, Mark his/her attendance. If user selects mark attendance, his/her webcam is turned on and the user can position themselves as per instructions and press click to capture their image. The image captured is then matched with the image in the database and if the match is confirmed the user is given the option of subjects as per his semester and course for which he can mark attendance, pressing any subject button will mark his attendance for the subject and date if he has not already marked it. If already marked he will be shown the message of already marked attendance. In the check attendance section he can check his current month/previous month/overall attendance for any subject he has.

## Important Notice
This project is tested on Ubuntu 20.04 LTS and Windows 10 home and is working according to the images shown.

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


## How to run

python3 Attendance_Manager.py or python Attendance_Manager.py


## Important Files

1. Attendance_Manager.py - This is the front end file, the main project file.
2. HelperFunctions.py - This files contain all the helper functions
3. inception_blocks_v2.py - This file contains the architecture of the FaceNet Model used as backend

## Design
The application is written in the file Attendance_Manager.py file and all the helper functions are in the HelperFunctions.py and inception_blocks_v2.py

1. The first page gives the user 3 options Proceed, About and Exit 
![Screenshot from 2020-12-04 13-54-15](https://user-images.githubusercontent.com/65706125/101140641-3da21400-3639-11eb-898f-ebb5da91e23c.png)
2. The about section will show the information about the app and the developer
![Screenshot from 2020-12-04 13-56-09](https://user-images.githubusercontent.com/65706125/101140652-41ce3180-3639-11eb-973e-8193e2e5cc79.png)
3. The exit button closes the application and pressing the proceed button will take the user to this
![Screenshot from 2020-12-04 13-56-44](https://user-images.githubusercontent.com/65706125/101140662-4561b880-3639-11eb-873b-29e0a48eea44.png)
4. Here the user can enter his/her credentials, if the user enters them incorrectly he is shown an error message
![Screenshot from 2020-12-04 13-57-04](https://user-images.githubusercontent.com/65706125/101140667-47c41280-3639-11eb-9c46-248743cd8446.png)
![Screenshot from 2020-12-04 13-57-45](https://user-images.githubusercontent.com/65706125/101140670-498dd600-3639-11eb-9792-6aadb3f514f6.png)
5. Only after the user enters valid credentials, he/she will see this page
![Screenshot from 2020-12-04 13-58-10](https://user-images.githubusercontent.com/65706125/101140674-4b579980-3639-11eb-82fc-3ae32dce18b1.png)
6. If he presses the check attendance button he will se a page like this
![Screenshot from 2020-12-04 13-58-33](https://user-images.githubusercontent.com/65706125/101140679-4d215d00-3639-11eb-888f-c0dfe4e19430.png)
7. Here the user has to select a subject and choose an option, not selecting a subject will show an error like this
![Screenshot from 2020-12-04 13-58-52](https://user-images.githubusercontent.com/65706125/101140682-4e528a00-3639-11eb-88cb-1cfcc687f3af.png)
8. After selecting a subject and pressing any button, he/she can see the desired result like this (Note: The subjects are according to the credentials in the database)
![Screenshot from 2020-12-04 13-59-10](https://user-images.githubusercontent.com/65706125/101140689-501c4d80-3639-11eb-9774-94cf5cf31c7f.png)
9. If the user presses Mark Attendance button, his/her webcam will open automatically and can see an instruction on the bottom and follow that and then press click(Note:Image is blurred/blackened due to privacy issues)
![Screenshot from 2020-11-26 15-43-50](https://user-images.githubusercontent.com/65706125/100340387-1b891000-3001-11eb-93e3-702d095fd43d.png)
10. By pressing that button your image will be captured and you have to wait for nearly 5 seconds to see the after result. (Time depends on your GPU)
11. If the person is not the person who he claims to be, or he did not follow the instruction will clicking the image, is shown an error like this. He can try again clicking an image by pressing try again
![Screenshot from 2020-11-26 15-45-32](https://user-images.githubusercontent.com/65706125/100339452-e6c88900-2fff-11eb-808e-823430378b73.png)
12. After following the instructions, if the person is the one who he claims to be, he is shown a page like this
![Screenshot from 2020-11-26 15-47-34](https://user-images.githubusercontent.com/65706125/100339458-e7f9b600-2fff-11eb-8a3a-826ff89757bc.png)
13. The person can select the subject he wants to mark the attendance for. But he/she can only mark one attendance in a day for that subject, trying multiple times will show and message like this
![Screenshot from 2020-11-26 15-47-57](https://user-images.githubusercontent.com/65706125/100339469-eaf4a680-2fff-11eb-93e1-878ec520197c.png)
![Screenshot from 2020-11-26 15-48-06](https://user-images.githubusercontent.com/65706125/100339473-ecbe6a00-2fff-11eb-878c-557350140a72.png)


## Important Note
This application requires a GPU to function. If you don't have a GPU, the application would not work

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
1. deeplearning.ai course Convolutional Neural Networks taught by Andrew Ng
2. FaceNet: A Unified Embedding for Face Recognition and Clustering 2015
