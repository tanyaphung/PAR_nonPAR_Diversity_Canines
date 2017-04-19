import sys
import os
import argparse
import csv
from computeAF import *
from computePi import *

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes pairwise diversity for each line of the BED file.")
	parser.add_argument(
    		"--BED", required=True,
            help="REQUIRED. BED file specifying the regions to compute pi.")
	parser.add_argument(
    		"--callable", required=True,
            help="REQUIRED. BED file specifying the regions that is callable.")
	parser.add_argument(
            "--variants", required=True,
            help="REQUIRED. Variant file. The format should be CHROM POS ind1 ind2 etc. Should be tab delimit. Because of VCF format, it is 1-based")
	parser.add_argument(
			"--numAllele", required=True,
			help="REQUIRED. Indicate the number of alleles, which is equal to the number of individuals in your sample times 2.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def main():
	args = parse_args()
	
	numAlleles = 0
	variants = [] # this is a list. Each item in this list is a list where the first item is the genomic position (0-based).
	with open(args.variants, "r") as variants_file:
		header = next(variants_file).split("\t")
		numAlleles = int(len(header) - 2)*2
		if numAlleles != int(args.numAllele):
			print "The number of alleles computed is not equal to the number of alleles you think you have. Something is not consistent here. Please check!"
			sys.exit(1)
		else:
			for line in variants_file:
				line = line.rstrip("\n")
				line = line.split("\t")
				to_append = [int(line[1])-1] # minus 1 because I want to save the position in 0-based format
				if all(x!='./.' for x in line[2:]): # remove variants because of missing data
					for i in range(2, len(line)):
						to_append.append(line[i])
				variants.append(to_append)

	# Make a set of sites that are callable
	callableSet = set()
	with open(args.callable, "r") as callable_file:
		for line in callable_file:
			line = line.rstrip("\n")
			line = line.split("\t")
			start = int(line[1])
			end = int(line[2])
			for each_site in range(start, end):
				callableSet.add(each_site)

	# Do stuff:

	# compute allele frequency
	variants_AF_dict = computeAF(variants, numAlleles)

	variantsSet = set()
	for key in variants_AF_dict:
		variantsSet.add(key)

	result_file = open(args.outfile, "w")

	with open(args.BED, "r") as BED_file:
		for line in BED_file:
			line = line.rstrip("\n")
			line = line.split("\t")
			start = int(line[1])
			end = int(line[2])
			each_BED_AF = []
			total_callable = 0
			for each_site in range(start, end):
				if each_site in callableSet:
					total_callable += 1
					if each_site in variantsSet:
						each_BED_AF.append(variants_AF_dict[each_site])
			pi = computePi(each_BED_AF, numAlleles)
			if total_callable != 0 and pi != 'NA':
				piPerSite = float(pi)/total_callable ### Need to adjust here for the callable sites
			else:
				piPerSite = 'NA'
			output = [str(line[0]), str(line[1]), str(line[2]), str(pi), str(total_callable), str(piPerSite)]
			print >>result_file, "\t".join(x for x in output)
main()


