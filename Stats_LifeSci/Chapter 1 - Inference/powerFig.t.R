# Figure 7.1 from Behavioral Research Data Analysis with R by Yuelin Li and Baron
# X11(width = 6.5, height = 4.5)
# pdf(file = "powerFigt.pdf", width=6.5, height=4.5, paper = "special")
par(mar = c(3.1, 0.2, 1.6, 0.1))
xmax <- 6.5
x1 <- seq(-3, 3, length=100)
m1 <- 0                       # H0
y1 <- dt(x1, df=98)

x2 <- seq(-3, xmax, length=100)
m2 <- 0.5                     # Ha
ncp <- (m2 - m1) / sqrt(1/50 + 1/50)
y2 <- dt(x2, df=98, ncp = ncp)
tu <- qt(0.975, df = 98)
tl <- qt(0.025, df = 98)

plot(c(-3, xmax), c(0, max(y1)), xlab="", ylab="", 
     axes=F, type="n")
# upper tail of shaded tail probabilities in H0
xx <- seq(qt(0.975, df=98), max(x1), length=100)
yy <- dt(xx, df = 98)
xx <- c(xx[1], xx[1], rep(xx[2:(length(xx)-1)], 
      each=4), xx[length(xx)], xx[length(xx)])
yy <- c(0, rep(t(cbind(yy[1:(length(yy)-1)], 0)),
      each=2))
yy <- yy[-length(yy)]
polygon(x = xx, y = yy, density = -1, border = NA, 
        col = "grey")
# lower tail
xx <- seq(from = min(x1), to=qt(0.025, df=98), 
      length = 100)
yy <- dt(xx, df = 98)
xx <- c(xx[1], xx[1], rep(xx[2:(length(xx)-1)], 
      each=4), xx[length(xx)], xx[length(xx)])
yy <- c(0, rep(t(cbind(yy[1:(length(yy)-1)], 0)), 
      each=2))
yy <- yy[-length(yy)]
polygon(x=xx, y=yy, density=-1, border=NA, 
        col="grey")
lines(x1, y1, col = "black", lwd = 3)
abline(v = m1, lty = 2)
# statistical power
xx <- seq(from = tu, to = xmax, length = 200) # from tu and up
yy <- dt(xx, df = 98, ncp = ncp)
xx <- c(xx[1], xx[1], rep(xx[2:(length(xx)-1)], 
      each=4), xx[length(xx)], xx[length(xx)])
yy <- c(0, rep(t(cbind(yy[1:(length(yy)-1)], 0)), 
      each=2))
yy <- yy[-length(yy)]
polygon(x=xx, y=yy, density=5, border=NA, 
      col="grey55")
lines(x2, y2, col = "black", lwd = 3)
abline(v = ncp, lty = 2)
# labels on the x-axis
abline(h = 0)
abline(v = qt(c(.025, .975), df = 98))
mtext(expression(t[u]), at = tu, adj = 0, line=0, cex = 1.5)
mtext(expression(t[l]), at = tl, adj = 0, line=0, cex = 1.5)

mtext(bquote(delta[0] == .(m1)), side = 1, at = m1, 
      line=2, cex=2.0)
mtext(expression(delta[a] == 0.5), side = 1, at = ncp, 
      line=2, cex=2.0)
pow <- 1 - pt(tu, df = 98, ncp = ncp)
text(paste("power =", round(pow, 3)), x = 5.5, 
     y = max(y2)/4, adj=1, cex=1.5, col="black")

# graphics.off()
rm(x1, m1, y1, x2, m2, y2, xx,yy, ncp, tu, tl)
