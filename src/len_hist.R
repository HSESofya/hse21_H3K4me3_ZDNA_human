source('lib.R')
library(ggplot2)
###

#NAME <- 'H3K4me3_K562.ENCFF284TAL.hg19'
#NAME <- 'H3K4me3_K562.ENCFF284TAL.hg38'
#NAME <- 'H3K4me3_K562.ENCFF934IIU.hg19'
NAME <- 'H3K4me3_K562.ENCFF934IIU.hg38'

###

bed_df <- read.delim(paste0(NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'))
