import os
import sys
from make_neutral_loci import *
import argparse

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes the number of sites that are different between 2 species within each non overlapping window.")
	parser.add_argument(
			"--windows", required=True,
			help="REQUIRED. BED file for nonoverlapping windows")
	parser.add_argument(
    		"--targets_bed", required=True,
            help="REQUIRED. BED file specifying the regions to be partitioned into Xkb window. For example, give the path for the bed file where regions represent neutral region")
	parser.add_argument(
    		"--summary_lines", required=True,
            help="REQUIRED.")
	parser.add_argument(
    		"--species_1", required=True,
            help="REQUIRED.")
	parser.add_argument(
    		"--species_2", required=True,
            help="REQUIRED.")
	parser.add_argument(
			"--outfile", required=True,
			help="REQUIRED. Name of the output file")

	args = parser.parse_args()
	return args

def identify_callable_divergent_sites(alignable_intervals, alignable_dog_sequences, alignable_human_sequences):
	"""
	This function takes in:
	1. alignable_intervals: a dictionary where each key is the index to look up where the sequences are and value is a tuple of (start, end). 0-based and end is NOT included.
	2. alignable_dog_sequences: a list where each item is a DNA string.
	3. alignable_human_sequences: a list where each item is a DNA string.

	RETURN:
	1. all_callable_sites set: where each item is the coordinate (0-based)
	2. all_divergent_sites set: where each item is the coordinate (0-based)
	"""
	nucleotides = ['A', 'T', 'G', 'C']
	all_callable_sites = set()
	all_divergent_sites = set()

	for each_index, each_interval in alignable_intervals.iteritems():
		each_interval_length = each_interval[1] - each_interval[0] + 1
		for i in range(0, each_interval_length):
			if alignable_dog_sequences[each_index][i] in nucleotides and alignable_human_sequences[each_index][i] in nucleotides:
				all_callable_sites.add(each_interval[0] + i)
				if alignable_dog_sequences[each_index][i] != alignable_human_sequences[each_index][i]:
					all_divergent_sites.add(each_interval[0] + i)
	return all_callable_sites, all_divergent_sites

def compute_divergence_XkbLoci(all_loci, all_callable_sites, all_divergent_sites):
	all_loci_divergence = {}
	for each_loci in all_loci:
		each_loci_totalCallableSites = 0
		each_loci_totalDivergentSites = 0
		for each_interval in all_loci[each_loci]:
			for each_site in range(each_interval[0], each_interval[1]+1):
				if each_site in all_callable_sites:
					each_loci_totalCallableSites += 1
				if each_site in all_divergent_sites:
					each_loci_totalDivergentSites += 1
		if each_loci_totalCallableSites != 0:
			divergence_per_loci = float(each_loci_totalDivergentSites)/each_loci_totalCallableSites

		else:
			divergence_per_loci = 'NA'
		to_append = [each_loci_totalCallableSites, each_loci_totalDivergentSites, divergence_per_loci]
		all_loci_divergence[each_loci] = to_append
		
	return all_loci_divergence

def main():
	# parsing command-line arguments
	args = parse_args()

	windows = [] # each item is a tuple of the form (start, end) that is 0-based AND end is exclusive
	with open(args.windows,"r") as windowsFile:
		for line in windowsFile:
			line = line.split("\t")
			windows.append((int(line[1]), int(line[2])))

	targets = []
	with open(args.targets_bed,"r") as targetsFile:
		for line in targetsFile:
			line = line.split("\t")
			targets.append((int(line[1]), int(line[2])))

	alignable_intervals = {} # key is the index to look up the sequences. Value is a tuple in the form (start, end). 0-based. End inclusive
	with open(args.summary_lines) as summaryLinesFile:
		for line in summaryLinesFile:
			line = line.rstrip("\n")
			line = line.split(" ")
			alignable_intervals[int(line[0])] = (int(line[2]) - 1, int(line[3]) - 1)


	with open(args.species_1) as dogSequencesFile:
		dog_sequences = [line.rstrip() for line in dogSequencesFile] 

	with open(args.species_2) as humanSequencesFile:
		human_sequences = [line.rstrip() for line in humanSequencesFile]

	# Do stuff:
	## STEP 1: make neutral loci
	# target return is 0-based, end inclusive
	windows_with_targets = make_neutral_loci_predefined_windows(windows, targets)

	## STEP 2: identify coordinates that are callable and divergent
	all_callable_sites, all_divergent_sites = identify_callable_divergent_sites(alignable_intervals, dog_sequences, human_sequences)

	## STEP 3:
	# compute_divergence_XkbLoci(all_loci, all_callable_sites, all_divergent_sites)
	all_loci_divergence = compute_divergence_XkbLoci(windows_with_targets, all_callable_sites, all_divergent_sites)

	with open(args.outfile, 'a') as outFile:
		outFile.write(str("Start")+"\t"+str("End")+"\t"+str("Total callable sites")+"\t"+str("Total divergent sites")+"\t"+str("Divergence")+"\n")
		for k, v in sorted(all_loci_divergence.items()):
			outFile.write(str(k[0])+"\t"+str(k[1])+"\t"+str(v[0])+"\t"+str(v[1])+"\t"+str(v[2])+"\n")

main()

