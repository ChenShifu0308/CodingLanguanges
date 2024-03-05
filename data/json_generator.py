import csv
import json

code_start_index = 4

tsv_file = open("languages.csv", "r")

tsv_reader = csv.reader(tsv_file, delimiter=",")
header = next(tsv_reader)
languages = header[code_start_index:]
print(languages)

# dict_reader = csv.DictReader(tsv_file, delimiter="\t")
tsv_file.seek(0)
for languange in languages:
    json_file = open(f"../assets/languages/{languange}.json", "w")
    data = {"coding_language": languange, "data": []}
    next(tsv_reader)  # skip header
    for row in tsv_reader:
        name = row[1]
        content = row[languages.index(languange) + code_start_index]

        data["data"].append({"name": name, "content": content})
    json.dump(data, json_file)
    json_file.close()
    tsv_file.seek(0)