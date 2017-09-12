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
    scale_colour_gradient(low="#834041", high="#F97E86",
			  space="Lab", na.value="grey50", guide="colourbar")
  ))	
}

scale_fill_gradient_gamplotlib <- function(){
    structure(list(
    scale_fill_gradient(low="#834041", high="#F97E86",
			  space="Lab", na.value="grey50", guide="colourbar")
  ))	
}

theme_gamplotlib <- function(){
	theme_bw() + 
	theme(panel.grid.major = element_line(colour="#F6F7F7"),
	panel.grid.minor = element_line(colour="#F6F7F7"))
}


#test
#ggQQplot(ppoints(100)) + theme_gamplotlib()
#ggPCAplot(pdata,c(1,2),batch="Sex",xlim = c(-1,1),ylim = c(-1,1)) + theme_gamplotlib() + #scale_fill_gamplotlib() + scale_color_gamplotlib()
