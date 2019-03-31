import json
import requests

api_url_base = 'https://www.blackrock.com/tools/hackathon/performance?graph=resultMap.RETURNS%5BperformanceChart%5D&identifiers=FMC%2CCVGW%2CDE'

def get_stock_perf():

    api_url = api_url_base

    response = requests.get(api_url)

    if response.status_code == 200:
        return json.loads(response.content.decode('utf-8'))
    else:
        return None


performance_info = get_stock_perf()

if performance_info is not None:
    print("Here's your info: ")
    result_map = performance_info['resultMap']
    #print(result_map['RETURNS'])
    for k in result_map['RETURNS']:
        print(k['uniqueId'])
        index = 0
        sum = 0
        for v in k['performanceChart']:
            if(index == 30):
                print(sum/30)
                index=0
                sum=0
            index+=1
            val = float(v[1])
            sum+=val

else:
    print('[!] Request Failed')