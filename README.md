# Analysis of YouBike Rental Usage in Taipei City

### Motivation
I decided to revisit this project from nearly a decade ago due to recent projects requiring the use of the R language. Since the analytical tools involved are quite simple, I attempted to recreate the content of the previous report from memory. This serves as a refresher material for R language skills.

### Abstract
This report aims to analyze the rental situation of YouBike, a public bicycle rental system in urban areas, using the statistical software RStudio. By examining the number of rental stations, total bicycles available, and rental frequency, we hope to gain insights into the relationship between government policies and public usage.

### Background
In 2015, YouBike discontinued the 30-minute free riding offer, with officials estimating a 30% decrease in usage rates. Apart from the fee factor, are there other factors contributing to the decline in rental usage?

### Questions
1. As YouBike continues to expand, there should be a positive correlation between the number of stations and the average daily usage. However, with the implementation of fees, it is expected that this positive correlation will decrease over time.
   
2. Taipei City experiences many rainy days throughout the year. If there are outliers in the data for vehicle usage, can these be explained by the number of rainy days in a month? If so, there should be a significant correlation between the two.

### Results
1. Data from before charging (2012/12~2015/3) shows a positive correlation between the number of YouBike stations and the usage frequency.
   ![befoer_charge.png](https://github.com/winterdrive/youbike_2015/blob/main/assets/before_charging.png)
2. Data from after charging (2015/4~2016/4) shows a negative correlation due to the significant impact on rental usage in the first few months after the fee implementation.
   ![after_charge.png](https://github.com/winterdrive/youbike_2015/blob/main/assets/after_charge.png)
3. Both the number of rainy days and vehicle usage do not deviate significantly from a normal distribution. While outliers show reasonable trends when compared with meteorological data, there is no significant correlation observed between the proportion of rainy days in a month and vehicle usage.
    ```
    Shapiro-Wilk normality test
    
    data:  RDN10$times
    W = 0.90098, p-value = 0.2949
    
    > # Correlation test
    > cor.test(RDN10$days, RDN10$times)
    
    	Pearson's product-moment correlation
    
    data:  RDN10$days and RDN10$times
    t = 1.1527, df = 6, p-value = 0.2929
    alternative hypothesis: true correlation is not equal to 0
    95 percent confidence interval:
     -0.3984189  0.8695611
    sample estimates:
          cor 
    0.4257993 
    ```


### Conclusion
The correlation test between the number of rainy days and vehicle usage suggests that there is no significant linear correlation between these variables. Therefore, we cannot conclude that rainy weather has a substantial impact on YouBike rental usage based on the provided data.
