## @knitr forecastfun
ar1forcastgen <- function(phi,mu){
	fun <- function(xprev,l=1){
		if (l==1)	return(phi*xprev + mu*(1-phi))
		else		return(phi*fun(xprev,l-1) + mu*(1-phi))
	}
	fun
}

## @knitr arpfun
arpgen <- function(vec,l,mu,phi){
	v <- vec[length(vec):(length(vec)-(length(phi)-1))]
	f <- sum(phi*(v)) + mu*(1-sum((phi)))
		if (l==1)	return(f)
	 		return(arpgen(append(vec,f),l-1,mu,phi))

}

arp <- function(vec,l,mu,phi){
	as.numeric(lapply(1:l, arpgen, phi = phi, vec = vec, mu = mu))
}

## @knitr tswarplus
data(fig6.1nf)
plotts.wge(fig6.1nf)
fore.arma.wge(fig6.1nf, phi = 0.8, n.ahead = 20, limits = F)

## @knitr tswarmin
ts100 <- tswgen(100, sn = 24) 
X1 <- ts100$sig(phi = -.8)
fore.arma.wge(fig6.1nf, phi = -0.8, n.ahead = 20, limits = F)

## @knitr tswar2
X2 <- ts100$sig(phi = c(1.6, -.8))
X2 <- X2 + 25
plotts.wge(X2)

fore.arma.wge(X2, phi = c(1.6, -.8), n.ahead = 20, limits =F)

## @knitr armapq

## TODO: figure out how to get this equation right, currently it is wrong
armagen <- function(vec,l,mu,phi,psi){
	v <- vec[length(vec):(length(vec)-(length(phi)-1))]
	f <- sum(phi*(v)) + mu*(1-sum((phi))) + mu*(1-sum(psi))
		if (l==1)	return(f)
	 		return(arpgen(append(vec,f),l-1,mu,phi,psi))
}

arm <- function(vec, l, mu, phi, psi){
	as.numeric(lapply(1:l, armagen,psi = psi, phi = phi, vec = vec, mu = mu))
}

armapq <- function(vec, l , mu, phi, psi){
	if (length(psi)==0)	return(arp(vec,l,mu,phi))
	else 			return(arm(vec, l, mu, phi, psi))
}

## @knitr tswarma
ts7524 <- tswgen(75, sn = 24)
p <- c(1.6, -.8)
thet <- (-.9)
x1 <- ts7524$arma(phi = p)

fore.arma.wge(x1, phi = p, n.ahead = 20, limits =F)

x2 <- ts7524$arma(phi = p, theta = thet)
fore.arma.wge(x2, phi = p, theta = thet, n.ahead = 20, limits =F)

## @knitr tswase

tswase <- function(vec,...,ahead){
	f <- fore.arma.wge(vec,..., n.ahead = ahead)
	ASE <- mean((f$f-vec[(length(vec)-(ahead-1)):(length(vec))])^2)
	res <- list('fore' = f,'ASE' = ASE)
	return(res)
}



