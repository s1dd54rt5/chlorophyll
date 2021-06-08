# -*- coding: utf-8 -*-
"""Chlorophyll-API-flask.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1-5OfgecarJZpowR6jJH1lRYDWCOl-2cD
"""

from google.colab import drive
drive.mount('/content/drive')

cd /content/drive/MyDrive/Plant\ Disease\ Detection

# Import Libraries
import warnings
warnings.filterwarnings("ignore")

import os
import glob
import matplotlib.pyplot as plt
# Keras API
import keras
from keras.models import Sequential
from keras.layers import Dense,Dropout,Flatten
from keras.layers import Conv2D,MaxPooling2D,Activation,AveragePooling2D,BatchNormalization
from keras.preprocessing.image import ImageDataGenerator

!pip install flask_ngrok

from flask import Flask
from flask import request
from flask_ngrok import run_with_ngrok
import json
from keras.models import load_model
from keras.preprocessing import image
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
import glob
import matplotlib.pyplot as plt
# Keras API
import keras
from keras.models import Sequential
from keras.layers import Dense,Dropout,Flatten
from keras.layers import Conv2D,MaxPooling2D,Activation,AveragePooling2D,BatchNormalization
from keras.preprocessing.image import ImageDataGenerator

def prepare(img_path):
    img = image.load_img(img_path, target_size=(256, 256))
    x = image.img_to_array(img)
    x = x/255
    return tf.expand_dims(x, axis=0)

app = Flask(__name__)
run_with_ngrok(app)

UPLOAD_FOLDER = '/content/drive/MyDrive/Plant Disease Detection/uploads'

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route("/")
def hello():
    return "<a href='/upload'> Upload an Image </a>"

@app.route('/upload', methods=['GET', 'POST'])
def upload():
  if request.method == 'POST':
    file = request.files['file']
    file.save(os.path.join(app.config['UPLOAD_FOLDER'], file.filename))

    img_path = UPLOAD_FOLDER + '/' + file.filename

    print(img_path)

    # Loading model and predict.
    model=load_model('crop.h5')
    model.load_weights('crop_weights.h5')
    Classes = ["Tomato___Bacterial_spot","Tomato___Early_blight","Tomato___Late_blight","Tomato___Leaf_Mold","Tomato___Septoria_leaf_spot","Tomato___Spider_mites Two-spotted_spider_mite","Tomato___Target_Spot", "Tomato___Tomato_Yellow_Leaf_Curl_Virus", "Tomato___Tomato_mosaic_virus","Tomato___healthy"]

    result = model.predict_classes([prepare(img_path)])

    answer = Classes[int(result)]
    print(answer)
    return json.dumps({'result': answer})
  else:
     return '''
    <!doctype html>
    <title>Upload new File</title>
    <h1>Upload new File</h1>
    <form method=post enctype=multipart/form-data>
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    '''


if __name__ == "__main__":
  app.run()

