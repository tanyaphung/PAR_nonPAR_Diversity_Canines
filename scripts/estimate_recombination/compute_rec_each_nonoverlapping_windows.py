import sys
import os
import argparse
import csv
def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes recombination rate in each nonoverlapping window")

	parser.add_argument(
            "--windows_bed", required=True,
            help="REQUIRED. BED file for Xkb window.")
	parser.add_argument(
    		"--recombination_file", required=True,
            help="REQUIRED. File including information for recombination")
	parser.add_argument(
			"--outfile", required=True, 
			help="REQUIRED. Name of output file.")
	args = parser.parse_args()
	return args

def compute_rec(windows, rec_intervals):
	results = {}
	for each_window in windows:
		total_cM = []
		total_length = []
		for each_rec_interval in rec_intervals:
			if each_rec_interval[0] >= each_window[0] and each_rec_interval[0] < each_window[1] and each_rec_interval[1] < each_window[1]:
				length = each_rec_interval[1] - each_rec_interval[0] + 1
				cM = float(rec_intervals[each_rec_interval]) * length / 1000000
				total_cM.append(cM)
				total_length.append(length)
			
			if each_rec_interval[0] >= each_window[0] and each_rec_interval[0] < each_window[1] and each_rec_interval[1] > each_window[1]:
				length = each_window[1] - each_rec_interval[0]
				cM = float(rec_intervals[each_rec_interval]) * length / 1000000
				total_cM.append(cM)
				total_length.append(length)

			if each_rec_interval[0] < each_window[0] and each_rec_interval[1] > each_window[1]:
				length = each_window[1] - each_window[0]
				cM = float(rec_intervals[each_rec_interval]) * length / 1000000
				total_cM.append(cM)
				total_length.append(length)
				
		if len(total_length) != 0:
			cM_Mb = float(sum(total_cM))/sum(total_length) * 1000000
			results[each_window] = cM_Mb
		else:
			results[each_window] = "NA"
	return results

def main():
	args = parse_args()

	windows = []
	with open(args.windows_bed,"r") as windowsFile:
		for line in windowsFile:
			line = line.split("\t")
			windows.append((int(line[1]), int(line[2])))

	rec_pos = []
	rec_cM_per_Mb = []
	with open(args.recombination_file,"r") as recFile:
		next(recFile)
		for line in recFile:
			line = line.split("\t")
			rec_pos.append(int(line[1]))
			rec_cM_per_Mb.append(float(line[2]))

	rec_intervals = {}
	rec_intervals[(0, rec_pos[0])] = 0
	for index in range(0, len(rec_pos)-1):
		interval = (rec_pos[index], rec_pos[index+1])
		rec_intervals[interval] = rec_cM_per_Mb[index]

	results = compute_rec(windows, rec_intervals)
	with open(args.outfile,"w") as f:
		output_list = []
		for key in sorted(results):
			output_list.append([key[0], key[1], results[key]])
		w = csv.writer(f)
		w.writerows(output_list)

main()
