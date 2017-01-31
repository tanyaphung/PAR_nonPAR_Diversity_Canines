import sys
import os

results = {}
with open(sys.argv[1]) as genotypesFile:
	next(genotypesFile)
	for line in genotypesFile:
		line = line.strip("\n")
		line = line.split("\t")
		if line[2] != './.' and line[3] != './.':
			results[line[1]] = [line[2], line[3]]

for k, v in results.iteritems():
	toprint = [k, v[0], v[1]]
	print ",".join(x for x in toprint)