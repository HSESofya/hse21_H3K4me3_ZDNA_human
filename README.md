# hse21_H3K4me3_ZDNA_human

## Histogram of ChIP-seq peak lenght before filtration
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/len_hist.H3K4me3_K562.ENCFF934IIU.hg38.png)
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/len_hist.H3K4me3_K562.ENCFF934IIU.hg19.png)
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/len_hist.H3K4me3_K562.ENCFF284TAL.hg38.png)
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/len_hist.H3K4me3_K562.ENCFF284TAL.hg19.png)

## Histogram of ChIP-seq peak lenght after filtration
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/filter_peaks.H3K4me3_K562.ENCFF934IIU.hg19.filtered.hist.png)
### filtering parameter for ENCFF934IIU: 5000 
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/filter_peaks.H3K4me3_K562.ENCFF284TAL.hg19.filtered.hist.png)
### filtering parameter for ENCFF284TAL: 5000

## Location of ChIP-seq peaks
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/chip_seeker.H3K4me3_K562.ENCFF934IIU.hg19.filtered.plotAnnoPie.png)
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/chip_seeker.H3K4me3_K562.ENCFF284TAL.hg19.filtered.plotAnnoPie.png)

## Histogram of lengths of DNA secondary structure sections
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/len_hist.DeepZ.png)

## Location of DNA secondary structures
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/chip_seeker.DeepZ.plotAnnoPie.png)

## Histogram of lengths of intersection between ChIP-seq peaks and DNA secondary structures


## Location of intersection between ChIP-seq peaks and DNA secondary structures
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/chip_seeker.H3K4me3_K562.intersect_with_DeepZ.plotAnnoPie.png)

## UCSC GenomeBrowser
### UCSC GenomeBrowser session:  
http://genome.ucsc.edu/s/SofyaLopatina/LopatinaS
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/genome_browser.png)

## Association of peaks with genes
### The number of peaks that could be associated with genes: 10038
### The total number of unique genes: 6308

## GO-analysis
![alt text](https://github.com/HSESofya/hse21_H3K4me3_ZDNA_human/blob/main/images/go.png)



# Используемые команды

### Скачивание и обрезание bed.файлов:

•	mkdir ~/project

•	wget https://www.encodeproject.org/files/ENCFF934IIU/@@download/ENCFF934IIU.bed.gz

•	wget https://www.encodeproject.org/files/ENCFF284TAL/@@download/ENCFF284TAL.bed.gz

•	zcat ENCFF934IIU.bed.gz | cut -f1-5 > H3K4me3_K562.ENCFF934IIU.hg38.bed 

•	zcat ENCFF284TAL.bed.gz | cut -f1-5 > H3K4me3_K562.ENCFF284TAL.hg38.bed

### Конвертирование версии генома с помощью liftOver:

•	wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz

•	liftOver   H3K4me3_K562.ENCFF934IIU.hg38.bed   hg38ToHg19.over.chain.gz   H3K4me3_K562.ENCFF934IIU.hg19.bed   H3K4me3_K562.ENCFF934IIU.unmapped.bed

•	liftOver   H3K4me3_K562.ENCFF284TAL.hg38.bed   hg38ToHg19.over.chain.gz   H3K4me3_K562.ENCFF284TAL.hg19.bed   H3K4me3_K562.ENCFF284TAL.unmapped.bed

### Объединяем два набора отфильтрованных ChIP-seq:

•	cat  *.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K4me3_K562.merge.hg19.bed


### Скачивание вторичной структуры ДНК (ZDNA):

•	wget https://raw.githubusercontent.com/Nazar1997/DeepZ/master/annotation/DeepZ.bed

### Пересечения гистоновой метки и вторичной структуры ДНК:

•	bedtools intersect  -a DeepZ.bed   -b  H3K4me3_K562.merge.hg19.bed  >  H3K4me3_K562.intersect_with_DeepZ.bed

### Визуализация в геномном браузере:

•	track visibility=dense name="ENCFF934IIU"  description="H3K4me3_K562.ENCFF934IIU.hg19.filtered.bed"
https://raw.githubusercontent.com/HSESofya/hse21_H3K4me3_ZDNA_human/main/dataH3K4me3_K562.ENCFF934IIU.hg19.filtered.bed

•	track visibility=dense name="ENCFF284TAL"  description="H3K4me3_K562.ENCFF284TAL.hg19.filtered.bed"
https://raw.githubusercontent.com/HSESofya/hse21_H3K4me3_ZDNA_human/main/data/H3K4me3_K562.ENCFF284TAL.hg19.filtered.bed

•	track visibility=dense name="ChIP_merge"  color=50,50,200   description="H3K4me3_K562.merge.hg19.bed"
https://raw.githubusercontent.com/HSESofya/hse21_H3K4me3_ZDNA_human/main/data/H3K4me3_K562.merge.hg19.bed

•	visibility=dense name="DeepZ"  color=0,200,0  description="DeepZ"
https://raw.githubusercontent.com/HSESofya/hse21_H3K4me3_ZDNA_human/main/data/DeepZ.bed

•	track visibility=dense name="intersect_with_DeepZ"  color=200,0,0  description="H3K4me3_K562.intersect_with_DeepZ.bed"
https://raw.githubusercontent.com/HSESofya/hse21_H3K4me3_ZDNA_human/main/data/H3K4me3_K562.intersect_with_DeepZ.bed

