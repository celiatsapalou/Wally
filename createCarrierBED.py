#! /usr/bin/env python

from __future__ import print_function
import argparse
import sys
import cyvcf2


# Parse command line
parser = argparse.ArgumentParser(description='Select carriers and non-carriers of SVs')
parser.add_argument('-v', '--vcf', metavar='input.vcf.gz', required=True, dest='vcf', help='input VCF file (required)')
args = parser.parse_args()

# Parse VCF
vcf = cyvcf2.VCF(args.vcf)
samples = list(vcf.samples)
for record in vcf:
    # Ignore multi-allelics
    if len(record.ALT) > 1:
        continue

    # Filter inversion
    svt = record.INFO.get('SVTYPE')
    if (svt != "INV"):
        continue

    # Filter by size
    endpos = record.INFO.get('END')
    if (endpos - record.POS) > 70000:
        continue

    # Fetch inversion carriers by GQ
    gq = record.format('GQ')
    car = None
    carGQ = 0
    noncar = None
    noncarGQ = 0
    for idx, spl in enumerate(samples):
        if (record.gt_types[idx] != vcf.HOM_REF) and (record.gt_types[idx] != vcf.UNKNOWN):
            if (gq[idx] > carGQ):
                car = spl
                carGQ = gq[idx]
        elif (record.gt_types[idx] == vcf.HOM_REF):
            if (gq[idx] > noncarGQ):
                noncar = spl
                noncarGQ = gq[idx]
    print(record.CHROM, record.POS, endpos, record.ID, car, noncar)
