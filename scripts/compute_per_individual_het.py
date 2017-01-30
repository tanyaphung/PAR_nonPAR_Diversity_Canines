import sys
import os
import argparse
import csv
from make_neutral_loci import *

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes per individual heterozygosity")

	parser.add_argument(
            "--windows_bed", required=True,
            help="REQUIRED. BED file for Xkb window.")
	parser.add_argument(
    		"--targets_bed", required=True,
            help="REQUIRED. BED file specifying the regions to be partitioned into Xkb window. For example, give the path for the bed file where regions represent neutral region")
	parser.add_argument("--genotype_csv", required=True, help="REQUIRED. CSV file where each row is a site. The first column is the position. The second column is the genotype of ndividual X.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def compute_per_individual_het(window, window_with_total_callable, pos_set, pos_GT_dict):
	return_dict = {}
	for each_window, intervals in window.iteritems():
		if len(intervals) != 0:
			total_het = 0
			genotype_list = []
			for each_interval in intervals:
				for each_site in range(each_interval[0], each_interval[1] + 1):
					if each_site in pos_set:
						each_site_GT = pos_GT_dict[each_site]
						print each_site_GT
						if each_site_GT == '0/1' or each_site_GT == '1/0':
							print 'yes'
							total_het += 1
			return_dict[each_window] = (total_het, window_with_total_callable[each_window], float(total_het)/window_with_total_callable[each_window])	
		else:
			return_dict[each_window] = ("NA", "NA", "NA")
	return return_dict

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
	
	pos_set = set()
	pos_GT_dict = {}

	with open(args.genotype_csv,"r") as genotypeCSVFile:
		next(genotypeCSVFile)
		for line in genotypeCSVFile:
			line = line.strip()
			line = line.split(",")
			pos_set.add(int(line[1]))
			pos_GT_dict[int(line[1])] = str(line[2])

	windows_with_targets = make_neutral_loci_predefined_windows(windows, targets)

	windows_with_total_callable_sites = tabulate_total_sites_each_window(windows_with_targets)

	results = compute_per_individual_het(windows_with_targets, windows_with_total_callable_sites, pos_set, pos_GT_dict)

	with open(args.outfile,"w") as f:
		output_list = []
		for key in sorted(results):
			output_list.append([key[0], key[1], results[key][0], results[key][1], results[key][2]])

		w = csv.writer(f)
		w.writerows(output_list)
main()


