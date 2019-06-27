library(glue)
xbar <- function(xs){
	mean(xs)
}

ghat_zero <- function(xs){
	summand <- (xs - xbar(xs))^2
	mean(summand)
}

ghat_one <- function(xs) {
	lhs <- xs[1:(length(xs) - 1)] - xbar(xs)
	rhs <- xs[2:length(xs)] - xbar(xs)
	summand <- lhs * rhs
	summate <- sum(summand)
	summate/length(xs)

}
rhohat_zero <- 1
rhohat_one <- function(xs) {
	ghat_one(xs) / ghat_zero(xs)
}
v <- c(76,70,66,60,70,72,76,80)
xbar(v)
ghat_zero(v)
ghat_one(v)
rhohat_one(v)
paste('$\\frac{1}{n}\\sum{X_t}=\\bar{X} = ', xbar(v), "$", sep = "")

print_calc <- function(xs) {
	one <- paste('$\\frac{1}{n}\\sum{X_t}=\\bar{X} = ', xbar(xs), "$", sep = "")
	two <- paste('$\\frac{1}{n} \\sum{(X_t - \\bar{x})^2} = \\hat{\\gamma_0} =', ghat_zero(xs), sep = "")
	paste(one, two, sep = "\n")
}
print_calc(v)
