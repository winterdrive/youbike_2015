# Set working directory
setwd("your_repository_path")

# Load data for uncharged bikes
bike_uncharged <- read.delim("bikeR1.txt", row.names = NULL)
bike_uncharged.reg <- lm(times ~ station, data = bike_uncharged)

# Load data for charged bikes
bike_charged <- read.delim("bikeR2.txt", row.names = NULL)
bike_charged.reg <- lm(times ~ station, data = bike_charged)

# Plot uncharged bike data
plot(times ~ station, data = bike_uncharged, pch = 16, col = "firebrick", las = 1, cex = 0.75, bty = "l", 
     xlim = c(45, 200), ylim = c(9000, 75000), ylab = "Times", xlab = "Stations", 
     main = "Before YouBike Charging (2012/12~2015/3)")


# Prediction for uncharged bikes
xpt_uncharged <- seq(min(bike_uncharged$station), max(bike_uncharged$station), 2)
ypt_uncharged <- predict(bike_uncharged.reg, newdata = data.frame(station = xpt_uncharged), interval = "confidence")
lines(ypt_uncharged[, "fit"] ~ xpt_uncharged, lwd = 1.5)
lines(ypt_uncharged[, "lwr"] ~ xpt_uncharged, lwd = 1.5, lty = 2) 
lines(ypt_uncharged[, "upr"] ~ xpt_uncharged, lwd = 1.5, lty = 2)

# Diagnostic plot for uncharged bikes
plot(bike_uncharged.reg, which = 1, main = "Outliers: Dec 2013, Feb 2014, Oct 2014")

# Plot charged bike data
plot(times ~ station, data = bike_charged, pch = 16, col = "firebrick", las = 1, cex = 0.75, bty = "l", 
     xlim = c(195, 235), ylim = c(35000, 56000), ylab = "Times", xlab = "Stations", 
     main = "After YouBike Charging (2015/4~2016/4)")

# Prediction for charged bikes
xpt_charged <- seq(min(bike_charged$station), max(bike_charged$station), 2)
ypt_charged <- predict(bike_charged.reg, newdata = data.frame(station = xpt_charged), interval = "confidence")
lines(ypt_charged[, "fit"] ~ xpt_charged, lwd = 1.5)
lines(ypt_charged[, "lwr"] ~ xpt_charged, lwd = 1.5, lty = 2) 
lines(ypt_charged[, "upr"] ~ xpt_charged, lwd = 1.5, lty = 2)

# Diagnostic plot for charged bikes
plot(bike_charged.reg, which = 1, main = "Outliers: Aug 2015, Jan 2016, Apr 2014")

# Check distribution of charging data
bike196R <- read.delim("bike196R.txt", row.names = NULL)
boxplot(bike196R$times, ylab = "Times", main = "Data after Charging (2015/4~2015/11)\nOutliers: Aug 2015", las = 1)

# Rainy day and riding times correlation and regression test
RDN10 <- read.delim("RDN10.txt", row.names = NULL)
# Shapiro-Wilk test for normality
shapiro.test(RDN10$days)
shapiro.test(RDN10$times)
# Correlation test
cor.test(RDN10$days, RDN10$times)
# Linear regression
RDN10.reg <- lm(days ~ times, data = RDN10)
# Plot and summary
plot(RDN10$days ~ RDN10$times, las = 1, cex = 1, pch = 16, col = "blue", xlab = "Times", ylab = "Percentage", 
     main = "Low Correlation between Rainy Days and Biking Times")
summary(RDN10.reg)
