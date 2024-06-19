import pandas
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--filepath")
args = parser.parse_args()

inpath = args.filepath
outpath = inpath.replace(".xlsx", ".csv")
df = pandas.read_excel(inpath)
df.to_csv(outpath, encoding='utf-8', index=False)