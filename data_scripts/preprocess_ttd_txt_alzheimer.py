import os
import pandas as pd
import json
import uuid

ttd_data_folder = "../BioT5/data/ttd/"

join_data = dict()

for file in os.listdir(ttd_data_folder):
    if file.endswith(".txt") and file.startswith("P1-"):
        short_file_name = file[6:-4]
        # print(short_file_name)
        with open(ttd_data_folder + file) as f:
            if short_file_name == "TTD_drug_download":
                content = f.readlines()[28:]
            else:
                content = f.readlines()[22:]
            # content = f.readlines()
            texts = "".join(content).split("\n\n")
            alzheimer_texts = []
            for text in texts:
                if "Alzheimer" in text:
                    alzheimer_texts.append(text+"\n")
            print(texts[:5], alzheimer_texts[:5])
            # File-specific processing. Could use match case instead, but 
            output_texts = []
            if short_file_name == "TTD_drug_download":
                short_file_name = short_file_name[:-9]
                print(short_file_name)
                for text in texts:
                    split_text = text.split("\n")
                    id = split_text[0].split("\t")[2]
                    try:
                        smiles = split_text[6].split("\t")[2]
                    except: #some drugs have no info
                        # print(split_text)
                        smiles = ""
                        # raise
                    output_texts.append([id, smiles])
                df = pd.DataFrame(output_texts, columns = ["DrugID", "DrugSMILES"])
                join_data[short_file_name] = df
                # pass
            if short_file_name == "Target_disease":
                for text in alzheimer_texts:
                    split_text = text.split("\n")
                    id = split_text[0].split("\t")[2]
                    name = split_text[1].split("\t")[2]
                    for line in split_text:
                        if "Alzheimer" in line:
                            # output_texts.append("\t".join([id, name, line.split("\t")[2]]))
                            output_texts.append([id, name, line.split("\t")[2]])
                df = pd.DataFrame(output_texts, columns=["TargetID", "TargetName", "Target_clinical_status"])
                join_data[short_file_name] = df
                # pass
            if short_file_name == "Drug_disease":
                for text in alzheimer_texts:
                    split_text = text.split("\n")
                    id = split_text[0].split("\t")[1]
                    name = split_text[1].split("\t")[1]
                    for line in split_text:
                        if "Alzheimer" in line:
                            # output_texts.append("\t".join([id, name, line.split("\t")[3]]))
                            output_texts.append([id, name, line.split("\t")[3]])
                df = pd.DataFrame(output_texts, columns=["DrugID", "DrugName", "Drug_clinical_status"])
                join_data[short_file_name] = df
                # pass
            
            # print(output_texts[:5])
            # if output_texts:
            #     with open(ttd_data_folder + short_file_name + "-Alzheimer.txt", "w") as outfile:
            #         outfile.writelines(alzheimer_texts)                                                   

drug_target_mappings = pd.read_csv("../BioT5/data/ttd/P1-07-Drug-TargetMapping.csv")
full_df = pd.merge(drug_target_mappings, join_data["Target_disease"])
full_df = pd.merge(full_df, join_data["Drug_disease"])
print(full_df.head(), len(full_df))
full_df = pd.merge(full_df, join_data["TTD_drug"])
# print(full_df.head(), len(full_df))
full_df.to_csv(ttd_data_folder + "Alzheimer_targets_and_drugs.tsv", sep = "\t", index = False)


data_dict = {"Contributors": ["Nguyen Duy Minh"], "Categories": ["Translation"], "Reasoning": [], "URL": ["https://db.idrblab.net/ttd/"], "Instruction_language": ["English"], "Domains": ["Chemistry"], "Positive Examples": [], "Negative Examples": [],"Instances": [], "Source": ["Translation from molecule SELFIES to natural language"], "Definition": ["You are given a molecule SELFIES. Your job is to generate the molecule description in English that fits the molecule SELFIES."], "Input_language": ["SELFIES"], "Output_language": ["English"], "Instance License": ["Unknown"]}

# BioT5 datasets are formatted using https://github.com/allenai/natural-instructions as a template.

task_id = 200 #arbitrary id number, biot5's task ids go up to 180. 

# for i, row in full_df.iterrows():
#     data_dict["Instances"].append({})
