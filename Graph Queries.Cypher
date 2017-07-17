// Create a table showing a list of the elements
MATCH (n)
RETURN labels(n)[0] AS type,
count(*) AS count,
collect(n.host) AS names

// Show all the applications in the network that face the public
MATCH (website)-[:DEPENDS_ON]->(downstream)
WHERE website.system = "INTERNET"
RETURN website.host AS Host,
collect(downstream.host) AS Dependencies
ORDER BY Host

// Find an area of the network that had the most dependencies

MATCH (n)<-[:DEPENDS_ON*]-(dependent)
RETURN n.host AS Host,
count(DISTINCT dependent) AS Dependents
ORDER BY Dependents DESC
LIMIT 1

// Look at the impact of the removal of a network component

MATCH (application:Application)-[:DEPENDS_ON*]->(server)
WHERE server.host = "HARDWARE-SERVER-3"
RETURN application.type AS Type,
application.host AS Host

// Add a new property for example ownership 
MATCH (n:database) and (n:dataWarehouse)
SET n.owner = ‘DBA1(Mark Smith)’
RETURN n

// To undo this change
MATCH (n:database) and (n:dataWarehouse)
DELETE n.owner
RETURN n
