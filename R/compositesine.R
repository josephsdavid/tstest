t <- seq(1,100, length = 100)
y1 <- sin(2*pi*.025*t)
y2 <- sin(2*pi*.1*t + 1)
y3 <- sin(2*pi*.15*t + 2.5)
lineplotter  <- function(x,y){
	plot(x,y,type = "l")
}

lineplotter(t,y1)
lineplotter(t,y2)
lineplotter(t,y3)
lineplotter(t,y1+y2+y3)
