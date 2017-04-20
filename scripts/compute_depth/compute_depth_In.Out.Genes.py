import sys
import os
import argparse
import csv
import numpy
from bisect import bisect

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes the average depth in each line of the BED file.")
	parser.add_argument(
    		"--BED", required=True,
            help="REQUIRED. BED file specifying the regions to compute average depth.")
	parser.add_argument(
    		"--depth", required=True,
            help="REQUIRED. OUTPUT from samtools depth")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def main():
	args = parse_args()

	result_file = open(args.outfile, "w")

	# depth_set = set()
	positions = []
	depths = []
	with open(args.depth, "r") as DEPTH_file:
		for line in DEPTH_file:
			line = line.rstrip("\n")
			line = line.split("\t")
			# depth_set.add(int(line[1]))
			positions.append(int(line[1]))
			depths.append(int(line[2]))

	with open(args.BED, "r") as BED_file:
		for line in BED_file:
			line = line.rstrip("\n")
			line = line.split("\t")
			start = int(line[1])
			end = int(line[2])

			# find start:
			if start in positions:
				start_index = positions.index(start)
			else:
				if start <= positions[0]:
					start_index = 0
				else:
					start_index = bisect(positions, start)

			# find end:
			if end in positions:
				end_index = positions.index(end)
			else:
				end_index = bisect(positions, end) - 1


			total_depth = depths[start_index:end_index]
			mean_depth = numpy.mean(total_depth)

			output = [str(line[0]), str(line[1]), str(line[2]), str(mean_depth)]
			print >>result_file, "\t".join(x for x in output)

main()


