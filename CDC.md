---
title: CDC
heading:  
date: 2023-04-04T06:18:20.485Z
categories: ["other"]
tags: 
description:  
---

**me：** Is there any method, idea or technology that can monitor various database changes, such as addition, deletion, and modification, and then send events to kafka.

**chatpgt：** Yes, there are several methods, ideas, and technologies that can monitor various database changes and send events to Kafka. Some of them are:

1. Change Data Capture (CDC): CDC technology captures and records all changes made to a database in real-time, including additions, deletions, and modifications. CDC can be used to capture changes from various databases, such as SQL Server, MySQL, Oracle, and PostgreSQL, and send them to Kafka as events.

2. Apache NiFi: Apache NiFi is a data integration and data flow tool that can monitor various data sources, including databases, and send events to Kafka. NiFi can be configured to capture changes made to a database and send them to Kafka as events.

3. Debezium: Debezium is an open-source distributed platform that can capture changes made to a database and send them to Kafka as events. Debezium supports various databases, such as MySQL, PostgreSQL, MongoDB, and Oracle.

4. Apache Kafka Connect: Kafka Connect is a framework that can be used to capture data from various sources and send them to Kafka. Kafka Connect includes various connectors that can be used to capture changes made to a database and send them to Kafka as events.

5. Trigger-based solutions: Trigger-based solutions use triggers in the database to detect changes and send them to Kafka as events. These solutions can be implemented using a combination of programming languages and database-specific libraries or frameworks. For example, in Java, you can use the JDBC API and a library like Debezium or Confluent Kafka JDBC connector to capture database changes and send them to Kafka.

Overall, there are several methods and technologies available to monitor database changes and send events to Kafka. The choice of method or technology depends on the specific requirements of your use case, such as the database being used, the volume of data, and the desired level of reliability and scalability.

**me：** What are the Change Data Capture (CDC) platforms or tools?

**chatpgt：**
There are several Change Data Capture (CDC) platforms or tools available in the market. Some popular CDC platforms or tools are:

1. Debezium: Debezium is an open-source, distributed platform that captures data changes from various databases, including MySQL, PostgreSQL, MongoDB, and Oracle, and sends them to Kafka or other messaging systems.

2. Oracle GoldenGate: Oracle GoldenGate is a CDC platform that captures changes made to an Oracle database and sends them to various targets, including Kafka, Hadoop, and other databases.

3. Apache Kafka Connect: Kafka Connect is a framework that provides connectors to various data sources, including databases, and can be used to capture data changes and send them to Kafka.

4. Attunity: Attunity provides a CDC platform that captures data changes from various databases, including Oracle, SQL Server, and SAP, and sends them to various targets, including Kafka, Hadoop, and cloud data platforms.

5. HVR: HVR provides a CDC platform that captures data changes from various databases and sends them to various targets, including Kafka, Hadoop, and cloud data platforms.

6. Qlik Replicate: Qlik Replicate is a CDC platform that captures data changes from various databases, including Oracle, SQL Server, and SAP, and sends them to various targets, including Kafka, Hadoop, and cloud data platforms.

Overall, CDC platforms or tools provide a way to capture data changes from databases and send them to various targets, including Kafka, for real-time processing, analysis, and integration. The choice of CDC platform or tool depends on the specific requirements of your use case, such as the database being used, the volume of data, and the desired level of reliability and scalability.


