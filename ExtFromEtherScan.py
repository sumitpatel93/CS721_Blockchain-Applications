import requests
from os.path import join, splitext
import multiprocessing as mp
import json
import pandas as pd
import time
import os
import sys

csv_address_file = '/Users/apple/Documents/WORK/ScrawlD/data/contracts.csv'
report_dir = '/Users/apple/Documents/WORK/ScrawlD/SmartContractsJson'
keys = ['DU3TWEU4QIDH3MS4ANPQ88T3KRPQA3V7RJ','31G36BUZUT11KBBWHRUZJ36JYHYVW61WCU','XIV62YDPG4XF5W13H99WJVIA1D5ZKEZA8Y']
# Get API Keys from https://etherscan.io

present_dir = os.getcwd()
print("=== present dirc ===", present_dir)


def parse_json(filename):
    with open(filename) as access_json:
        read_content = json.load(access_json)
    results = read_content['result']
    file_to_create = filename.replace('_ext.json','.sol').replace(report_dir,present_dir)
    for result in results:
        with open(file_to_create, 'w') as file:
            file.write(result['SourceCode'])


def etherDownloadApi(file_path, action, module, add, key):
    url = 'https://api.etherscan.io/api?module=' + module + '&action=' + action + '&address=' + add + '&apikey=' + key
    # params = {'apikey': key, 'module': module, 'action': action, 'address':add}
    # # try:
    response = requests.get(url)
    print(add)
    if response.status_code == 200:
        data = response.json()
        with open(file_path, 'w') as f:
            json.dump(data, f)
    # except:
    #     print("Exception for : " + apk_hash)

    # time.sleep(2)


class CheckCount:

    def __init__(self):
        self.totalFiles = 0
        self.completed = 0

    def incCount(self):
        self.totalFiles += 1

    def getTotal(self):
        return self.totalFiles

    def completedCallback(self, res=''):
        self.completed += 1
        print(self.completed, " files Completed out of ", self.totalFiles)


def extractFromEthereum():
    pool = mp.Pool(5)  # X keys, calls per second = 5, roughly X*3=Y works here
    df = pd.read_csv(csv_address_file)
    hashes = df["address"].tolist()
    ProcessingResults = []
    countObj = CheckCount()
    for i in range(len(hashes)):
        contPath = join(report_dir, hashes[i]+ "_ext.json")
        ProcessingResults = pool.apply_async(etherDownloadApi, args=(contPath, 'getsourcecode', 'contract', hashes[i], keys[countObj.getTotal() % len(keys)]), callback=countObj.completedCallback)
        countObj.incCount()

    pool.close()
    pool.join()


if __name__ == '__main__':
    #extractFromEthereum()
    df = pd.read_csv(csv_address_file)
    hashes = df["address"].tolist()
    for i in range(len(hashes)):
        parse_json(join(report_dir, hashes[i]+ "_ext.json"))
