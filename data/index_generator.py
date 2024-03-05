import csv
import json

item_name_index = 1
en_index = 2
cn_index = 3

tsv_file = open("languages.csv", "r")
tsv_reader = csv.reader(tsv_file, delimiter=",")
header = next(tsv_reader)

# 构建json数据结构
en_json_data = {
    "name": "Index",
    "language": "EN",
    "data": []
}
cn_json_data = {
    "name": "Index",
    "language": "CN",
    "data": []
}

category_dict = {}

next(tsv_reader)  # skip header
for row in tsv_reader:
    item_name = row[item_name_index],
    item_text_en = row[en_index],
    item_text_cn = row[cn_index],
    entry_en = {
        "name": item_name[0],
        "text": item_text_en[0],
        "type": "item"
    }
    entry_cn = {
        "name": item_name[0],
        "text": item_text_cn[0],
        "type": "item"
    }
    if item_name not in category_dict:
        category_dict[item_name] = entry_en
        en_json_data["data"].append(entry_en)
        cn_json_data["data"].append(entry_cn)

# 保存为json文件
with open('index_en.json', 'w') as jsonfile:
    json.dump(en_json_data, jsonfile, indent=4)
with open('index_cn.json', 'w') as jsonfile:
    json.dump(cn_json_data, jsonfile, indent=4)