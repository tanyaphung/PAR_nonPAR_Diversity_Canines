import sys
import os
import argparse
import csv
from make_neutral_loci import *

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes the number of base pairs that overlap with genes within a nonoverlapping window.")

	parser.add_argument(
            "--windows_bed", required=True,
            help="REQUIRED. BED file for Xkb window.")
	parser.add_argument(
    		"--targets_bed", required=True,
            help="REQUIRED. BED file specifying the regions to be partitioned into Xkb window and subsequently to tabulate the number of basepair. In other words, give the path to the BED file of genes.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def main():
	args = parse_args()
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

	# Do stuff:
	windows_with_targets = make_neutral_loci_predefined_windows(windows, targets)

	windows_with_number_of_sites = tabulate_total_sites_each_window(windows_with_targets)

	with open(args.outfile,"w") as f:
		output_list = []
		for key in sorted(windows_with_number_of_sites):
			output_list.append([key[0], key[1], windows_with_number_of_sites[key]])

		w = csv.writer(f, delimiter = "\t")
		w.writerows(output_list)
main()


