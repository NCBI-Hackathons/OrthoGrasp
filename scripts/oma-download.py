import pandas as pd
import requests
import io

x = ['CAEEL',
    'DANRE',
    'DROME',
    'HUMAN',
    'MOUSE',
    'PANTR',
    'RATNO',
    'TAKRU']

# Submit a query to the server at https://omabrowser.org/cgi-bin/gateway.pl?f=PairwiseOrthologs&p1=[x]&p2=[y]&p3=EnsemblGene
#  where x is the first species that we want to search against
#  where y is the second species that we want to run the search against
for i in x:
    for j in x:
        if i != j:
            payload = {'f': 'PairwiseOrthologs',
                      'p1': i,
                      'p2': j,
                      'p3': 'OMA'}
            r = requests.request('GET', 'https://omabrowser.org/cgi-bin/gateway.pl', params=payload)
            filename = "../data/" + str(i) + "_" + str(j) + "_" + "OMA.csv"
            df = pd.read_csv(io.StringIO(r.content.decode('utf-8')), header=None, delimiter="\t")
            df.to_csv(filename, header=None, index=None, sep="\t")
