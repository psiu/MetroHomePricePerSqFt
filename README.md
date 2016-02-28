# Time Series Visualization of Metropolitan Home Prices

###Measured by the median sold price per square foot

<hr>

### Project Goal

When shopping for a home, most home buyers do not have a clear sense of the market price per square foot.  Having this metric allows buyers to quickly assess if the home is over or under priced after adjusting for other variables.

While it is possible to scrape this data together off several real estate websites, it is a very time consuming and manual process.  With Zillow opening their data API, this project will take the raw data one step further and visualize the information with a time series chart.

We hope to this interactive app will help home buyers get a quick sense of the median home price relative to square footage in various metropolitan areas.


### Data set sourced from Zillow:

* Original source (time sensitive):  http://files.zillowstatic.com/research/public/Metro/Metro_MedianSoldPricePerSqft_AllHomes.csv

* Archived copy of data set used(2/27/2016):  https://github.com/psiu/MetroHomePricePerSqFt/raw/master/Metro_MedianSoldPricePerSqft_AllHomes.csv


### Codebook

The data_processing.R script in this repository will perform the following:

1. Check if the data set exists, if not, download it from the archived source
2. Remove unnecessary columns
3. Rename columns for readability
4. Restructure data set to long format
5. Reclass Date column from character to date
6. Remove empty NA rows
7. Save the output to pricesqft.RDS to be consumed by the application and Rstudio presentation slides

The tidy data set contains three columns:

* **Metro**:  lists the metropolitan area in City, State format

* **Date**:  date of aggregrated measurement

* **Median**:  median price per square foot of homes sold in respect to the Metro and Date fields

With the clean data set in place, you may run the Shiny Application using the ui.R and server.R files or the presentation file Reproducible Pitch Presentation.Rpres

<hr>

### Link to presentation slides

http://rpubs.com/psiu/metrohomespricepersqft

### Link to application

https://psiu.shinyapps.io/MetroHomesPricePerSqFt/

<hr>

### Shiny Application Developed by:

Patrick Siu with the support of the Open Source Community and Coursera

<img src="linkedin icon.png" alt="https://www.linkedin.com/in/patrick-siu-65086a25">
<a href="https://www.linkedin.com/in/patrick-siu-65086a25">https://www.linkedin.com/in/patrick-siu-65086a25</a>




