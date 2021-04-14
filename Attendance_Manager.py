from tkinter import * #For designing of front end
from PIL import ImageTk, Image #For loading images
from tkinter import font as tkFont
import PIL
from numpy import dtype
import pyscreenshot as ImageGrab
from HelperFunctions import *
import threading
import time
import cv2

#Add more libraries here

class AttendanceManager(object):

    def __init__(self):
        self.root = Tk()   #root widget for the app window
        self.root.geometry("1200x800")
        self.root.title("Attendance Manager")
        self.root.resizable(0,0)  #to disable resizing of root window to avoid distortion
        self.BackgroundImage(self.root)

        # Tkinter fonts intialized into variables for further use
        self.ButtonFont = tkFont.Font(family="Playbill", size=20, weight="bold")
        self.TextFont = tkFont.Font(family="Courier New", size=18, weight="bold")
        self.InfoFont = tkFont.Font(family="Courier New", size=25, weight="bold")
        self.EntryFont = tkFont.Font(family="Courier New",size=15)

        #Calling the first page function
        self.FirstPage()
        self.root.mainloop()

    #################################################################################################################
    ############################################### 1st Page ########################################################
    #################################################################################################################

    def FirstPage(self):
        self.create_MainFrame("First") #Calling the create_MainFrame function with "First" argument so as to specify background image
        self.SideImage = ImageTk.PhotoImage(file = "Images/Attendance.jpg")
        self.Image = Label(self.main_frame,image=self.SideImage)
        self.Image.place(x=10,y=200)
        self.content_frame = Frame(self.main_frame,height=300,width=700,bg="Black")
        self.content_frame.place(x=500,y=550)  #Place below heading
        self.ProceedButton = Button(self.content_frame,text="Proceed",activebackground="grey",bd=3,bg="White",fg="Black",
                                    command=self.ProceedPage,font=self.ButtonFont,justify=CENTER,height=1,width=7)
        self.ProceedButton.place(x=0,y=25)
        self.AboutButton = Button(self.content_frame, text="About", activebackground="grey", bd=3, bg="White",fg="Black",
                                    command=self.AboutPage, font=self.ButtonFont, justify=CENTER, height=1, width=7)
        self.AboutButton.place(x=200, y=25)
        self.ExitButton = Button(self.content_frame, text="Exit", activebackground="grey", bd=3, bg="White",fg="Black",
                                 command=exit, font=self.ButtonFont, justify=CENTER, height=1, width=7)
        self.ExitButton.place(x=400, y=25)

    ######################################################################################################################
    ################################################ Proceed Page ########################################################
    ######################################################################################################################

    def ProceedPage(self):
        self.active = ifActive()
        if self.active:
            self.CheckMarkButton()
        else:
            self.main_frame.destroy()  #Destroy the entire main frame and create a new page
            self.create_MainFrame()  #without "First" argument so as to change the background Image
            self.SideImage = ImageTk.PhotoImage(file="Images/details.jpg")
            self.SideLabel = Label(self.main_frame,image=self.SideImage)
            self.SideLabel.place(x=10,y=50)
            self.NameLabel = Label(self.main_frame,text="Name     :",bg="black", fg="white", font=self.TextFont)
            self.NameLabel.place(x=600, y=170)

            self.EnterName = Entry(self.main_frame,font=self.EntryFont, bd=3,width=25, bg="white", fg="black")  #Entry widget for name
            self.EnterName.place(x=790, y=170,height=40)

            self.EnrollmentNoLabel = Label(self.main_frame, text="Enrollment No :", bg="black", fg="white",
                                        font=self.TextFont)
            self.EnrollmentNoLabel.place(x=600, y=240)

            self.EnterEnrollmentNo = Entry(self.main_frame,font=self.EntryFont, bd=3,width=20, bg="white", fg="black") #Entry widget for enrollment
            self.EnterEnrollmentNo.place(x=860, y=240,height=40)

            self.CourseLabel = Label(self.main_frame, text="Course  :", bg="black", fg="white", font=self.TextFont)
            self.CourseLabel.place(x=600, y=300)

            self.clicked = StringVar(self.main_frame)
            self.clicked.set("Select") #By default no subject is selected
            self.CourseEnter = OptionMenu(self.main_frame, self.clicked, "BCA", "B.Tech")
            self.CourseEnter.config(bg="Black", fg="White",activebackground="grey",font=self.TextFont)
            self.CourseEnter.place(x=790, y=300)

            self.SemesterLabel = Label(self.main_frame, text="Semester :", bg="black", fg="white", font=self.TextFont)
            self.SemesterLabel.place(x=600, y=360)

            self.SelectSemester = StringVar(self.main_frame)
            self.SelectSemester.set("Select") #By default no semester is selected
            self.EnterSemester = OptionMenu(self.main_frame,self.SelectSemester , "1", "2", "3", "4", "5", "6", "7", "8")
            self.EnterSemester.config(bg="Black", fg="White",activebackground="grey",font=self.TextFont)
            self.EnterSemester.place(x=790, y=360)

            #All the buttons for submit/reset/back functionality
            self.ResetButton = Button(self.main_frame, text="Reset", activebackground="grey", bd=3, bg="White",
                                    fg="Black", font=self.ButtonFont, justify=RIGHT, height=1, width=7,
                                    command=self.ProceedPage)
            self.ResetButton.place(x=600, y=470)

            self.ContinueButton = Button(self.main_frame, text="Continue", activebackground="grey", bd=3, bg="White",
                                        fg="Black", font=self.ButtonFont, justify=RIGHT, height=1, width=7,
                                        command=self.ContinuePage)
            self.ContinueButton.place(x=850, y=470)

            self.BackButton = Button(self.main_frame, text="Back", activebackground="grey", bd=3, bg="White",command=self.FirstPage,
                                            fg="Black", font=self.ButtonFont, justify=RIGHT, height=1, width=7)
            self.BackButton.place(x=750, y=550)

    ##############################################################################################################
    ####################################### Continue  Page ########################################################
    ###############################################################################################################

    def ContinuePage(self):
        self.Name = self.EnterName.get()
        self.UniName = self.Name
        self.RollNo = self.EnterEnrollmentNo.get()
        self.Course = self.clicked.get()
        self.Semester = self.SelectSemester.get()
        self.Name = self.Name.replace(" ", "") #To remove spaces to perform string operations

        #Validating the crediantials entered by the user, Both the syntax and data as per database
        if self.RollNo.isdigit() and int(len(self.RollNo)) == 11 and self.Name.isalpha() and self.Semester != "Select" and self.Course != "Select":
            if self.Course == "BCA" and (self.Semester == "7" or self.Semester == "8"):
                self.Alert_1 = Label(self.main_frame, text="There are only I TO VI \n Semester in BCA ",
                                     bg="black", fg="white", font=self.TextFont)
                self.Alert_1.place(x=860, y=360)
            elif ValidateInfo(self.UniName,self.RollNo,self.Course,int(self.Semester)):
                ActivateUser(self.RollNo)
                self.CheckMarkButton()
                
            else:
                self.ProceedPage()
                self.Alert = Label(self.main_frame,
                                   text="No data found for the entered credentials!",
                                   bg="black", fg="white", font=self.TextFont)
                self.Alert.place(x=590, y=70)

        #If syntax is wrong print error message
        else:
            self.ProceedPage()
            self.Alert = Label(self.main_frame,
                               text="Your name should be name \n\n Enrollment number should be 11 digits only:",
                               bg="black", fg="white", font=self.TextFont)
            self.Alert.place(x=590, y=70)

    ##############################################################################################################
    ####################################### Check/Mark Attendance Page ###########################################
    ##############################################################################################################

    def CheckMarkButton(self):
        self.main_frame.destroy() #Destroy previous page
        self.create_MainFrame()
        self.SideImage = ImageTk.PhotoImage(file="Images/options.jpg")
        self.SideLabel = Label(self.main_frame,image=self.SideImage)
        self.SideLabel.place(x=10,y=20)
        self.Check_Your_AttendanceButton = Button(self.main_frame, text="Check your attendance",
                                                  activebackground="grey", bd=3, bg="White",
                                                  fg="Black", font=self.ButtonFont, justify=RIGHT, height=1,
                                                  width=20, command=self.Check_AttendancePage)
        self.Check_Your_AttendanceButton.place(x=750, y=210)

        self.Mark_Your_AttendanceButton = Button(self.main_frame, text="Mark your attendance",
                                                 activebackground="grey", bd=3, bg="White",
                                                 fg="Black", font=self.ButtonFont, justify=RIGHT, height=1,
                                                 width=20, command=self.MarkAttendancePage)
        self.Mark_Your_AttendanceButton.place(x=750, y=310)

        self.LogoutButton = Button(self.main_frame, text="Logout", activebackground="grey", bd=3, bg="White",
                                 fg="Black",
                                 command=self.Logout, font=self.ButtonFont, justify=RIGHT, height=1, width=20)
        self.LogoutButton.place(x=750, y=410)

        self.ExitButton = Button(self.main_frame, text="Exit", activebackground="grey", bd=3, bg="White",
                                 fg="Black",
                                 command=exit, font=self.ButtonFont, justify=RIGHT, height=1, width=20)
        self.ExitButton.place(x=750, y=510)
    
    def Logout(self):
        logout()
        self.ProceedPage()

    ##############################################################################################################
    ########################################## Mark Attendance Page ##############################################
    ##############################################################################################################
    def MarkAttendancePage(self):
        self.main_frame.destroy()
        self.create_MainFrame()
        self.CameraFrame = Frame(self.main_frame,height=700,width=1150)
        self.CameraFrame.place(x=25,y=10)
        self.CameraLabel = Label(self.CameraFrame,height=700,width=1150)
        self.CameraLabel.place(x=0,y=0)
        self.cap = cv2.VideoCapture(0) #Open webcam

        # set height and width of camera frame
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT,700)
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH,1150)
        self.ShowFrame() #calling the function for streaming the video from webcam
        self.ContentFrame = Frame(self.main_frame,height=70,width=1050,bg="black")
        self.ContentFrame.place(x=100,y=720)
        self.Info = Message(self.ContentFrame,text="Please try to adjust you entire face in the video frame and then press the Click Button",
                            font=self.TextFont,fg="white",width=750,justify=LEFT,bg="black")
        self.Info.place(x=0,y=0)
        self.ClickButton = Button(self.ContentFrame,text="Click",fg="black",bg="white",bd=3,activebackground="grey",font=self.ButtonFont,
                                  height=1,width=8,command=self.ClickImage,justify=CENTER)
        self.ClickButton.place(x=850,y=0)

    def ShowFrame(self):
        # Function to continuosly read from webcam videeo stream and display it
        ret, frame = self.cap.read()
        if ret:
            self.frame = cv2.flip(frame, 1) #flip video stream so as to avoid mirroring
            self.frame = cv2.cvtColor(self.frame,cv2.COLOR_BGR2RGBA) #Convert video stream color to RGB from BGR
            self.img = PIL.Image.fromarray(self.frame) #Create an Image from array of pixels
            self.imgtk = ImageTk.PhotoImage(image=self.img) #Create , store that image
            self.CameraLabel.img = self.imgtk #Display that image
            self.CameraLabel.configure(image=self.imgtk) #set the image in the frame
            self.CameraLabel.after(10, self.ShowFrame) #loop after 10ms so that video stream is continously displayed
    
    def SaveImage(self):
        #Function to capture the image of the user in webcam when user presses "Click"
        self.x1 = self.root.winfo_rootx() + self.CameraFrame.winfo_x() #top left coordinate x
        self.y1 = self.root.winfo_rooty() + self.CameraFrame.winfo_y() #top left coordinate y
        self.x2 = self.x1 + 1150    #bottom right coordinate x
        self.y2 = self.y1 + 700     #bottom right coordinate y
        self.img = ImageGrab.grab((self.x1, self.y1, self.x2, self.y2)) #Grab the image
        imgpath = "Images/Person.jpg"
        self.img.save(imgpath) #store the image at this path

    def ClickImage(self):
        self.SaveImage() #to save the image
        self.Info.destroy()
        self.loggedInUser = ifActive()
        ID,self.SubjectId,ImageEncoding,self.name = getInfo(self.loggedInUser)
        identity = np.frombuffer(ImageEncoding,dtype=np.float32)
        candidateIdentity = get_embeddings(["./Images/Person.jpg"])
        self.MarkAttendance = is_match(identity,candidateIdentity)
        self.cap.release() #release video frame variables
        cv2.destroyAllWindows() #destroy the camera window and shut down the webcam
        self.MatchIdentity(ID,self.SubjectId,self.name)
    ##############################################################################################################
    ########################################## Subject Selection Page for marking attendance #####################
    ##############################################################################################################

    def MatchIdentity(self,ID,subjectID,name):
        self.main_frame.destroy()
        self.create_MainFrame()
        self.HeadingFrame = Frame(self.main_frame, height=100, width=650, bg="black")
        self.HeadingFrame.place(x=500, y=50)
        if self.MarkAttendance: #If identity has been matched and verified
            self.Heading = Message(self.HeadingFrame, font=self.InfoFont, fg="white", bg="black", width=500,
                                   justify=CENTER,
                                   text="Welcome " + name)

            self.Heading.place(x=0, y=0)
            self.ContentFrame = Frame(self.main_frame, height=100, width=750, bg="black")
            self.ContentFrame.place(x=400, y=100)
            self.InfoMessage = Message(self.ContentFrame, font=self.TextFont, fg="white", bg="black", width=600,
                                       justify=CENTER,
                                       text="Please select from the following subject whose attendance you have to mark")
            self.InfoMessage.place(x=0, y=10)
            self.SubjectsList = getSubjectList(subjectID)

            #Buttons for all the subject of that student
            self.ButtonFrame1 = Frame(self.main_frame,bg="black",height=50,width=200)
            self.ButtonFrame1.place(x=200,y=350)
            self.SubButton1 = Button(self.ButtonFrame1, text=str(self.SubjectsList[0]), fg="black", bg="white", bd=3,
                                     activebackground="grey", font=self.ButtonFont,
                                     height=1, width=8,
                                     command=lambda: self.MarkInDatabase(str(self.SubjectsList[0]), ID),
                                     justify=CENTER)
            self.SubButton1.place(x=0, y=0)

            self.ButtonFrame2 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame2.place(x=400, y=350)
            self.SubButton2 = Button(self.ButtonFrame2, text=str(self.SubjectsList[1]), fg="black", bg="white", bd=3,
                                     activebackground="grey", font=self.ButtonFont,
                                     height=1, width=6,
                                     command=lambda: self.MarkInDatabase(str(self.SubjectsList[1]), ID),
                                     justify=CENTER)
            self.SubButton2.place(x=0, y=0)

            self.ButtonFrame3 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame3.place(x=600, y=350)
            self.SubButton3 = Button(self.ButtonFrame3, text=str(self.SubjectsList[2]), fg="black", bg="white", bd=3,
                                     activebackground="grey", font=self.ButtonFont,
                                     height=1, width=6,
                                     command=lambda: self.MarkInDatabase(str(self.SubjectsList[2]), ID),
                                     justify=CENTER)
            self.SubButton3.place(x=0, y=0)

            self.ButtonFrame4 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame4.place(x=800, y=350)
            self.SubButton4 = Button(self.ButtonFrame4, text=str(self.SubjectsList[3]), fg="black", bg="white", bd=3,
                                     activebackground="grey", font=self.ButtonFont,
                                     height=1, width=6,
                                     command=lambda: self.MarkInDatabase(str(self.SubjectsList[3]), ID),
                                     justify=CENTER)
            self.SubButton4.place(x=0, y=0)
            if int(subjectID) < 5: #If subjectID is <5 meaning student is in 1st/2nd year according to database
                self.ButtonFrame5 = Frame(self.main_frame, bg="black", height=50, width=150)
                self.ButtonFrame5.place(x=1000, y=350)
                self.SubButton5 = Button(self.ButtonFrame5, text=str(self.SubjectsList[4]), fg="black", bg="white",
                                         bd=3,
                                         activebackground="grey", font=self.ButtonFont,
                                         height=1, width=6,
                                         command=lambda: self.MarkInDatabase(str(self.SubjectsList[4]), ID),
                                         justify=CENTER)
                self.SubButton5.place(x=0, y=0)

            self.ButtonFrame6 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame6.place(x=500, y=450)

            self.BackButton = Button(self.ButtonFrame6, text="Back", activebackground="grey", bd=3, bg="White",fg="Black",
                                     command=self.CheckMarkButton, font=self.ButtonFont, justify=CENTER, height=1, width=7)
            self.BackButton.place(x=0, y=0)

            self.ButtonFrame7 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame7.place(x=700, y=450)
            self.ExitButton = Button(self.ButtonFrame7, text="Exit", activebackground="grey", bd=3, bg="White",
                                     fg="Black",
                                     command=exit, font=self.ButtonFont, justify=CENTER, height=1, width=7)
            self.ExitButton.place(x=0, y=0)

        else: #If identity is matched and not verified
            self.Heading = Message(self.HeadingFrame, font=self.InfoFont, fg="white", bg="black", width=600,
                                   justify=CENTER,
                                   text="Stay Out! Not {}".format(name))
            self.Heading.place(x=0, y=0)
            self.ButtonFrame1 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame1.place(x=500, y=350)
            #Give user a chance to capture his image again using webcam
            self.TryAgain = Button(self.ButtonFrame1,text="Try Again",fg="black", bg="white", bd=3,
                                     activebackground="grey", font=self.ButtonFont,height=1, width=6,
                                     command=self.MarkAttendancePage,justify=CENTER)
            self.TryAgain.place(x=0,y=0)

            self.ButtonFrame6 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame6.place(x=700, y=350)

            self.BackButton = Button(self.ButtonFrame6, text="Back", activebackground="grey", bd=3, bg="White",
                                     fg="Black",
                                     command=self.CheckMarkButton, font=self.ButtonFont, justify=CENTER, height=1,
                                     width=7)
            self.BackButton.place(x=0, y=0)

            self.ButtonFrame7 = Frame(self.main_frame, bg="black", height=50, width=150)
            self.ButtonFrame7.place(x=900, y=350)
            self.ExitButton = Button(self.ButtonFrame7, text="Exit", activebackground="grey", bd=3, bg="White",
                                     fg="Black",
                                     command=exit, font=self.ButtonFont, justify=CENTER, height=1, width=7)
            self.ExitButton.place(x=0, y=0)


    def MarkInDatabase(self,subject,ID):
        #Call MarkInDatabase function from HelperFunctions to mark the attendance
        self.Message = MarkInDatabase(subject,ID)  #Return message from the function
        self.ContentFrame.destroy()
        self.HeadingFrame.destroy()
        self.ContentFrame = Frame(self.main_frame, height=200, width=750, bg="black")
        self.ContentFrame.place(x=400, y=50)
        #Display the returned message
        self.Heading = Message(self.ContentFrame,font=self.InfoFont,fg="white",bg="black",width=600,justify=CENTER,
                               text=self.Message + "\nPlease choose any other options now")
        self.Heading.place(x=0,y=0)

    ##############################################################################################################
    ############################################# Check Attendance Page ##########################################
    ##############################################################################################################

    def Check_AttendancePage(self):
        self.main_frame.destroy()
        self.create_MainFrame()

        self.content_frame = Frame(self.root, height=220, width=450, bg="Black")
        self.content_frame.place(x=600, y=80)
        self.ButtonFrame = Frame(self.main_frame, bg="black", height=450, width=500)
        self.ButtonFrame.place(x=680, y=300)

        self.SelectSubject = Label(self.content_frame, text="Select subject :", bg="black", justify=RIGHT,fg="white",font=self.TextFont)
        self.SelectSubject.place(x=110, y=70)
        self.InfoFrame = Frame(self.content_frame,height=90,width=430,bg="black")
        self.InfoFrame.place(x=120,y=130)

        #Get subject ID and ID from database
        self.loggedInUser = ifActive()
        ID,self.SubjectId,ImageEncoding,self.name = getInfo(self.loggedInUser)
        self.ClickedSubject = StringVar(self.content_frame)
        self.ClickedSubject.set("Select") #By default no subject is selected
        # Dictionary that returns a dictionary with subjectId as key and list of subjects as values
        self.SubjectIdList = getSubjectList(self.SubjectId)
        if int(self.SubjectId) < 5:
            self.SubjectEnter = OptionMenu(self.content_frame, self.ClickedSubject, self.SubjectIdList[0], self.SubjectIdList[1],
                                           self.SubjectIdList[2], self.SubjectIdList[3], self.SubjectIdList[4])
        else:
            self.SubjectEnter = OptionMenu(self.content_frame, self.ClickedSubject, self.SubjectIdList[0],  self.SubjectIdList[1],
                                           self.SubjectIdList[2], self.SubjectIdList[3])
        self.SubjectEnter.config(bg="Black", fg="White")
        self.SubjectEnter.place(x=340, y=70)

        self.SideImage = ImageTk.PhotoImage(file="Images/DisplayAttendance.jpg")
        self.SideLabel = Label(self.main_frame,image=self.SideImage)
        self.SideLabel.place(x=20,y=230)
        self.OverallAttendance = Button(self.ButtonFrame, text="Overall attendance", activebackground="grey", bd=3,
                                        bg="White", fg="Black", font=self.ButtonFont, justify=CENTER, height=1, width=21,
                                        command=self.TotalAttendance)
        self.OverallAttendance.place(x=0, y=0)

        self.ThisMonthAttendance = Button(self.ButtonFrame, text="This month's attendance", activebackground="grey",
                                          bd=3, bg="White", fg="Black", font=self.ButtonFont, justify=CENTER, height=1,
                                          width=21, command=lambda: self.Attendance(month="Current"))
        self.ThisMonthAttendance.place(x=0, y=100)

        self.LastMonthAttendance = Button(self.ButtonFrame, text="Last month's attendance", activebackground="grey",
                                          bd=3, bg="White", fg="Black", font=self.ButtonFont, justify=CENTER, height=1,
                                          width=21, command=lambda: self.Attendance("Last"))
        self.LastMonthAttendance.place(x=0, y=200)

        self.BackButton_Check = Button(self.ButtonFrame, text="Back", activebackground="grey", bd=3, bg="White",
                                       fg="Black", font=self.ButtonFont, justify=CENTER, height=1, width=8,
                                       command=self.CheckMarkButton)
        self.BackButton_Check.place(x=0, y=300)

    def TotalAttendance(self):
        #Function for displaying overall attendance of a subject
        self.subject = self.ClickedSubject.get()
        if self.subject == "Select": #If not subject is selected return a error
            self.Info = Message(self.InfoFrame,text="Please select a Subject",font=self.InfoFont,fg="white",
                                bg="black",width=400,justify=CENTER)
            self.Info.place(x=0,y=0)
        else: #If a subject is selected
            self.Date = datetime.datetime.now() #Get current date
            self.AttendanceFrame = Frame(self.main_frame, height=225, width=380, bg="white")
            self.AttendanceFrame.place(x=100, y=300)
            self.InfoFrame.destroy()
            self.loggedInUser = ifActive()
            ID,self.SubjectId,ImageEncoding,self.name = getInfo(self.loggedInUser)
            #Get the overall attendance from the database by calling this function from HelperFunctions
            self.MonthPresent, self.MonthTotal, self.AttendancePercent = DatabaseAttendance(self.Date.month, self.Date.year,
                                                                                            self.subject,ID)
            #If the return value is not false , i.e. there are some attendance records
            if self.MonthTotal:
                text = "Your overall attendance for the subject {} is {}/{} which is {}%".format(self.subject,self.MonthPresent,self.MonthTotal,self.AttendancePercent)
            else: #If return value is False, i.e. not attendance record
                text = "No attendance found for this subject!"
            self.AttendanceDisplay = Message(self.AttendanceFrame,font=self.InfoFont,fg="black",bg="white",width=350,justify=CENTER,
                                             text=text)
            self.AttendanceDisplay.place(x=0,y=0)

    def Attendance(self,month="Current"):
        #Function for displaying this month and last month's attendance
        self.subject = self.ClickedSubject.get()
        if self.subject == "Select": #return error if no subject is selected
            self.Info = Message(self.InfoFrame,text="Please select a Subject",font=self.InfoFont,fg="white",
                                bg="black",width=400,justify=CENTER)
            self.Info.place(x=0,y=0)

        else:
            self.Date = datetime.datetime.now() #get current date
            self.AttendanceFrame = Frame(self.main_frame, height=225, width=380, bg="white")
            self.AttendanceFrame.place(x=100, y=300)
            self.InfoFrame.destroy()
            self.loggedInUser = ifActive()
            ID,self.SubjectId,ImageEncoding,self.name = getInfo(self.loggedInUser)
            if month == "Current": #to display this month's attendance
                self.Date_month = self.Date.month
                self.MonthPresent,self.MonthTotal, self.AttendancePercent = DatabaseAttendance(self.Date_month,self.Date.year,self.subject,ID,"Current")
            else: #to display previous month's attendance
                self.Date_month = self.Date.month-1 if self.Date.month>1 else 12 
                self.MonthPresent,self.MonthTotal,self.AttendancePercent = DatabaseAttendance(self.Date_month,self.Date.year,self.subject, ID,"Last")
            if self.MonthTotal: #If return value is not False and record exists
                text = "Your attendance for the month {} and subject {} is {}/{} which is {}%".format(self.Date_month,self.subject,self.MonthPresent,self.MonthTotal,self.AttendancePercent)
            else: #If no record exists and return value is false
                text = "No attendance found for this month in this subject."
            self.AttendanceDisplay = Message(self.AttendanceFrame,font=self.InfoFont,fg="black",bg="white",width=350,justify=CENTER,
                                             text=text)
            self.AttendanceDisplay.place(x=0,y=0)

    ###################################################################################################################
    ############################################## About Page #########################################################
    ###################################################################################################################

    def AboutPage(self):
        #About the developer of the Project
        self.content_frame.destroy() #Just destroy the content frame as the heading is needed
        self.content_frame = Frame(self.main_frame, height=350, width=700, bg="Black")
        self.content_frame.place(x=500, y=400)  # Place below heading
        self.about = "Attendance Manager \n\n This is an application that can mark as well as manage your attendance. It confirms your identity by opening your webcam and using our face recognition model to confirm your identity and automatically mark your attendance.Also you can check your previous attendance. \n This application is developed by Arjun Bajaj."
        self.AboutInfo = Message(self.content_frame,bg="Black",fg="White",font=self.TextFont,justify=CENTER,width=600,
                                 text=self.about)
        self.AboutInfo.place(x=0,y=0)
        self.BackButton = Button(self.content_frame, text="Back", activebackground="grey", bd=3, bg="White",fg="Black",
                                    command=self.FirstPage, font=self.ButtonFont, justify=CENTER, height=1, width=5)
        self.BackButton.place(x=400,y=300)

    def create_MainFrame(self,page="Any"):
        #Function to create the main frame of every page
        self.main_frame = Frame(self.root, height=800, width=1200)
        self.main_frame.place(x=0, y=0)
        self.BackgroundImage(self.main_frame,page)

    def BackgroundImage(self,frame,page="Any"):
        #Function for setting the background image of the app
        if page == "First": #set bg image with heading if the page is the first page
            self.bg_image = ImageTk.PhotoImage(file="Images/Background_Front.jpg")
        else: #set bg image without heading if the page is other than first page
            self.bg_image = ImageTk.PhotoImage(file="Images/Background.jpg")
        self.bg_label = Label(frame, image=self.bg_image)
        self.bg_label.place(x=0, y=0)


if __name__ == '__main__':
    AttendanceManager()
#Before executing code, Python interpreter reads source file and define few special variables/global variables.
#If the python interpreter is running that module (the source file) as the main program, it sets the special
# __name__ variable to have a value “__main__”. If this file is being imported from another module,
# __name__ will be set to the module’s name. Module’s name is available as value to __name__ global variable.
#Here our class DigitRecognizer script is being used as a module so its __name__ is __main__
