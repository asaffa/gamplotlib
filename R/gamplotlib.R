require("ggplot2")
require("ggthemes")

colpalricht1 <- c("#FA980D","#0E7624","#F97E86","#0F7597","#B477AB",
                  "#834041","#6D6F72","#2C191F")

scale_fill_gamplotlib <- function(){
  structure(list(
    scale_fill_manual(values=colpalricht1)
  ))
}

scale_color_gamplotlib <- function(){
  structure(list(
    scale_color_manual(values=colpalricht1)
  ))
}

scale_color_gradient_gamplotlib <- function(){
    structure(list(
    scale_colour_gradient(low="#582B2C", high="#F97E86",
			  space="Lab", na.value="grey50", guide="colourbar")
  ))	
}

scale_fill_gradient_gamplotlib <- function(){
    structure(list(
    scale_fill_gradient(low="#582B2C", high="#F97E86",
			  space="Lab", na.value="grey50", guide="colourbar")
  ))	
}

theme_gamplotlib <- function(base_size = 10, base_family = "Helvetica", 
			     base_line_size = 0.5, base_rect_size = 0.5){

    half_line <- base_size / 2
	
    theme_bw(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size) %+replace%
    theme(
      # no background
      panel.border     = element_blank(),
      panel.grid.major = element_line(colour="#DEE3E9",size = rel(0.5)),
      panel.grid.minor = element_line(colour="#DEE3E9",size = rel(0.25)),

      # show axes
      axis.line      = element_line(colour = "black", lineend = "square", size = rel(1)),

      # match legend key to panel.background
      legend.key       = element_blank(),

      # simple, black and white strips
      strip.background = element_rect(fill = "white", colour = "black", size = rel(2)),
      # NB: size is 1 but clipped, it looks like the 0.5 of the axes

      complete = TRUE
    ) 

}


#test
#ggQQplot(ppoints(100)) + theme_gamplotlib()
#ggPCplot(data.frame(PC1=rnorm(50,0,1),PC2=rnorm(50,0,0.25),batch=c(rep(1,25),rep(2,25))),c(1,2),batch="batch",xlim = c(-1,1),ylim = c(-1,1)) + theme_gamplotlib() + scale_fill_gamplotlib() + scale_color_gamplotlib()
