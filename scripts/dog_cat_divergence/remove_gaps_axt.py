import sys
import os

def remove_insertions_in_species1_sequences(species1_sequences, species2_sequences):
	species1_sequences_removed = []
	species2_sequences_removed = []
	for i in range(len(species1_sequences)): ## for each index
		species1_sequence = species1_sequences[i]
		species2_sequence = species2_sequences[i]
		new_species1_sequence = ''
		new_species2_sequence = ''
		for j in range(len(species1_sequence)):
			if species1_sequence[j]!= '-':
				new_species1_sequence+=str(species1_sequence[j])
				new_species2_sequence+=str(species2_sequence[j])
		species1_sequences_removed.append(new_species1_sequence)
		species2_sequences_removed.append(new_species2_sequence)
	new_species1_file = open(sys.argv[3], "w")
	for i in species1_sequences_removed:
		new_species1_file.writelines(i+'\n')
	new_species1_file.close()

	new_species2_file = open(sys.argv[4], "w")
	for i in species2_sequences_removed:
		new_species2_file .writelines(i+'\n')
	new_species2_file .close()


def main():
	with open(sys.argv[1]) as f1:
		species1_sequences = [line.rstrip() for line in f1]
	with open(sys.argv[2]) as f2:
		species2_sequences = [line.rstrip() for line in f2]
	remove_insertions_in_species1_sequences(species1_sequences, species2_sequences)
main()
