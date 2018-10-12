#TODO - option to color sig points
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# R ggplot2 function for making a QQ plot
#
# input: vector of p-values
# ggplot object
#
# author. github/asaffa
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

ggQQplot <- function(ps, ylim = c(0,5)) {
	
	N <- length(ps)
	df <- data.frame(observed=-log10(sort(ps)),
	                 trimmed=-log10(pmax(1/10^(ylim[2]),((sort(ps))))),
                     expected=-log10(ppoints(N)))

    #set shapes
    pch <- ifelse(df$trimmed >= ylim[2], 24, 21)
    #x and y labels
    xlab <- expression(paste("Expected -log"[10], plain(P)))
    ylab <- expression(paste("Observed -log"[10], plain(P)))
    
    #plot
    ggplot(df) +
           geom_point(aes(expected, trimmed), shape=pch, size=2) +
           scale_shape_manual(values=c(24,21)) +
           geom_abline(intercept=0, slope=1, alpha=0.5) +
           xlab(xlab) +
           ylab(ylab) +
           ylim(ylim[1],ylim[2]) +
           xlim(ylim[1],ylim[2])
}

