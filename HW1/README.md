## WARM-UP
- Please convert the given color image *I1* as shown in Fig.1 to a gray-level one. Please also perform diagonal flipping on it and output the result as B.

![](https://i.imgur.com/QK3vQYr.png)

## PROBLEM 1: IMAGE ENHANCEMENT
Given an image *I2* as shown in Fig. 2. Please follow the instructions below to create several new images.

(a) Decrease the brightness of *I2* by dividing the intensity values by 3 and output the
image as D.  
![](https://i.imgur.com/fvd2CsZ.png)

(b) Plot the histograms of *I2* and D. What can you observe from these two histograms?  
![](https://i.imgur.com/xi4VlvG.png)

(c) Perform histogram equalization on D and output the result as H.  
![](https://i.imgur.com/vvG6d63.png)

(d) Perform local histogram equalization on image D and output the result as L.
![](https://i.imgur.com/3XASZ79.png)

(e) Plot the histograms of H and L. What’s the main difference between local and global histogram equalization?
![](https://i.imgur.com/GluSrNo.png)

(f) Perform the log transform, inverse log transform and power-law transform to enhance image D. Please adjust the parameters to obtain the results as best as you can. Show the parameters, resultant images and corresponding histograms. Provide some discussions on the results as well.
- log transform
![](https://i.imgur.com/qph91UK.png)
- inverse log transform
![](https://i.imgur.com/FrkzSt7.png)
- power-law transform
![](https://i.imgur.com/B948Bha.png)

## PROBLEM 2: NOISE REMOVAL
Given an image $I_{3}$ as shown in Fig. 3(a), please follow the instructions below to create some new images.

(a) Please generate two noisy images $G_{1}$, and $G_{2}$ by adding Gaussian noise to with different parameters. What’s the main difference between these two images?
![](https://i.imgur.com/NbXBRT0.png)
<img src="https://i.imgur.com/SfQ6rMg.png" width = "45%">

(b) Please generate two noisy images $S_{1}$, and $S_{2}$ by adding salt-and-pepper noise to $I_{3}$ with different parameters. What’s the main difference between these two images?
![](https://i.imgur.com/tfv92e6.png)

(c) Design proper filters to remove noise from $G_{1}$ and $S_{1}$, and denote the resultant images as $R_{G}$ and $R_{S}$, respectively. Please detail the steps of the denoising process and specify corresponding parameters. Provide some discussions about the reason why those filters and parameters are chosen.
- Mean filter
![](https://i.imgur.com/57xBhHc.png)
- Median filter
![](https://i.imgur.com/UNOWvUC.png)

(d) Compute the PSNR values of $R_{G}$ and $R_{S}$ and provide some discussions.
- $G_{1}$和原圖的PSNR = 24.6697
- $R_{G}$和原圖的PSNR = 26.0043
- $S_{1}$和原圖的PSNR = 22.2492
- $R_{S}$和原圖的PSNR = 29.1792

Design your own method to remove the wrinkles on the face of a given image I+ as shown in Fig. 3(b) and make it as pretty as you can. Please describe the steps of
your process in detail and provide some discussions as well.
- 利用mean filter進行濾波，window size設為9
![](https://i.imgur.com/k4lBXV8.png)
