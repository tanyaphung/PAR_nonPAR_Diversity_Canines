import os
import sys
import argparse
import csv
import pysam
from make_neutral_loci import *

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes the proportion of GC in each window. NOTE that this is intended to compute GC content in the neutral regions in each window.")

	parser.add_argument(
            "--windows_bed", required=True,
            help="REQUIRED. BED file for Xkb window.")
	parser.add_argument(
    		"--targets_bed", required=True,
            help="REQUIRED. BED file specifying the regions to be partitioned into Xkb window. For example, give the path for the bed file where regions represent neutral region")
	parser.add_argument(
			"--chr", required=True,
			help="REQUIRED. Indicate what chromosome.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def main():
	args = parse_args()
	chrom = args.chr
	windows = []
	with open(args.windows_bed,"r") as windowsFile:
		for line in windowsFile:
			line = line.split("\t")
			windows.append((int(line[1]), int(line[2])))

	targets = []
	with open(args.targets_bed,"r") as targetsFile:
		for line in targetsFile:
			line = line.split("\t")
			targets.append((int(line[1]), int(line[2])))

	windows_with_targets = make_neutral_loci_predefined_windows(windows, targets)

	returnDict = {}
	for each_window, intervals in windows_with_targets.iteritems():
		total = 0
		GC = 0
		for each_interval in intervals:
			start = each_interval[0]
			end = each_interval[1]
			region = chrom + ":" + str(start) + "-" + str(end)
			sequences = pysam.faidx("/u/scratch/p/phung428/canFam3.1_ref/canfam31.fa", region)
			for each_sequence in sequences[1:]:
				each_sequence = each_sequence.rstrip("\n")
				total += len(each_sequence)
				for base in each_sequence:
					if base == 'G' or base == 'C':
						GC += 1
		if total != 0:
			returnDict[each_window] = [GC, total, float(GC)/total]
		else:
			returnDict[each_window] = [GC, total, 'NA']

	with open(args.outfile,"w") as f:
		output_list = []
		for key in sorted(returnDict):
			output_list.append([key[0], key[1], returnDict[key][0], returnDict[key][1], returnDict[key][2]])

		w = csv.writer(f, delimiter = "\t")
		w.writerows(output_list)

main()