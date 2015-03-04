#Libraries

library(tseries)
library(fOptions)
library(lubridate)

###########
#Variables#
###########
#input_ticker<-"aapl hsy"

#start<-as.Date("2010/01/01", "%Y/%m/%d")
#end<-as.Date("2014/01/01", "%Y/%m/%d")
#tickers=c("aapl","hsy")

##########
#BASIC MV#
##########
  
  get_mv_graph<-function(input_ticker,start_date_raw,end_date_raw){
    tickers<-strsplit(input_ticker,split=" ")[[1]] 
    
    start_date<-as.Date(start_date_raw, "%Y-%m-%d")
    end_date<-as.Date(end_date_raw, "%Y-%m-%d")
    
    #set time series default
    #quote_1<-c("Open", "High", "Low", "Close", "AdjClose","Volume")
    quote_1<-"Close"
    a1_raw = as.data.frame(get.hist.quote(instrument=tickers[1],start= start_date,end = end_date, quote = quote_1, compression = "m", retclass = "ts"))
    a2_raw = as.data.frame(get.hist.quote(instrument=tickers[2],start= start_date,end = end_date, quote = quote_1, compression = "m", retclass = "ts"))    
    
    a1<-a1_raw[complete.cases(a1_raw),]
    a2<-a2_raw[complete.cases(a2_raw),]
    
    #Select only the close prices from each file:
    prices <- data.frame(a1,a2)
    
    #You can rename the Close prices as follows:
    names(prices) <-c("p1", "p2")
    
    #Convert the close prices into returns:
    r1 <- (prices$p1[-1]-prices$p1[-length(prices$p1)])/prices$p1[-1]
    r2 <- (prices$p2[-1]-prices$p2[-length(prices$p2)])/prices$p2[-1]
    
    #Place the returns together in a data frame:
    returns <- as.data.frame(cbind(r1,r2))
    
    #total returns
    total_returns <- paste(round(sapply(returns,sum)*100,digits=2),"%")
    
    setProgress(detail = input_ticker)
    #Sys.sleep(3)
    setProgress(detail = head(a1,3))
    #Sys.sleep(3)
    setProgress(detail = head(r1,3))
    #Sys.sleep(3)
    setProgress(detail = total_returns)
    #Sys.sleep(3)
    setProgress(detail = total_returns)
    
    #Get summary statistics of the returns:
    summary(returns)
    
    #Get the variance covariance matrix of the returns:
    cov(returns)
    
    #Create many portfolios (combinations of the two stocks):
    a <- seq(0,1,.01)

    #Or simply
    b <- 1-a
    
    #Compute the expected return of each portfolio:
    rp_bar <- a*mean(returns$r1)+b*mean(returns$r2)
    
    #Compute the variance and standard deviation of each portfolio:
    var_p <- a^2*var(returns$r1)+b^2*var(returns$r2)+2*a*b*cov(returns$r1,returns$r2)
    
    sd_p <- var_p^.5
    
    qq <- as.data.frame(cbind(sd_p, rp_bar))
    
    main_frame<-data.frame(tickers,total_returns)
    main_raw<-paste(tickers,"and")
    main_1<-paste(main_raw[-length(main_raw)],tickers[length(main_raw)])
    
    #If you want a line instead of points:
    plot(qq, xlab="Portfolio risk (standard deviation)",
         main=paste("Mean Variance Model for",main_1),  
         ylab="Expected return", type="l")
    #get the minimum variance 
    x1 <- (var(returns$r2)-cov(returns$r1,returns$r2))/
      (var(returns$r1)+var(returns$r2)-2*cov(returns$r1,returns$r2))
    x2 <- 1-x1
    rp_bar_min <- x1*mean(returns$r1)+x2*mean(returns$r2)
    sd_p_min <- (x1^2*var(returns$r1)+x2^2*var(returns$r2)+
                   2*x1*x2*cov(returns$r1,returns$r2))^0.5
    qqq <- qq[qq$rp_bar > rp_bar_min,]
    
    setProgress(detail = "Plotting")
    
    #And then draw the efficient frontier:
    points(qqq, col="blue", type="l", lwd=5)
    legend("bottomright",legend = "efficiency frontier",col="blue",lty=1,lwd=5)
    
    legend_frame<-data.frame(tickers,total_returns)
    legend_2<-paste(tickers,"total return:",total_returns)
    legend("topleft",legend = legend_2,col=rainbow(length(legend_2)))
    
  }
