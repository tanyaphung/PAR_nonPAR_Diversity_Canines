import sys
import os
import argparse
import csv
from make_neutral_loci import *

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes distance metrics between two individuals. Suppose that one has sequenced whole genome for individual X and for individual Y and is interested in the divergence between these two individuals. This script takes in the data from the VCF formats and computes the distance metrics between the two individuals")

	parser.add_argument(
            "--windows_bed", required=True,
            help="REQUIRED. BED file for Xkb window.")
	parser.add_argument(
    		"--targets_bed", required=True,
            help="REQUIRED. BED file specifying the regions to be partitioned into Xkb window. For example, give the path for the bed file where regions represent neutral region")
	parser.add_argument("--genotype_csv", required=True, help="REQUIRED. CSV file where each row is a site. The first column is the position. The second column is the first allele of individual X. The third column is the second allele of individual X. The fourth column is the first allele of individual Y. The fifth column is the second allele of individual Y. By default, the columns are named: pos, a, b, c, d.")
	# parser.add_argument("--outfile", required=True, 
	# 		help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def compute_distance_metrics(window, window_with_total_callable, genotypes, positions_set):
	"""
	Note: here window is a dictionary where key is the window and value is the neutral regions. For example, key is (0, 50000) and values is [(0, 100), (300, 400)]
	Return a dict where key is the window (i.e. (0, 50000)) and value is distance metrics (i.e. divergence)
	"""
	return_dict = {}
	for each_window, intervals in window.iteritems():
		# total_sites_count_in_each_window = 0
		delta_count = []
		for each_interval in intervals:
			for each_site in range(each_interval[0], each_interval[1] + 1):
				if each_site in positions_set:
					# total_sites_count_in_each_window += 1
					each_site_gen = genotypes[each_site]
					if each_site_gen[0] == each_site_gen[2]:
						ac = 1
					else:
						ac = 0
					if each_site_gen[1] == each_site_gen[3]:
						bd = 1
					else:
						bd = 0
					if each_site_gen[0] == each_site_gen[3]:
						ad = 1
					else:
						ad = 0
					if each_site_gen[1] == each_site_gen[2]:
						bc = 1
					else:
						bc = 0
					delta_count.append(1-0.5*max(ac+bd, ad+bc))
		# if total_sites_count_in_each_window != 0:
		if window_with_total_callable[each_window] != 0:
			return_dict[each_window] = float(sum(delta_count))/window_with_total_callable[each_window]
		else:
			return_dict[each_window] = "NA"
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

	genotypes = {}
	positions_set = set()
	with open(args.genotype_csv,"r") as genotypesFile:
		for line in genotypesFile:
			line = line.strip("\n")
			line = line.split(",")
			genotypes[int(line[0])] = [line[1], line[2], line[3], line[4]]
			positions_set.add(int(line[0]))

	windows_with_targets = make_neutral_loci_predefined_windows(windows, targets)

	windows_with_total_callable_sites = tabulate_total_sites_each_window(windows_with_targets)

	results = compute_distance_metrics(windows_with_targets, windows_with_total_callable_sites, genotypes, positions_set)

	for k, v in sorted(results.items()):
		toprint = [str(k[0]), str(k[1]), str(v)]
		print ",".join(x for x in toprint)

	# with open(args.outfile,"w") as f:
	# 	output_list = []
	# 	for key in sorted(results):
	# 		output_list.append([key[0], key[1], results[key]])

	# 	w = csv.writer(f)
	# 	w.writerows(output_list)
main()


