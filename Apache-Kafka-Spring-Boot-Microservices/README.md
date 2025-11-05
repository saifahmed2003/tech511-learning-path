# Apache Kafka for Event-Driven Spring Boot Microservices

**Overview**

In this video course, you will learn how to use Apache Kafka to build Event-Driven Spring Boot Microservices.

What you will learn:
* What is Apache Kafka, and how to work with it using Command Line Interface(CLI)

You will learn how to use Kafka CLI to : 
* Start multiple Apache Kafka servers in a cluster,
* Work with Kafka Topics,
* Work with Kafka Producer to produce messages,
* Work with Kafka Consumer to consume messages.
  
You will learn how to create a basic Spring Boot Microservice that acts as a Kafka Producer. While working with this Microservice you will learn: 
* How to send Kafka messages synchronously,
* How to send Kafka messages asynchronously,
* How to work with Acknowledgements, Retries, Delivery and Request timeouts.

You will also learn how to create Kafka Consumer Spring Boot Microservice. While creating Consumer Microservice you will learn to: 
* Consume messages from Kafka topic,
* Handle and recover from errors,
* Work with Kafka Dead Letter Topic(DLT),
* Configure multiple consumer microservices to work as a group(Consumer Groups).
* Write Integration tests for Kafka Consumer and Kafka Producer.
* Learn how to implement the Saga design pattern.

All from the very beginning, to help you learn how to create Event-Driven Microservices with Apache Kafka and Spring Boot.

