from re import sub
import tensorflow as tf
from matplotlib import pyplot
from PIL import Image
from numpy import asarray
from scipy.spatial.distance import cosine
from mtcnn.mtcnn import MTCNN
from keras_vggface.vggface import VGGFace
from keras_vggface.utils import preprocess_input
import numpy as np
import mysql.connector
import datetime
physical_devices = tf.config.experimental.list_physical_devices("GPU") #Check available GPUs
tf.config.experimental.set_memory_growth(physical_devices[0], True) #Allow expanding VRAM memory of GPU

def Connection():
    mydb = mysql.connector.connect(host="localhost",user="arjun",password="Arjun12@",database="AttendanceDB")
    mycur = mydb.cursor()
    return mydb,mycur


def ValidateInfo(name,roll,course,semester):
    if roll.startswith("0"):
        roll = roll[1:]
    mydb,mycur = Connection()
    sql = "select name,id,subjectID,identity from students where name='{}' and enrollmentNo={} and course='{}' and semester={}".format(name,roll,course,semester)
    mycur.execute(sql)
    result = list(mycur)
    if result:
        return True
    else:
        return False

def ActivateUser(rollNo):
    mydb,mycur = Connection()
    sql = "select id,name from students where enrollmentNo={}".format(rollNo)
    mycur.execute(sql)
    result = list(mycur)
    if result:
        studentID = result[0][0]
    mycur.execute("Insert into active (studentID) VALUES (%s)",(int(studentID),))
    mydb.commit()

def ifActive():
    mydb,mycur = Connection()
    mycur.execute("Select * from active")
    results = list(mycur)
    if results:
        return results[0][1]

def logout():
    mydb,mycur = Connection()
    mycur.execute("delete from active")
    mydb.commit()

def getInfo(id):
    mydb,mycur = Connection()
    sql = "select id,subjectID,identity,name from students where id={}".format(id) 
    mycur.execute(sql)
    results = list(mycur)
    return results[0][0],results[0][1],results[0][2],results[0][3]

# extract a single face from a given photograph
def extract_face(filename, required_size=(224, 224)):
	# load image from file
	pixels = pyplot.imread(filename)
	# create the detector, using default weights
	detector = MTCNN()
	# detect faces in the image
	results = detector.detect_faces(pixels)
	# extract the bounding box from the first face if exists
	if results:
		x1, y1, width, height = results[0]['box']
		
		x2, y2 = x1 + width, y1 + height
		# extract the face
		face = pixels[y1:y2, x1:x2]
		# resize pixels to the model size
		image = Image.fromarray(face)
		image = image.resize(required_size)
		face_array = asarray(image)
		return face_array
	else:
		return pixels
    
# extract faces and calculate face embeddings for the photo
def get_embeddings(filename):
	# extract faces
	faces = [extract_face(f) for f in filename]
	# convert into an array of samples
	samples = asarray(faces, 'float32')
	# prepare the face for the model, e.g. center pixels
	samples = preprocess_input(samples, version=2)
	# create a vggface model
	model = VGGFace(model='resnet50', include_top=False, input_shape=(224, 224, 3), pooling='avg')
	# perform prediction
	yhat = model.predict(samples)
	return yhat

# determine if a candidate face is a match for a known face
def is_match(known_embedding, candidate_embedding, thresh=0.3):
	# calculate distance between embeddings
	score = cosine(known_embedding, candidate_embedding)
	#If score is less than the threshold, it means the distance between embeddings is very small and it is a match
	if score <= thresh:
		return True
	else:
		return False

def getSubjectList(id):
    mydb,mycur = Connection()
    sql = "SELECT subjectList from subjectList where id = {}".format(id)
    mycur.execute(sql)
    results = list(mycur)
    if results:
        subList = results[0][0]
        subList = subList.split(",")
        return subList

def getSubjectId(subject):
    mydb,mycur = Connection()
    if subject[0] == " ":
        subjectt = subject[1:]
    else:
        subjectt = subject
    sql = "select id from subjects where name='{}' ".format(subjectt)
    mycur.execute(sql)
    results = list(mycur) 
    if results:
        subjectID = results[0][0]
        return subjectID


def MarkInDatabase(subject,ID):
    subjectID = getSubjectId(subject)
    mydb,mycur = Connection() 
    if subjectID:
        CurrentDate = datetime.datetime.now().strftime("%Y-%m-%d")
        sql = "select * from attendance where Date=(%s) and subjectID=(%s) and studentID=(%s)"
        val = (CurrentDate,subjectID,ID)
        mycur.execute(sql, val)
        if list(mycur):
            return "You have already marked your attendance for the subject {}.".format(subject)
        else:
            sql = "Insert into attendance (date,studentID,subjectID) VALUES (%s,%s,%s)"
            val = (CurrentDate,ID,subjectID)
            mycur.execute(sql,val)
            mydb.commit()
            return "Your attendance has been marked for the subject {}!".format(subject)

def DatabaseAttendance(month,year,subject,Id,Attendance="overall"):
    subjectID = getSubjectId(subject)
    mydb,mycur = Connection()
    if Attendance == "overall":
        sql1 = "Select date from attendance where studentID={} and subjectID={}".format(Id,subjectID)
        sql2 = "Select date from attendance where subjectID={} ".format(subjectID)
        mycur.execute(sql1)
        a = list(mycur)
        present = len(a)
        mycur.execute(sql2)
        b = list(mycur)
        total = len(b)
        if total > 0:
            percentage = (present / total) * 100
            return present, total, percentage
        else:
            return False, False, False
    else:
        from calendar import monthrange
        a = monthrange(year, month)[1]
        sql1 = "Select date from attendance where date>=(%s) and date<=(%s) and studentID='{}' and subjectID={}".format(Id,subjectID)
        sql2 = "Select date from attendance where date>=(%s) and date<=(%s) and subjectID={}".format(subjectID)
        val1= (str(year)+"-"+str(month)+"-01",str(year)+"-"+str(month)+"-"+str(a))
        mycur.execute(sql1,val1)
        a = list(mycur)
        present = len(a)
        mycur.execute(sql2,val1)
        b = list(mycur)
        total = len(b)
        if total>0:
            percentage = (present / total) * 100
            return present,total,percentage
        else:
            return False,False,False


