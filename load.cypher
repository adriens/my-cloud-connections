MATCH (n)
WITH n LIMIT 10000
OPTIONAL MATCH (n)-[r]->()
DELETE n,r;

LOAD CSV WITH HEADERS FROM "file:///nodes.csv" AS nodes
CREATE (p:Provider { name: nodes.id });


LOAD CSV WITH HEADERS FROM "file:///edges.csv" AS edges
MATCH (a:Provider { name: edges.source})
MATCH (b:Provider { name: edges.target })
CREATE (a)-[:AUTHENTICATES_ON]->(b);