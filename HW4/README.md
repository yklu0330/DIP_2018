## PROBLEM 1: Optical Character Recognition (OCR)

Please design an algorithm to recognize the CAPTCHA images as shown in Fig. 1. The training set is given in Fig. 2. Please describe the proposed algorithm in detail along with a flowchart and discuss the recognition results.

![](https://i.imgur.com/XcfQUIp.png)


> I. 先將training set和testing set圖中每個字的bounding box找出來  
> II. 將testing set的字分別和每個training set的字比較  
    >> 1. 先比較寬高比：如果相差大於0.2，視為不可能為該字，直接跳過  
    >> 2. 將training set的字大小縮放到和testing set相同  
    >> 3. 將testing set的每個pixel和training set對應的pixel值比較  
        >>> - 設一個初始分數0，如果兩邊的pixel值相同，分數加一;如果不同，分數減一    

> III. training set中分數最高的字即為最後的預測結果  

