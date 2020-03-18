## PROBLEM 1: Morphological Processing

Given a binary image ![](http://latex.codecogs.com/gif.latex?I_1) as shown in Fig. 1. White pixels represent the objects and black pixels represent the background. Please follow the instructions below to create several new images and describe the method in detail for each case.
- ![](http://latex.codecogs.com/gif.latex?I_1)
<img src="https://i.imgur.com/tkMOf9T.png" width="40%">


(a) Perform boundary extraction on ![](http://latex.codecogs.com/gif.latex?I_1) to extract the objects’ boundaries and output the result as image B. Please provide some discussions about image B.
- B
<img src="https://i.imgur.com/iQ8VIXb.png" width="40%">

(b) Please design an algorithm to count the number of objects in ![](http://latex.codecogs.com/gif.latex?I_1) based on
morphological processing.

### Two-pass Connected-Component Labeling
- First pass
    1. Iterate through each pixel of the image by column, then by row
    2. If the pixel is not the background
        A. If there are no neighbors, uniquely label the current pixel
        B. Otherwise, find the neighbor with the smallest label and assign it to the current pixel, and store the equivalence between neighboring labels
- Second pass
    1. Iterate through each pixel of the image by column, then by row
    2. If the pixel is not the background
        A. Relabel the pixel with the lowest equivalent label

(c) Perform skeletonizing on ![](http://latex.codecogs.com/gif.latex?I_1) and output the result as image S. Please provide some discussions about image S.
- S
<img src="https://i.imgur.com/LQzwKUS.png" width="40%">

## PROBLEM 2: Texture Analysis
An image ![](http://latex.codecogs.com/gif.latex?I_2) which is composed of several different textures is given in Fig. 2.
- ![](http://latex.codecogs.com/gif.latex?I_2)
<img src="https://i.imgur.com/OT9cBxu.png" width="40%">

(a) Perform Law’s method on ![](http://latex.codecogs.com/gif.latex?I_2) to segment the image into 3 different texture groups. Label the pixels of the same texture group with same intensity values. Please detail the method you choose, specify all the parameters and output the result as K.

### Law's method
- Step I: Convolution
![](https://i.imgur.com/OnvijQK.png)
- Step II: Energy Computation
![](https://i.imgur.com/OBAfMty.png)
- Given 9 feature sets, T1, T2, T3, ..., T9
- Texture space -> 9 dimensional
- Use K-means algorithm to handle unsupervised classification problem

### K-means algorithm
- Initialization
    - Select k vectors as the initial centroids
- Do the following iterations
    - Step I: Form k clusters using the NN rule
    - Step II: Re-compute the centroid of each cluster

### Experiment
- window size = 11
<img src="https://i.imgur.com/001Pvrg.png" width="80%">
- window size = 31
<img src="https://i.imgur.com/mjSoiMw.png" width="80%">
- window size = 41
<img src="https://i.imgur.com/9II4RyE.png" width="80%">
- window size = 51
<img src="https://i.imgur.com/Z2pKdJG.png" width="80%">

(b) Based on K, try to generate another texture image by exchange the types of
different texture patterns.
### Image quilting by Efros & Freeman
- Step I: Tile the new texture image with blocks taken randomly from input texture. 
- Step II: For every location, search the input texture for the block that have the least SSD(Sum of Squared Difference) for overlap region and input texture. 
- Step III: Compute the error surface between the newly chosen block and the old blocks at the overlap region. Find the minimum cost path along this surface and make that the boundary of the new block. Paste the block onto the texture.

### Experiment
- Texture 1
<img src="https://i.imgur.com/I7va68G.png" width="80%">
- Texture 2
<img src="https://i.imgur.com/jccYoV8.png" width="80%">
- Texture 3
<img src="https://i.imgur.com/5O4sREc.png" width="80%">

### Exchange the type of different textures
<img src="https://i.imgur.com/N5SoEed.png" width="80%">

## Bonus
Given an image ![](http://latex.codecogs.com/gif.latex?I_3) shown in Fig. 3, please try to produce an image as illustrated in Fig. 4 by adopting appropriate morphological processing. Please describe the designed algorithm in detail and provide some discussions.

<img src="https://i.imgur.com/SzrYhRY.png" width="80%">  

### Experiment
- Step I: Erosion (window size = 9)
![](https://i.imgur.com/3XdqxTB.png)


- Step II: Dilation (window size = 11)
![](https://i.imgur.com/aXWICQI.png)


- Step III: Median Filter (window size = 7)
![](https://i.imgur.com/oYcs4uK.png)


- Step IV: Dilation (window size = 3)
![](https://i.imgur.com/XFODdz1.png)


- Step V: Median Filter (window size = 11)
![](https://i.imgur.com/Qp4ZsNJ.png)
