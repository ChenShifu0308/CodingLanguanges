import csv
import json

tsv_file = open("languages.tsv", "r")

tsv_reader = csv.reader(tsv_file, delimiter="\t")
header = next(tsv_reader)
languages = header[3:]
print(languages)

# dict_reader = csv.DictReader(tsv_file, delimiter="\t")
tsv_file.seek(0)
for languange in languages:
    json_file = open(f"../assets/languages/{languange}.json", "w")
    data = {"coding_language": languange, "data": []}
    next(tsv_reader)  # skip header
    for row in tsv_reader:
        name = row[1]
        content = row[languages.index(languange) + 3]

        data["data"].append({"name": name, "content": content})
    json.dump(data, json_file)
    json_file.close()
    tsv_file.seek(0)