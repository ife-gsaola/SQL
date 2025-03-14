import csv
import os

input_file = r"C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset"
output_file = r"C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset"

for files in os.listdir(input_file):

    input_ = os.path.join(input_file, files)
    output_ = os.path.join(output_file, files)
    # print (files)
    with open(input_, "r", encoding="utf-8") as infile, open(output_, "w", encoding="utf-8", newline="") as outfile:
        reader = csv.reader(infile, quotechar='"') 
        writer = csv.writer(outfile, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')

        for row in reader:
            row = [col.replace('"', '') for col in row] 
            writer.writerow(row)

    print(f"CSV conversion complete! Saved as: {output_}")