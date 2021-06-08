## The jupyter file models `.ipynb` are converted into `.py` python file and can be accessed here

- Colab File for CNN Model : [Link](https://colab.research.google.com/drive/1Sd0dBPtvXcR_Y214gmZjYosWkAQ46RXn?usp=sharing)
- Colab File for Flask API using Ngrok: [Link](https://colab.research.google.com/drive/1-5OfgecarJZpowR6jJH1lRYDWCOl-2cD?usp=sharing)

# Model Explanation: 

Simple Neural Nets are good at learning the weights with one hidden layer which is in between the input and output layer. But, it’s not good at complex feature learning.
On another hand Deep Learning Neural Nets, the series of layers between input and output layer are called hidden layers that can perform identification of features and creating new series of features from data, just as our brain.
![image](https://user-images.githubusercontent.com/59837325/121161747-ed677100-c86a-11eb-8b6c-8cb8c16eb459.png)

# CNN
For implementation of our problem statement we decided to use CNN. Why Convolutional Neural Network(CNN or Conv Nets)? It is well known for its widely used in applications of image and video recognition and also in recommender systems and Natural Language Processing(NLP). However, convolutional is more efficient because it reduces the number of parameters which makes different from other deep learning models.

![image](https://user-images.githubusercontent.com/59837325/121161981-1ee03c80-c86b-11eb-9279-1a1d76361fe8.png)


# CNN Layers Explanation

* Convolution Operation
* ReLU Layer (Rectified Linear Unit)
* Pooling Layer (Max Pooling)
* Flattening
* Fully Connected Layer

1. **Convolution** is the first layer to extract features from the input image and it learns the relationship between features using kernel or filters with input images.
2. **ReLU Layer:** ReLU stands for the Rectified Linear Unit for a non-linear operation. The output is ƒ(x) = max(0,x). we use this because to introduce the non-linearity to CNN.
3. **Pooling Layer:** it is used to reduce the number of parameters by downsampling and retain only the valuable information to process further. There are types of Pooling:
Max Pooling (Choose this).
Average and Sum pooling.
4. **Flattening:** we flatten our entire matrix into a vector like a vertical one. so, that it will be passed to the input layer.
5. **Fully Connected Layer:** we pass our flatten vector into input Layer .we combined these features to create a model. Finally, we have an activation function such as softmax or sigmoid to classify the outputs.

# To run the API

* Import the `crop.h5` and `crop_weights.h5` file from [Drive Link](https://drive.google.com/drive/folders/1sioFJLKdCGYm5QW74HfBPbYsEYeCuwvm?usp=sharing) and mount your drive
* And run all the cells
* Visit the ngrok generated link to access the Flask API
* We use POST requests and take prediction Data from API and integrate it with Flutter App
