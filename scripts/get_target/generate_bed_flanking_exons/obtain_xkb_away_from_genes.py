import os
import sys
import argparse

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script generates flanking regions. This script takes in the BED file. For example, the BED file has coordinates for the start and end of an exon to be 100 and 200. This script takes in a predefined number (for example, 50). Then it will returns 50 and 250. Require 3 inputs.")

	parser.add_argument(
            "--total_length", required=True,
            help="REQUIRED. 1 line BED file that represents the length of the chromosome. For example: chrX 0 123869142.")
	parser.add_argument(
    		"--BED", required=True,
            help="REQUIRED. BED file. For example, this BED file can have coordinates for the start and end for the exonic regions. For example, chrX 26290909 28333720.")
	parser.add_argument(
            "--flanking_size", required=True,
            help="REQUIRED. The size of the flanking region. For instance, if you want the flanking region to be 50kb, input 50000.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args


def obtain_xkb_away_from_genes(max_position, BED, xkb, chrName, outfile):
	
	BED_xkb = []
	for each_BED in BED:
		new_each_BED_xkb = []
		# get the new start
		new_start = each_BED[0] - xkb
		if new_start >= 0:
			new_each_BED_xkb.append(new_start)
		else:
			new_each_BED_xkb.append(int(0))
		
		# get the new end
		new_end = each_BED[1] + xkb
		if new_end <= max_position:
			new_each_BED_xkb.append(new_end)
		else:
			new_each_BED_xkb.append(max_position)
		BED_xkb.append(new_each_BED_xkb)

	for each_BED_xkb in BED_xkb:
		to_print = [chrName, str(each_BED_xkb[0]), str(each_BED_xkb[1])]
		print >>outfile,"\t".join(to_print)	

def main():
	args = parse_args()

	with open(args.total_length) as f:
		for line in f:
			line = line.split("\t")
			max_position = int(line[2])
	
	BED = []
	with open(args.BED) as f:
		for line in f:
			line = line.split("\t")
			chrName = str(line[0])
			BED.append((int(line[1]), int(line[2])))
	
	xkb = int(args.flanking_size)

	outfile = open(args.outfile, "w")
	
	obtain_xkb_away_from_genes(max_position, BED, xkb, chrName, outfile)

main()
