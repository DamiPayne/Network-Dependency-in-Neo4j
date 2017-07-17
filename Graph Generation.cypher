//Data restoration packets
// Create CRM
CREATE (crm1:Application {
ip:'10.10.32.1',
host:'CRM-APPLICATION',
type: 'APPLICATION',
system: 'CRM'
})

// Create ERP
CREATE (erp1:Application {
ip:'10.10.33.1',
host:'ERP-APPLICATION',
type: 'APPLICATION',
system: 'ERP'
})

// Create Data Warehouse
CREATE (datawarehouse1:Application {
ip:'10.10.34.1',
host:'DATA-WAREHOUSE',
type: 'DATABASE',
system: 'DW'
})

// Create Public Website 1
CREATE (Internet1:Internet {
ip:'10.10.35.1',
host:'global.XCEED.com',
type: "APPLICATION",
system: "INTERNET"
})

// Create Public Website 2
CREATE (Internet2:Internet {
ip:'10.10.35.2',
host:'support.XCEED.com',
type: "APPLICATION",
system: "INTERNET"
})

// Create Public Website 3
CREATE (Internet3:Internet {
ip:'10.10.35.3',
host:'shop.XCEED.com',
type: "APPLICATION",
system: "INTERNET"
})

// Create Public Website 4
CREATE (Internet4:Internet {
ip:'10.10.35.4',
host:'training.XCEED.com',
type: "APPLICATION",
system: "INTERNET"
})

// Create Public Website 5
CREATE (Internet5:Internet {
ip:'10.10.35.1',
host:'partners.XCEED.com',
type: "APPLICATION",
system: "INTERNET"
})

// Create Internal Website 1
CREATE (Intranet1:Intranet {
ip:'10.10.35.2',
host:'events.XCEED.net',
type: "APPLICATION",
system: "INTRANET"
})

// Create Internal Website 2
CREATE (Intranet2:Intranet {
ip:'10.10.35.3',
host:'intranet.XCEED.net',
type: "APPLICATION",
system: "INTRANET"
})

// Create Internal Website 3
CREATE (Intranet3:Intranet {
ip:'10.10.35.4',
host:'humanresources.XCEED.net',
type: "APPLICATION",
system: "INTRANET"
})

// Create Webserver VM 1
CREATE (webservervm1:VirtualMachine {
ip:'10.10.35.5',
host:'WEBSERVER-1',
type: "WEB SERVER",
system: "VIRTUAL MACHINE"
})

// Create Webserver VM 2
CREATE (webservervm2:VirtualMachine {
ip:'10.10.35.6',
host:'WEBSERVER-2',
type: "WEB SERVER",
system: "VIRTUAL MACHINE"
})

// Create Database VM 1
CREATE (customerdatabase1:VirtualMachine {
ip:'10.10.35.7',
host:'CUSTOMER-DB-1',
type: "DATABASE SERVER",
system: "VIRTUAL MACHINE"
})

// Create Database VM 2
CREATE (customerdatabase2:VirtualMachine {
ip:'10.10.35.8',
host:'CUSTOMER-DB-2',
type: "DATABASE SERVER",
system: "VIRTUAL MACHINE"
})

// Create Database VM 3
CREATE (databasevm3:VirtualMachine {
ip:'10.10.35.9',
host:'ERP-DB',
type: "DATABASE SERVER",
system: "VIRTUAL MACHINE"
})

// Create Database VM 4
CREATE (dwdatabase:VirtualMachine {
ip:'10.10.35.10',
host:'DW-DATABASE',
type: "DATABASE SERVER",
system: "VIRTUAL MACHINE"
})

// Create Hardware 1
CREATE (hardware1:Hardware {
ip:'10.10.35.11',
host:'HARDWARE-SERVER-1',
type: "HARDWARE SERVER",
system: "PHYSICAL INFRASTRUCTURE"
})

// Create Hardware 2
CREATE (hardware2:Hardware {
ip:'10.10.35.12',
host:'HARDWARE-SERVER-2',
type: "HARDWARE SERVER",
system: "PHYSICAL INFRASTRUCTURE"
})

// Create Hardware 3
CREATE (hardware3:Hardware {
ip:'10.10.35.13',
host:'HARDWARE-SERVER-3',
type: "HARDWARE SERVER",
system: "PHYSICAL INFRASTRUCTURE"
})

// Create SAN 1
CREATE (san1:Hardware {
ip:'10.10.35.14',
host:'SAN',
type: "STORAGE AREA NETWORK",
system: "PHYSICAL INFRASTRUCTURE"
})

// Connect CRM to Database VM 1
CREATE (crm1)-[:DEPENDS_ON]->(customerdatabase1)

// Connect Public Websites 1-3 to Database VM 1
CREATE (Internet1)-[:DEPENDS_ON]->(customerdatabase1),
(Internet2)-[:DEPENDS_ON]->(customerdatabase1),
(Internet3)-[:DEPENDS_ON]->(customerdatabase1)

// Connect Database VM 1 to Hardware 1
CREATE (customerdatabase1)-[:DEPENDS_ON]->(hardware1)

// Connect Hardware 1 to SAN 1
CREATE (hardware1)-[:DEPENDS_ON]->(san1)

// Connect Public Websites 1-3 to Webserver VM 1
CREATE (webservervm1)<-[:DEPENDS_ON]-(Internet1),
(webservervm1)<-[:DEPENDS_ON]-(Internet2),
(webservervm1)<-[:DEPENDS_ON]-(Internet3)

// Connect Internal Websites 1-3 to Webserver VM 1
CREATE (webservervm1)<-[:DEPENDS_ON]-(Intranet1),
(webservervm1)<-[:DEPENDS_ON]-(Intranet2),
(webservervm1)<-[:DEPENDS_ON]-(Intranet3)

// Connect Webserver VM 1 to Hardware 2
CREATE (webservervm1)-[:DEPENDS_ON]->(hardware2)

// Connect Hardware 2 to SAN 1
CREATE (hardware2)-[:DEPENDS_ON]->(san1)

// Connect Webserver VM 2 to Hardware 2
CREATE (webservervm2)-[:DEPENDS_ON]->(hardware2)

// Connect Public Websites 4-6 to Webserver VM 2
CREATE (webservervm2)<-[:DEPENDS_ON]-(Internet4),
(webservervm2)<-[:DEPENDS_ON]-(Internet5)

// Connect Database VM 2 to Hardware 2
CREATE (hardware2)<-[:DEPENDS_ON]-(customerdatabase2)

// Connect Public Websites 4-5 to Database VM 2
CREATE (Internet4)-[:DEPENDS_ON]->(customerdatabase2),
(Internet5)-[:DEPENDS_ON]->(customerdatabase2)

// Connect Hardware 3 to SAN 1
CREATE (hardware3)-[:DEPENDS_ON]->(san1)

// Connect Database VM 3 to Hardware 3
CREATE (hardware3)<-[:DEPENDS_ON]-(databasevm3)

// Connect ERP 1 to Database VM 3
CREATE (erp1)-[:DEPENDS_ON]->(databasevm3)

// Connect Database VM 4 to Hardware 3
CREATE (hardware3)<-[:DEPENDS_ON]-(dwdatabase)

// Connect Data Warehouse 1 to Database VM 4
CREATE (datawarehouse1)-[:DEPENDS_ON]->(dwdatabase)

RETURN *
