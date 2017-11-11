#TODO - plot sig points on top of non sig
#TODO - annotate names of sig results
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# R function to produce Volcano plot using ggplot
#
#input: dataframe with columns for p-val, adjusted p val, and lfc (in that order)
#ggplot object
#
# author. Ayden Saffari <ayden.saffari@lshtm.ac.uk>
# affiliations. MRC ING, LSHTM, BBK
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

ggVplot <- function(df, fdrcut = 0.1, lfccut = 1.0, xlim = c(-2,2), ylim = c(0,7),pthresh = 0.05, lfcthresh = 0.02, ...){   
	pal <- c(nonsig=colpalricht1[7],fdrsig="#FD6621",lfcthresh="#A82649",pthresh=colpalricht1[8])
	xlab <- expression(log[2] ~ fold ~ change)
	ylab <- expression(-log[10] ~ p)    
        
	#create dataframe to pass to ggplot
    	res <- data.frame(logfc=pmax(xlim[1],pmin(xlim[2],df[,3])),
        			  p=pmin(-log10(df[,1]),ylim[2]),fdr=df[,2])
	res <- rbind(res[which(res$fdr >= fdrcut) | which(abs(res$logfc) < lfccut),],
				 res[which(res$fdr < fdrcut) & which(abs(res$logfc) >= lfccut),])
    	#set colours
    	col <- ifelse(is.na(res$fdr) | res$fdr >= fdrcut | abs(res$logfc) < lfccut,
                      pal[1],pal[2])
    	#set sizes
    	sz <- ifelse(is.na(res$fdr) | res$fdr >= fdrcut | abs(res$logfc) < lfccut, 1, 2)
    
    	#set shapes
    	pch <- ifelse(res$p < ylim[1], 25,
           	      ifelse(res$p == ylim[2] | abs(res$logfc) == xlim[2] , 24, 21))
    	ggplot(res,aes(logfc,p)) +
           	geom_point(alpha=1,color=col,size=sz,fill=col,shape=pch,aes()) +
           	xlab(xlab) +
           	ylab(ylab) +
           	ylim(ylim[1],ylim[2]) +
           	xlim(xlim[1],xlim[2]) +
		geom_vline(aes(xintercept=lfcthresh,colour="lfcthresh"), linetype = "dashed") + 
		geom_vline(aes(xintercept=-lfcthresh,colour="lfcthresh"), linetype = "dashed") + 
		geom_hline(aes(yintercept=1.30103,colour="pthresh")) + 
		scale_color_manual(values=pal, ...)
}