---
- [Apache Kafka for Event-Driven Spring Boot Microservices](#apache-kafka-for-event-driven-spring-boot-microservices)
  - [Introduction to Apache Kafka](#introduction-to-apache-kafka)
    - [What is a Microservice?](#what-is-a-microservice)
    - [Microservice vs Monolithic Application](#microservice-vs-monolithic-application)
    - [Microservices Communication](#microservices-communication)
    - [Event-Driven Architecture with Apache Kafka](#event-driven-architecture-with-apache-kafka)
    - [Apache Kafka for Microservices](#apache-kafka-for-microservices)
    - [Quiz 1](#quiz-1)
    - [Messages and Events in Apache Kafka](#messages-and-events-in-apache-kafka)
    - [Kafka Topic and Partitions](#kafka-topic-and-partitions)
    - [Ordering of Events in Apache Kafka](#ordering-of-events-in-apache-kafka)
    - [Quiz 2](#quiz-2)
  - [Apache Kafka Broker(s)](#apache-kafka-brokers)
    - [What is Apache Kafka broker?](#what-is-apache-kafka-broker)
    - [Apache Kafka broker: Leader and Follower roles and  Leadership balance](#apache-kafka-broker-leader-and-follower-roles-and--leadership-balance)
    - [Quiz 3](#quiz-3)
    - [Download Apache Kafka](#download-apache-kafka)
    - [](#)

---
## Introduction to Apache Kafka
### What is a Microservice?
* Small autonomous application
* Responsible for specific functionality (search, email notification, SMS, notification)
* Loosely coupled, designed to scale and work in the cloud
---
### Microservice vs Monolithic Application
![microservice-vs-monolithic.png](../images/microservice-vs-monolithic.png)
Monolithic:
* if you make a change to one controller you will need to rebuild and redeploy the entire application
* Uses a single database

Microservices
* Database per service pattern - each microservice works with its own database
* can be deployed independently and run on a separate server
---
### Microservices Communication
* One of the ways microservices can communicate with each other is by sending direct HTTP Request and wait for HTTP Response
* **Synchronous HTTP Request** - one microservice sends an HTTP Request to another and waits until it receives an HTTP Response
* **Asynchronous HTTP Request** - one microservice sends an HTTP Request to another and **will not wait** for an immediate request and will instead immediately continue executing the next job; the response will come later and it is callled Future Response
---
### Event-Driven Architecture with Apache Kafka
![event-driven-architecture.png](../images/event-driven-architecture.png)
* If one microservice needs to contact multiple microservices, the direct HTTP Request/Response is no longer helpful
* Instead, we use **Apache Kafka** and **Event-Driven Architecture**
---
### Apache Kafka for Microservices
* **Apache Kafka** is a distributed event streaming platform that is used to collect, process, store and integrate data at scale

![how-apache-kafka-helps-communicate.png](../images/how-apache-kafka-helps-communicate.png)
* if you lose one server you still have your data stored on other servers in kafka cluster
* a broker is a server that manages kafka topics, facilitates writes to partitions and handles replication
* topics store events
* producer publishes an event, this event gets stored in kafka topic, consumer microservices can read this event from that kafka topic
---
### Quiz 1
**Q1: What is Apache Kafka primarily used for?**  
**A: Distributed event streaming**  
Apache Kafka is primarily used as a distributed event streaming platform. It excels in collecting, processing, storing, and integrating large volumes of data in real-time. Kafka allows different systems and applications to publish (produce) and subscribe to (consume) streams of events, making it highly suitable for event-driven architectures.

**Q2: You can run multiple Apache Kafka servers in a cluster. True or False?**  
**A: True**   
Apache Kafka is designed to run as a cluster comprising multiple servers or nodes. This clustered environment is a fundamental aspect of Kafka's architecture, allowing it to achieve high availability, fault tolerance, and scalability. By running multiple servers in a cluster, Kafka can distribute the load and data across different nodes. This setup also ensures that if one server goes down, others in the cluster can continue to handle requests and process data, thereby maintaining the system's resilience and reliability.

**Q3: In the context of Apache Kafka, what is a Producer?**  
**A: A microservice that publishes events**  
This answer is correct. In Apache Kafka, a Producer is indeed a microservice, application, or process that publishes (produces) events or messages to Kafka topics. Producers send data to Kafka brokers, which then store the data in topics.  

**Q4: In the context of Apache Kafka, what is a Consumer?**   
**A: A microservice that consumes or reads events from Kafka topics**  
This answer is correct. In Apache Kafka, a Consumer is indeed a microservice or a process that consumes or reads events or messages from Kafka topics. Consumers subscribe to one or more Kafka topics and process the stream of records produced to those topics.

**Q5: In the context of Apache Kafka, what is a Broker?**   
**A: A server that manages Kafka topics, facilitates writes to partitions, and handles replication**  
In Apache Kafka, a Broker is indeed a server that performs several critical functions. It manages Kafka topics, handles the storage of data into topic partitions, manages replication of data for fault tolerance, and serves client requests (from both Producers and Consumers).

---
### Messages and Events in Apache Kafka
* In Apache Kafka, an event is an indication that something has happened
* Naming convention: `<Noun><PerformedAction><Event>`
* Kafka message carries event data inside (can be string, JSON, Avro, null)
* Kafka message is a key-value pair and has timestamp; can also have headers
---
### Kafka Topic and Partitions
* Topic is a place where kafka stored all published messages

![kafka-topic.png](../images/kafka-topic.png)
![topic-diagram.png](../images/topic-diagram.png)

---
### Ordering of Events in Apache Kafka
* kafka will store events in the same partition with other events with the same message key

![events-message-key.png](../images/events-message-key.png)

---
### Quiz 2
**Q1: What is a Kafka Topic primarily used for in the Kafka architecture?**   
**A: Organizing streams of messages for publish-subscribe systems**   
Kafka Topics are used to group, organize, and label your data streams so that you can easily send and receive data from them. For example, you can have a topic for weather data and another topic for traffic data. Producers can send data to any topic they want, and consumers can subscribe to any topic they are interested in.

**Q2: What does a Partition within a Kafka Topic represent?**   
**A: A division in the topic for load balancing and parallel processing**   
A topic is a category or a log for a stream of data. Partitions are used to split a topic into smaller pieces so that more than one server or consumer can handle the data at the same time. This helps to balance the workload and speed up the processing.

**Q3: How does Kafka ensure message ordering in a Topic Partition?**  
**A: By appending messages in the order they are sent within each partition**   
Kafka appends messages in the order they are sent within each partition. This means that the first message sent to a partition will be the first message read from that partition, and so on. Kafka does not use timestamps, random algorithms, or message size to order messages in a partition — it only considers the arrival time of messages from the producer.

**Q4: Can a single Kafka Topic have multiple Partitions?**  
**A: Yes**  
A Kafka Topic is like a folder where you can store and organize your data. A Kafka Topic can be divided into multiple smaller folders called partitions, which can be stored on different servers. This helps to distribute the workload and speed up the processing.

**Q5: How does Kafka ensure message ordering across partitions?**   
**A: By using a key for each message and partitioning by the hash of the key**   
Kafka uses keys to ensure message ordering across partitions. A key is an optional attribute of a message that can be used to group messages by some criteria. For example, you can use a user ID as a key to group messages by the same user. Kafka uses a hash function to map each key to a partition. This way, all messages with the same key will go to the same partition and will be ordered by their arrival time from the producer.  

**Q3: You can increase the number of partitions in a Kafka topic to scale. But once set, partitions can’t be reduced.**   
**A: True**   
As per the latest update of this quiz, the number of partitions can only be increased; decreasing the number of partitions is not possible.

---
## Apache Kafka Broker(s)
### What is Apache Kafka broker?
* you can think of it as Kafka server, a server that runs Kafka processes
* broker is a program that you run either on your physical computer or virtual machine
* starting multiple brokers in a cluster makes your system fault tolerant
* one broker will act as a leader and all other brokers will act as followers
* each broker hosts topics which stores events in partitions
---
### Apache Kafka broker: Leader and Follower roles and  Leadership balance
* followers replicate data from the leader in exact order it was written, maintaining data consistency
* leader is a single source of truth for all writes and reads in topic partition
* if the leader fails one of the followers can take over
* followers also allow you to scale your Kafka cluster horizontally
* each partition will have its own leader and its own follower
---
### Quiz 3
**Q1: What is the primary role of a broker in Apache Kafka?** 
**A: To store, manage, and distribute messages in the Kafka messaging system**  
A Kafka broker is an Apache Kafka component that stores, manages, and distributes messages in the Kafka messaging system. A broker hosts a set of partitions and handles incoming requests to write new events to those partitions or read events from them. It also handles replication of partitions between other brokers. This is the main function of a broker, as it enables Kafka to provide high-throughput, low-latency, and fault-tolerant data delivery.  

**Q2: How does Kafka ensure message durability?**
**A: By replicating messages across multiple brokers**  
Kafka ensures message durability through replication. Each message published to a Kafka topic can be replicated across multiple brokers. This means that even if one broker fails, the data remains available on other brokers. Replication is a key feature in Kafka that guarantees high availability and durability of data.  

**Q3: What happens when a Kafka broker goes down?**  
**A: Kafka redistributes the load to other brokers**  
If a broker in a Kafka cluster goes down, Kafka redistributes the workload among the remaining brokers. This includes reassigning the leader for the partitions that were on the failed broker. Kafka’s distributed nature allows it to handle failures gracefully and maintain continuous operation.  

**Q4: What is the role of a Leader broker in a Kafka cluster?**  
**A: To handle all read and write requests for a specific partition**  
In Kafka, each partition of a topic has one leader broker. The leader handles all read and write requests for that partition. This centralizes data management, ensuring consistency and efficiency in data handling.  

**Q5: What is the role of a Follower broker in a Kafka cluster?**  
**A: To replicate data from the leader broker for the assigned partitions**  
The primary role of a follower broker is to replicate data from the leader broker for the assigned partitions. Followers continually fetch data from their leader to ensure data redundancy and high availability. If the leader broker fails, a follower can be elected as the new leader, ensuring the partition stays available and no data is lost.  

**Q6: What happens when a leader broker for a partition becomes unavailable?**  
**A: A follower broker is automatically elected as the new leader**  
Kafka’s high availability design includes automatic leader election. When a leader broker for a partition becomes unavailable, one of its follower brokers—already replicating the data—is promoted as the new leader. This guarantees continuous availability and accessibility of the partition.  

---
### Download Apache Kafka
Download: https://kafka.apache.org/downloads

---
###