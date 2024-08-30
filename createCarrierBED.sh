#!/bin/bash

# Delly
#python3 createCarrierBED.py -v /g/impont/svs/delly/merged.hg38.bcf > delly.inversion.bed

# Sniffles
python3 createCarrierBED.py -v /g/korbel2/shared/inversion/filtered_sniffles_inversions.vcf.gz > filtered.sniffles.inversion.bed

# all
#bcftools view output_all.bcf chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX | bcftools query -f "%CHROM\t%POS\t%INFO/END\t%ID\t%QUAL\n" - > all.inversion.bed


