## PROBLEM 1: EDGE DETECTION
(a) Given an image ![](http://latex.codecogs.com/gif.latex?I_1) as show in Fig. 1(a), please perform 1st order edge detection, 2nd order edge detection, and Canny edge detection to obtain corresponding edge maps. Please describe each method in detail, specify each parameter clearly and discuss how each of them affects the resultant edge map. What are pros and cons of each method? [Please output the edge points with intensity value 1 and background points with intensity value 0.]
- ![](http://latex.codecogs.com/gif.latex?I_1)：
<img src="https://i.imgur.com/LkfFHkL.png" width = "30%">

- 1st & 2nd order threshold = 40  
Canny low threshold = 30, high threshold = 70  
![](https://i.imgur.com/Y1Y3SGp.png)
- 1st & 2nd order threshold = 60  
Canny low threshold = 50, high threshold = 100  
![](https://i.imgur.com/HK9YOii.png)
- 1st & 2nd order threshold = 80  
Canny low threshold = 70, high threshold = 120  
![](https://i.imgur.com/TRJpD1B.png)
- 1st & 2nd order threshold = 100  
Canny low threshold = 90, high threshold = 140  
![](https://i.imgur.com/yiKUX2H.png)

(b) Given an image ![](http://latex.codecogs.com/gif.latex?I_2) with periodic noise as shown in Fig. 1(b), please design your own method to generate the edge map by avoiding obtaining edges of the noise. [Please output the edge points with intensity value 1 and background points with intensity value 0.]
- ![](http://latex.codecogs.com/gif.latex?I_2)：
<img src="https://i.imgur.com/hJ4QOuY.png" width="30%">
- 1st order edge detection
<img src="https://i.imgur.com/k1RnkNZ.png" width="80%">

## PROBLEM 2: GEOMETRICAL MODIFICATION
Given an image ![](http://latex.codecogs.com/gif.latex?I_3) as shown in Fig. 2(a).

(a) Please perform edge crispening on ![](http://latex.codecogs.com/gif.latex?I_3) and denote the result as C. Show the parameters adopted and provide some discussions on the result as well.
<img src="https://i.imgur.com/u5LEic1.png" width="80%">

(b) Please design a warping function to convert the image C to image D with a shape similar to Fig. 2(b).
<img src="https://i.imgur.com/eP8bO0H.png" width="80%">
<img src="https://i.imgur.com/z0WvfJ6.png" width="40%">
