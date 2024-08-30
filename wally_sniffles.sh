#!/bin/bash

HG=/g/impont/ref/hg38.fa
WALLY=/g/korbel/shared/software/wally/src/wally

while read CHR POS END ID CAR NON
do
    echo ${ID}
    # Fetch BAM files
    CARBAM=/g/impont/hg38/${CAR}.hg38.cram
    NONBAM=/g/impont/hg38/${NON}.hg38.cram

    if [ -f ${CARBAM} ]
    then
	if [ -f ${NONBAM} ]
	then
	    if [ ! -f ${ID}.pdf ]
	    then
		# Given inversion
		echo -e "${CHR}\t${POS}\t${END}\t${ID}" > ${ID}.bed
		bgzip ${ID}.bed
		tabix -p bed ${ID}.bed.gz
		# Buffer for viewing
		zcat ${ID}.bed.gz | awk '{print $1"\t"($2-1000)"\t"($3+1000)"\t"$4;}' > ${ID}.bed
		
		# Dotplot
		samtools view -b --reference ${HG} -L ${ID}.bed ${CARBAM} > ${ID}.bam
		samtools index ${ID}.bam
		samtools view -F 3840 ${ID}.bam | awk '{print $1"\t"length($10);}' | sort -k2,2gr | cut -f 1 | uniq > ${ID}.reads
		for RN in `cat ${ID}.reads | head -n 10`
		do
		    echo ${RN}
		    SWIN=`expr ${POS} - 10000`
		    SEND=`expr ${END} + 10000`
		    /g/korbel/shared/software/wally/src/wally dotplot -g ${HG} -r ${RN} -e ${CHR}:${SWIN}-${SEND}:${ID} ${ID}.bam
		done
		 ~/mambaforge/envs/snakemake/bin/convert -adjoin *_${ID}.png ${ID}.pdf
		rm *_${ID}.png
		
		# Match plot
		#/g/korbel/shared/software/wally/src/wally matches -g ${HG} -R ${ID}.reads -s 20000 -o ${ID}.car.png ${ID}.bam
		
		# IGV-like plot of inversion
		${WALLY} region -b ${ID}.bed.gz -g ${HG} -R ${ID}.bed -cu ${CARBAM} ${NONBAM}
		
		# Clean-up
		rm ${ID}.bed* ${ID}.bam ${ID}.bam.bai ${ID}.reads
	    fi
	fi
    fi
done < sniffles.final.bed

