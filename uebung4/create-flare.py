import csv, itertools, json

def cluster(rows):
	result = []
	data = sorted(rows, key=lambda r: r[1])
	for k, g in itertools.groupby(rows, lambda r: r[0]):
		group_rows = [row[1:] for row in g] 
		if len(row[1:]) == 1:
			result.append({"name": row[0],"size": int(row[1])}) 
		else:
			result.append({"name": k,"children": cluster(group_rows)}) 
	return result

rows = list(csv.reader(open("ordered_by_country.tsv","rb"), delimiter='\t')) 
print json.dumps(cluster(rows),indent=2)
