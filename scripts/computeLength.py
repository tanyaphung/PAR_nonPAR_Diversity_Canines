import os
import sys

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script just quickly computes the proportion of the dog genome that is callable across all dog individuals or all wolf individuals. ")
	parser.add_argument(
			"--bedfile", required=True,
			help="REQUIRED. BED file in the form of CHR START_POS END_POS. This is the file where you want to compute total sites.")
	parser.add_argument(
			"--chrLength", required=True,
			help="REQUIRED. This is the length of the chromosome. Chromosome should match the CHR in the bed file. This is in the form of chr length.")

	args = parser.parse_args()
	return args

def main():
	args = parse_args()

	with open(args.chrLength, "r") as f:
		for line in f:
			line = line.rstrip("\n")
			line = line.split("\t")
			chrLength = int(line[1])

	total = 0
	with open(sys.argv[1], "r") as f:
		for line in f:
			line = line.rstrip("\n")
			line = line.split("\t")
			distance = int(line[2]) - int(line[1])
			total += distance

	proportion = float(total)/chrLength
	toprint = [str(total), str(chrLength), str(proportion)]
	print "\t".join(x for x in toprint)

main()