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
    - [Start single Apache Kafka broker with KRaft](#start-single-apache-kafka-broker-with-kraft)
    - [Multiple Kafka broker: Configuration Files](#multiple-kafka-broker-configuration-files)
    - [Multiple Kafka broker: Configuration Files](#multiple-kafka-broker-configuration-files-1)
    - [Starting multiple Kafka broker with KRaft](#starting-multiple-kafka-broker-with-kraft)
    - [Stopping Apache Kafka brokers](#stopping-apache-kafka-brokers)
  - [Kafka CLI: Topics](#kafka-cli-topics)
    - [Introduction to Kafka Topic CLI](#introduction-to-kafka-topic-cli)
    - [Creating a new Kafka topic](#creating-a-new-kafka-topic)
    - [List and describe Kafka topics](#list-and-describe-kafka-topics)
    - [Deleting Kafka Topic](#deleting-kafka-topic)
  - [Kafka CLI: Producers](#kafka-cli-producers)
    - [Introduction to Kafka Producer CLI](#introduction-to-kafka-producer-cli)
    - [Producing Kafka Message without a Key](#producing-kafka-message-without-a-key)
    - [Sending Kafka Message as a Key:Value Pair](#sending-kafka-message-as-a-keyvalue-pair)
  - [Kafka CLI: Consumers](#kafka-cli-consumers)
    - [Introduction to Kafka Consumer CLI](#introduction-to-kafka-consumer-cli)
    - [Consuming messages from Kafka topic from the beginning](#consuming-messages-from-kafka-topic-from-the-beginning)
    - [Consuming new Kafka messages only](#consuming-new-kafka-messages-only)
    - [Consuming Key:Value pair messages from Kafka topic](#consuming-keyvalue-pair-messages-from-kafka-topic)
    - [Consuming Kafka messages in order](#consuming-kafka-messages-in-order)
  - [Kafka Producer - Spring Boot Microservice](#kafka-producer---spring-boot-microservice)
    - [Introduction to Kafka Producer](#introduction-to-kafka-producer)
    - [Kafka Producer - Introduction to synchronous communication style](#kafka-producer---introduction-to-synchronous-communication-style)
    - [Kafka Producer - A use case for asynchronous communication style](#kafka-producer---a-use-case-for-asynchronous-communication-style)
    - [Quiz 4](#quiz-4)
    - [Creating a new Spring Boot project](#creating-a-new-spring-boot-project)
    - [Kafka Producer configuration properties](#kafka-producer-configuration-properties)
    - [Creating Kafka Topic](#creating-kafka-topic)
    - [Run Microservice to create a new Kafka topic](#run-microservice-to-create-a-new-kafka-topic)
    - [Creating Rest Controller](#creating-rest-controller)
    - [Creating a Service class](#creating-a-service-class)
    - [Creating an Event class](#creating-an-event-class)
    - [Kafka Producer: Send Message Asynchronously](#kafka-producer-send-message-asynchronously)
    - [Kafka Asynchronous Send. Trying how it works.](#kafka-asynchronous-send-trying-how-it-works)
    - [Kafka Producer: Send Message Synchronously](#kafka-producer-send-message-synchronously)
    - [Kafka Producer: Handle Exception in Rest Controller](#kafka-producer-handle-exception-in-rest-controller)
    - [Kafka Producer: Logging Record Metadata Information](#kafka-producer-logging-record-metadata-information)
    - [Kafka Synchronous Send. Trying how it works.](#kafka-synchronous-send-trying-how-it-works)
  - [Kafka Producer: Acknowledgements \& Retires](#kafka-producer-acknowledgements--retires)
    - [Kafka Producer Acknowledgement: Introduction](#kafka-producer-acknowledgement-introduction)
    - [Kafka Producer Retries: Introduction](#kafka-producer-retries-introduction)
    - [Configure Producer Acknowledgments in Spring Boot Microservice](#configure-producer-acknowledgments-in-spring-boot-microservice)
    - [The min.insync.replicas configuration](#the-mininsyncreplicas-configuration)
    - [Trying how the min.insync.replicas works](#trying-how-the-mininsyncreplicas-works)
    - [Kafka Producer Retries](#kafka-producer-retries)
    - [Trying how Kafka Producer Retries work](#trying-how-kafka-producer-retries-work)
    - [Kafka Producer Delivery \& Request Timeout](#kafka-producer-delivery--request-timeout)
    - [Trying how Kafka Producer Delivery \& Request Timeout works](#trying-how-kafka-producer-delivery--request-timeout-works)
    - [Quiz 5: Quiz: Kafka Producer Acknowledgements and Retries](#quiz-5-quiz-kafka-producer-acknowledgements-and-retries)
    - [Kafka Producer Spring Bean Configuration](#kafka-producer-spring-bean-configuration)

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
* Download: https://kafka.apache.org/downloads
* Version 3.6.0

---
### Start single Apache Kafka broker with KRaft
Navigate to the kafka  folder
```
cd kafka_2.13-3.6.1/
```
Generate a unique ID for your Kafka cluster
```
./bin/kafka-storage.sh random-uuid
```
You should see something like this
```
kq23bZZYRbmYy2XQ0y2m4A
```
Format log directories using this unique ID
```
./bin/kafka-storage.sh format -t kq23bZZYRbmYy2XQ0y2m4A -c config/kraft/server.properties
```
Run:
```
./bin/kafka-server-start.sh config/kraft/server.properties
```
You should see
```
[2025-11-06 13:48:35,679] INFO [KafkaRaftServer nodeId=1] Kafka Server started (kafka.server.KafkaRaftServer)
```
To stop your current kafka server press:
```
CTRL + C
```
---
### Multiple Kafka broker: Configuration Files
Go to "C:\Users\sohai\kafka_2.13-3.6.1\config\kraft" and duplicate `server.properties` 3 times and rename them as shown in the image `server-1.properties`, `server-2.properties` and `server-3.properties`
![multiple-kafka-broker.png](../images/multiple-kafka-broker.png)

Open all 3 config files in a text editor and change the `node_id` for all 3 files
```
node.id=<INSERT SERVER NUMBER>
```
Change the listeners in server 2 to:
```
listeners=PLAINTEXT://:9094,CONTROLLER://:9095
```
Change the listeners in server 3 to:
```
listeners=PLAINTEXT://:9096,CONTROLLER://:9097
```
Change controller.quorom.voters in all 3 files to:
```
controller.quorum.voters=1@localhost:9093,2@localhost:9095,3@localhost:9097
```
Change the active listeners in server 2 to:
```
advertised.listeners=PLAINTEXT://localhost:9094
```
Change the active listeners in server 3 to:
```
advertised.listeners=PLAINTEXT://localhost:9096
```
In all 3 files change the log.dirs to:
```
log.dirs=/tmp/server-<INSERT SERVER NUMBER>/kraft-combined-logs
```

---
### Multiple Kafka broker: Configuration Files
In GitBash Run:
```
./bin/kafka-storage.sh random-uuid
```
You should see something like
```
f9R72gZhQi6L_dRJ4gvTWQ
```
Run
```
./bin/kafka-storage.sh format -t f9R72gZhQi6L_dRJ4gvTWQ -c config/kraft/server-1.properties
```
Then
```
./bin/kafka-storage.sh format -t f9R72gZhQi6L_dRJ4gvTWQ -c config/kraft/server-2.properties
```
Finally
```
./bin/kafka-storage.sh format -t f9R72gZhQi6L_dRJ4gvTWQ -c config/kraft/server-3.properties
```
You should see for all
```
Formatting /tmp/server-<INSERT SERVER NUMBER>/kraft-combined-logs with metadata.version 3.6-IV2.
```

---
### Starting multiple Kafka broker with KRaft

In 3 separate GitBash windows run:
```
./bin/kafka-server-start.sh config/kraft/server-<INSERT SERVER NUMBER>.properties
```
You should see all 3 up and running

---
### Stopping Apache Kafka brokers
* Stopping Producers and Consumers first
  * avoid losing messages
  * avoid errors
* Stopping Kafka Server
  * `CTRL + C`
  * `kafka-server-stop.sh` - graceful shutdown

Running in a new terminal:
```
./bin/windows/kafka-server-stop.bat
```
You should see for all 3 servers
```
Instance deletion successful.
```
---
## Kafka CLI: Topics
### Introduction to Kafka Topic CLI
Kafka CLI: `kafka-topics.sh` can be used to:
* create a new topic
* list
* describe
* delete
* modify

---
### Creating a new Kafka topic
Start your Kafka cluster
```
cd kafka_2.13-3.6.1/
./bin/kafka-storage.sh random-uuid
./bin/kafka-storage.sh format -t RomNcfLEQFeuXCGdC2UuGg -c config/kraft/server.properties
./bin/kafka-server-start.sh config/kraft/server.properties
```
Open a separate terminal and cd into bin folder
```
cd kafka_2.13-3.6.1/bin
```
To create a kafka topic run
```
./kafka-topics.sh --create --topic topic1 --partitions 3 --replication-factor 1 --bootstrap-server localhost:9092
```
To create a new topic just change the topic name
```
./kafka-topics.sh --create --topic topic2 --partitions 3 --replication-factor 1 --bootstrap-server localhost:9092
```
---
### List and describe Kafka topics
To list topics
```
./kafka-topics.sh --list --bootstrap-server localhost:9092
```
You should see
```
topic1
topic2
```
To describe topics
```
./kafka-topics.sh --describe --bootstrap-server localhost:9092
```
You should see
```
        Topic: topic1   Partition: 0    Leader: 1       Replicas: 1     Isr: 1
        Topic: topic1   Partition: 1    Leader: 1       Replicas: 1     Isr: 1
        Topic: topic1   Partition: 2    Leader: 1       Replicas: 1     Isr: 1
Topic: topic2   TopicId: 64TEESfASQuIWdJ1EusmHQ PartitionCount: 3       ReplicationFactor: 1    Configs: segment.bytes=1073741824
        Topic: topic2   Partition: 0    Leader: 1       Replicas: 1     Isr: 1
        Topic: topic2   Partition: 1    Leader: 1       Replicas: 1     Isr: 1
        Topic: topic2   Partition: 2    Leader: 1       Replicas: 1     Isr: 1
```
---
### Deleting Kafka Topic
To delete kafka topic whilst in the bin folder
```
./kafka-topics.sh --delete --topic topic1 --bootstrap-server localhost:9092
```
To confirm its gone run
```
./kafka-topics.sh --list --bootstrap-server localhost:9092
```

---
## Kafka CLI: Producers
### Introduction to Kafka Producer CLI
The main use of `kafka-console-producer.sh` script is to send a message to a particular Kafka topic:
* send message with a key
* send message without a key
* send multiple messages from a file 

---
### Producing Kafka Message without a Key
Start your kafka cluster and in a separate folder `cd` into your bin folder
```
cd kafka_2.13-3.6.1/bin
```
Run the following script
```
./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic my-topic
```
* if you send a message to a topic like `Hello world` that does not exist kafka producer will respond with error but will also automatically create it
* best practice is to create the topic first then send the message

To stop sending messages press `CTRL + C`

---
### Sending Kafka Message as a Key:Value Pair
* messages sent with the same key are stored in the same partition so they are ordered

Run
```
./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic my-topic --property "parse.key=true" --property "key.separator=:"
```
Then you can start sending messages as a key value pair
```
>firstName:Saif
```

---
## Kafka CLI: Consumers
### Introduction to Kafka Consumer CLI

The main use of `kafka-console-consumer.sh` is to fetch and display messages from a Kafka topic to your terminal
* read new messages only
* read all messages from the beginning

---
### Consuming messages from Kafka topic from the beginning
In a separate folder `cd` into your bin folder
```
cd kafka_2.13-3.6.1/bin
```
Run
```
./kafka-console-consumer.sh --topic my-topic --from-beginning --bootstrap-server localhost:9092
```
You should see all the messages sent in order

Open another window and run producer script
```
./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic my-topic
```
Send a message like
```
>Hello world 5
```
You should see it show up in the other window below the list of previous messages (consumer)

Open a new window and run the same consumer script
```
./kafka-console-consumer.sh --topic my-topic --from-beginning --bootstrap-server localhost:9092
```
Go back to the producer window and send another message
```
>Hello world 6
```
You should see it show up in both consumer windows

---
### Consuming new Kafka messages only
Dont use the `--from-beginning` parameter
```
./kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092
```
Go back to the producer window and send another message
```
>Hello world 7
```
You should see that only `Hello world 7` is shown not any previous messages

---
### Consuming Key:Value pair messages from Kafka topic
Use `CTRL + C` to stop the producer script and then Run
```
./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic my-topic --property "parse.key=true" --property "key.separator=:"
```
Stop one of the consumers using `CTRL + C` and then run in the consumer window
```
./kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092
```
In the producer window run
```
>firstName:Saif
```
You will see it in both consumer windows

Stop one of the consumers using `CTRL + C` and then run in the consumer window
```
./kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092 --property print.key=true
```
In the producer window run
```
>lastName:Ahmed
```
You should see in the consumer window the key and the value
```
lastName      Ahmed
```
To explicitly display all messages from the beginning with key and value 
```
./kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092 --property print.key=true --property print.value=true --from-beginning
```
You should see all the previous messages with a key and a value

To hide the value run
```
./kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9092 --property print.key=true --property print.value=false --from-beginning
```
---
### Consuming Kafka messages in order
Create a new topic
```
./kafka-topics.sh --create --topic messages-order --partitions 3 --replication-factor 3 --bootstrap-server localhost:9092
```
You should see
```
Created topic messages-order
```
Run to produce messages
```
./kafka-console-producer.sh --topic messages-order --bootstrap-server localhost:9092 --property "parse.key=true" --property "key.separator=:"
```
Type these messages with the same key `1`
```
1:First message
1:Second message
1:Third message
1:Fourth message
1:Fifth message
1:Sixth message
```
Then send messages each with a different key
```
a:a
b:b
c:c
d:d
e:e
f:f
g:g
```
Press `CTRL + C` and Run
```
./kafka-console-consumer.sh --topic messages-order --bootstrap-server localhost:9092 --from-beginning --property print.key=true
```
You should see messages with the same key are ordered and those that have different keys are not ordered

---
## Kafka Producer - Spring Boot Microservice
### Introduction to Kafka Producer
* the primary role of kafka producer is to publish events or messages to one or more kafka topics
* we use spring for apache kafka library
* another responsibility of kafka producer is to serialize messages to binary format
* another responsibility is to specify topic name
* an optional responsibility is to specify topic partition
* another responsibility is to choose which partition to write event data to 
---
### Kafka Producer - Introduction to synchronous communication style
Communication Style
* Synchronous
* Asynchronous

Sending Message Synchronously
* sender sends a request and then waits for a response before proceeding
* if orders microservice wants to know that the order created event was successfully stored in kafka broker it will use kafka producer to send kafka message using synchronous communication style
* because kafka producer is waiting for a response it is blocked or put on hold until the response from kafka broker is received

---
### Kafka Producer - A use case for asynchronous communication style
Sending Messages Asynchronously
* kafka producer sends a message to kafka broker but it is not put on hold after and it is not blocked whilst waiting for response from kafka broker
* it will still receive a response from broker but at a later point

---
### Quiz 4

**Q1: What is the primary function of a Kafka Producer?** 
**A: To write data to Kafka topics**  
This answer is correct. The main role of a Kafka Producer is to write data to Kafka topics. Producers are client applications that send streams of data to topics within the Kafka cluster. The producer determines which topic the data should be sent to and can also specify a key that influences the partition within the topic to which the data is sent.  

**Q2: How does a Kafka Producer determine which partition to send a message to?**   
**A: Based on a provided message key or round-robin if no key is provided.**  
This answer is correct. Kafka Producers use a message key to determine which partition a message should be sent to within a topic. If a key is provided, Kafka consistently assigns all messages with that key to the same partition. If no key is provided, Kafka uses a round-robin method to distribute messages evenly across the available partitions.

**Q3: What library is typically used to integrate Kafka functionality into a Spring Boot application?**   
**A: Spring for Apache Kafka**  
This answer is correct. Spring for Apache Kafka is the library commonly used for integrating Kafka with a Spring Boot application. It simplifies the process of working with Kafka by providing a higher-level abstraction that fits well within the Spring ecosystem, making it easier to send and receive messages to and from Kafka topics.  

**Q4: In a Kafka Producer, what is the responsibility related to message serialization?**   
**A: To serialize messages into a binary format for transmission**  
This answer is correct. One of the key responsibilities of a Kafka Producer is to serialize messages into a binary format before they are transmitted over the network to Kafka brokers. Serialization converts the message data, which might be in various formats (like strings, objects, etc.), into a standard binary format that can be efficiently transmitted and stored in Kafka.  

**Q5: In the context of the Orders Microservice acting as a Kafka Producer, what characterizes the synchronous communication style with the Kafka Broker?**   
**A: The Orders Microservice sends an Order Created Event and waits for an acknowledgment from the Kafka Broker before responding back to the Mobile Application.**    
This answer is correct. This option accurately reflects the synchronous communication style as described. In synchronous communication, the sender (in this case, the Orders Microservice) waits for a response after sending a request (the Order Created Event) to ensure that the message was successfully stored in the Kafka Broker. This approach is used when the sender needs confirmation of successful message delivery, such as when creating an order, and it is crucial to know whether the operation was successful before proceeding.

**Q6: How does the Kafka Producer behave when sending a User LoggedIn Event to the Kafka Broker asynchronously?**  
**A: The Kafka Producer sends the User LoggedIn Event and continues its execution right away without waiting for an acknowledgment from the Kafka Broker**  
This answer is correct. This option correctly represents asynchronous communication. In asynchronous communication, the Kafka Producer sends the User LoggedIn Event to the Kafka Broker and then immediately proceeds with its next task without waiting for a response from the Kafka Broker. This approach allows for efficient processing, especially in scenarios where immediate confirmation of message delivery is not critical.  

---
### Creating a new Spring Boot project
Visit in broswer: https://start.spring.io/

The settings you must choose:
* Project - Maven
* Language - Java
* Spring Boot - Latest stable version (3.5.7)
* Project Metadata
  * Group - com.appsdeveloperblog.ws
  * Artifact - ProductsMicroservice
  * Name - ProductsMicroservice
  * Description - Products Microservice
  * Package name - com.appsdeveloperblog.ws.products
  * Packaging - Jar
  * Java - 17

Add the following dependencies:
* Spring Web
* Spring for Apache Kafka

Click on the generate button which will download it to your computer

![start.spring.io.png](../images/start.spring.io.png)

Unzip it to a folder called `Event-driven-microservices-with-apache-kafka`

Install the Spring Boot Tools Suite

Open the folder `Event-driven-microservices-with-apache-kafka`

---
### Kafka Producer configuration properties
Navigate to `ProductsMicroservices/src/main/resources/application.properties` and paste the following code:
```
server.port=0

spring.kafka.producer.bootstrap-servers=localhost:9092, localhost:9094
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
```

---
### Creating Kafka Topic

Create a new class `KafkaConfig.java` in the path: `src\main\java\com\appsdeveloperblog\KafkaConfig.java`

Paste the following content:
```
package com.appsdeveloperblog;

import java.util.Map;

import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;

@Configuration
public class KafkaConfig {

    @Bean
    NewTopic createTopic() {
        return TopicBuilder.name("product-created-events-topic")
                .partitions(3)
                .replicas(3)
                .configs(Map.of("min.insync.replicas", "2"))
                .build();
    }
}
```

---
### Run Microservice to create a new Kafka topic
Make sure your kafka service is up and running

Run `KafkaConfig.java` by starting the application

In a GitBash terminal, change directories to the kafka folder

To check if the topic exists run:
```
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic product-created-events-topic
```
You should see the new topic with 3 partitions 

---
### Creating Rest Controller
Create `ProductController.java` in the main root of your folder and put it to a package called `rest`

Paste this inside:
```
package com.appsdeveloperblog.ws.products.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/products") // http://localhost:<port>/products
public class ProductController {

    @PostMapping
    public ResponseEntity<String> createProduct(@RequestBody CreateProductRestModel product) {
        return ResponseEntity.status(HttpStatus.CREATED).body("");
    }
}
```
Hover over `CreateProductRestModel` and click create class

Paste this in:
```
package com.appsdeveloperblog.ws.products.rest;

import java.math.BigDecimal;

public class CreateProductRestModel {

    private String title;
    private BigDecimal price;
    private Integer quantity;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
```

---
### Creating a Service class
Select the root package and create a new interface `ProductService`. Put it into a new package called `service`

Paste this in:
```
package com.appsdeveloperblog.ws.products.service;

import org.springframework.stereotype.Service;
import com.appsdeveloperblog.ws.products.rest.CreateProductRestModel;

@Service
public class ProductServiceImpl implements ProductService {

    @Override
    public String createProduct(CreateProductRestModel productRestModel) {
        // TODO Auto-generated method stub
        return null;
    }
}
```

In the same package create a new class `ProductServiceImpl`. Click on the add button and choose `ProductService`

Change `ProductController.java`:
```
package com.appsdeveloperblog.ws.products.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.appsdeveloperblog.ws.products.service.ProductService;

@RestController
@RequestMapping("/products") // http://localhost:<port>/products
public class ProductController {

    ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public ResponseEntity<String> createProduct(@RequestBody CreateProductRestModel product) {
        
        String productId = productService.createProduct(product);
        
        return ResponseEntity.status(HttpStatus.CREATED).body("productId");
    }
}
```

---
### Creating an Event class
In the same service package create a class `ProductCreatedEvent` and package `service`

Paste:
```
package com.appsdeveloperblog.ws.products.service;

import java.math.BigDecimal;

public class ProductCreatedEvent {

    private String productId;
    private String title;
    private BigDecimal price;
    private Integer quantity;

    public ProductCreatedEvent() {
    }

    public ProductCreatedEvent(String productId, String title, BigDecimal price, Integer quantity) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
    }
}
```

Right click the mouse and click `Generate Getters and Setters...` and select all fields.

---
### Kafka Producer: Send Message Asynchronously

Open `ProductServiceImpl.java` and paste so it looks like this:
```
package com.appsdeveloperblog.ws.products.service;

import java.util.UUID;
import java.util.concurrent.CompletableFuture;

import org.apache.kafka.clients.producer.RecordMetadata;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.appsdeveloperblog.ws.products.rest.CreateProductRestModel;

@Service
public class ProductServiceImpl implements ProductService {

    KafkaTemplate<String, ProductCreatedEvent> kafkaTemplate;
    private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    public ProductServiceImpl(KafkaTemplate<String, ProductCreatedEvent> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    @Override
    public String createProduct(CreateProductRestModel productRestModel) {

        String productId = UUID.randomUUID().toString();

        // TODO: Persist Product Details into database table before publishing an Event

        ProductCreatedEvent productCreatedEvent = new ProductCreatedEvent(
            productId,
            productRestModel.getTitle(),
            productRestModel.getPrice(),
            productRestModel.getQuantity()
        );

        CompletableFuture<SendResult<String, ProductCreatedEvent>> future =
            kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent);

        future.whenComplete((result, exception) -> {

            if (exception != null) {
                LOGGER.error("Failed to send message: " + exception.getMessage());
            } else {
                LOGGER.info("Message sent successfully: " + result.getRecordMetadata());
            }

        });

        return productId;
    }
}
```

---
### Kafka Asynchronous Send. Trying how it works.

Add before `return productId;`

```
LOGGER.info("Returning product id")
```

Go to terminal window and make sure your kafka servers are running

Then run the consumer script
```
./bin/kafka-console-consumer.sh --topic product-created-events-topic --bootstrap-server localhost:9092 --property print.key=true
```

Go back and press the spring boot button to show the boot dashboard then start up ProductsMicroservice.

Go to Postman and create a new HTTP POST Request sent to ProductsMicroservice running on local host. 

Look at the logs to see that `Tomcat  started on port 58806` so that is the port we will use.

The link should be
```
http://localhost:58806/products
```
Click the body tab, select raw and JSON

Provide a JSON payload by typing the following code:
```
{
  "title": "iPhone 11",
  "price": 800,
  "quantity": 19
}
```

Click Send to send the request and you should see a successful response with the productId 

---
### Kafka Producer: Send Message Synchronously

1st way:
 Before `LOGGER.info` add 
 ```
future.join():
 ```

another way is:

Remove this block
```
future.whenComplete((result, exception) -> {

    if (exception != null) {
        LOGGER.error("Failed to send message: " + exception.getMessage());
    } else {
        LOGGER.info("Message sent successfully: " + result.getRecordMetadata());
    }

});
```
Then change
```
CompletableFuture<SendResult<String, ProductCreatedEvent>> future = kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent);
```
to
```
SendResult<String, ProductCreatedEvent> result = kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent).get();
```
then change
```
@Override
    public String createProduct(CreateProductRestModel productRestModel) {
```
to
```
@Override
    public String createProduct(CreateProductRestModel productRestModel) throws Exception {
```
then open `ProductService.java` and change
```
String createProduct(CreateProductRestModel productRestModel) throws Exception ;
```

---
### Kafka Producer: Handle Exception in Rest Controller

Open `ProductController.java` and fix the compile time error

Hover over the error message on `createProduct` and click `Surround with try/catch`

Create a new class in the same package as the controller called `ErrorMessage`

Paste so it looks like this
```
package com.appsdeveloperblog.ws.products.rest;

import java.util.Date;

public class ErrorMessage {
    
    private Date timestamp;
    private String message;
    private String details;
    
    public ErrorMessage() {
    }
    
    public ErrorMessage(Date timestamp, String message, String details) {
        super();
        this.timestamp = timestamp;
        this.message = message;
        this.details = details;
    }
}
```
Then right click and click `Source` then `Generate Getters and Setters...`. Select all fields and click `Generate`

Finally change `ProductController.java` so it looks like this
```
package com.appsdeveloperblog.ws.products.rest;

import java.util.Date;

import org.slf4j.LoggerFactory;

package com.appsdeveloperblog.ws.products.rest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.appsdeveloperblog.ws.products.service.ProductService;

@RestController
@RequestMapping("/products") //http://localhost:<port>/products
public class ProductController {
    
    ProductService productService;
    private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
    
    public ProductController(ProductService productService) {
        this.productService = productService;
    }
    
    @PostMapping
    public ResponseEntity<Object> createProduct(@RequestBody CreateProductRestModel product) {
        
        String productId;
        try {
            productId = productService.createProduct(product);
        } catch (Exception e) {
            //e.printStackTrace();
            LOGGER.error(e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorMessage(new Date(), e.getMessage(), "/products"));
        }
        
        return ResponseEntity.status(HttpStatus.CREATED).body(productId);
    }
}
```

---
### Kafka Producer: Logging Record Metadata Information

Open `ProductServiceImpl.java` and add this line before `SendResult<String, ProductCreatedEvent> result = kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent).get();`

```
LOGGER.info("Before publishing a ProductCreatedEvent");
```

Then after `SendResult<String, ProductCreatedEvent> result = kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent).get();` write

```
LOGGER.info("Partition: " + result.getRecordMetadata().partition());
LOGGER.info("Topic: " + result.getRecordMetadata().topic());
LOGGER.info("Offset: " + result.getRecordMetadata().offset());
```

---
### Kafka Synchronous Send. Trying how it works.

Ensure you have kafka servers running

Expand the spring boot dashboard and start up ProductMicroservice

Find the port number that it is running in the console and now go to terminal and start up kafka consumer script

```
./bin/kafka-console-consumer.sh --topic product-created-events-topic --bootstrap-server localhost:9092 --property print.key=true
```

Go to Postman and create a new HTTP POST Request sent to ProductsMicroservice running on local host. 

The link should be
```
http://localhost:<PORT-NUMBER>/products
```
Click the body tab, select raw and JSON

Provide a JSON payload by typing the following code:
```
{
  "title": "iPhone 11",
  "price": 800,
  "quantity": 19
}
```

Click Send to send the request and you should see a successful response

---
## Kafka Producer: Acknowledgements & Retires
### Kafka Producer Acknowledgement: Introduction

* **spring.kafka.producer.acks=all** Waits for an acknowledgement from all brokers.

* **spring.kafka.producer.acks=1** Waits for an acknowledgement from a leader broker only.

* **spring.kafka.producer.acks=0** Does not wait for an acknowledgement.

* Kafka producer will wait for acknowledgement not just from any broker but only from in-sync replicas
* you can configure the minimum number of replicas that you want to receive an acknowledgment from with `--config min.insync.replicas=`
---
### Kafka Producer Retries: Introduction

When kafka producer sends a message to a broker there can be:

* **No response** – if the producer is configured with `acks=0`  
* **Acknowledgement (ACK)** of Successful Storage  
* **Non-Retryable Error** – A permanent problem that is unlikely to be resolved by retries.  
* **Retryable Error** – A temporary problem that can be resolved by retrying the send operation.  

* `spring.kafka.producer.retries=10` How many times Kafka Producer will try to send a message before marking it as failed. Default value is `2147483647`.

`spring.kafka.producer.properties.retry.backoff.ms=1000` How long the producer will wait before attempting to retry a failed request. Default value is `100 ms`.

* `spring.kafka.producer.properties.delivery.timeout.ms=120000` The maximum time the Producer can spend trying to deliver the message. Default value is `120000 ms` (2 minutes).

```
delivery.timeout.ms >= linger.ms + request.timeout.ms
```

* `spring.kafka.producer.properties.linger.ms=0` The maximum time in milliseconds that the producer will wait and buffer data before sending a batch of messages.  
The default value is `0`.

* `spring.kafka.producer.properties.request.timeout.ms=30000` The maximum time to wait for a response from the broker after sending a request. The default value is `30000 ms`.
---
### Configure Producer Acknowledgments in Spring Boot Microservice

Open `application.properties` in `src/main/resources` and add one additional configuration used to configure acknowledgments mode for kafka producer

```
spring.kafka.producer.acks=1
```

* if we change `1` to `all` this will mean that producer will now wait for acknowledgment from all in-sync replicas
* this provides the strongest durability gurantee because it ensures that all replicas have received and persisted our message
---
### The min.insync.replicas configuration

Open a terminal window and `cd` into the kafka folder

to configure the minimum amount of in-sync replicas property at the time of creating a new topic:
```
/bin/kafka-topics.sh --create --topic insync-topic --partitions 3 --replication-factor 3 --bootstrap-server localhost:9092 --config min.insync.replicas=2
```

to configure minimum in-sync replicas for already existing topic which was `topic2`
```
./bin/kafka-configs.sh --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name topic2 --add-config min.insync.replicas=2
```
---
### Trying how the min.insync.replicas works

run server 1,2 and 3 in separate windows

run the kafka consumer script
```
./bin/kafka-console-consumer.sh --topic topic2 --bootstrap-server localhost:9092
```

update `ProductServiceImpl.java` to send messages to topic 2:

from
```
SendResult<String, ProductCreatedEvent> result = kafkaTemplate.send("product-created-events-topic", productId, productCreatedEvent).get();
```
to:
```
SendResult<String, ProductCreatedEvent> result = kafkaTemplate.send("topic2", productId, productCreatedEvent).get();
```
Start up the microservice and copy the port number on which it is running on.

Open Postman and send the request and check it is successful in the terminal

Stop one server, send the request again and see that it is still successful.

Stop one more server, send the request again and see that you receive an error because the producer is expecting acknowlegment from 2 servers and only 1 is running

---
### Kafka Producer Retries

Add to `application.properties`
```
spring.kafka.producer.retries=10
spring.kafka.producer.properties.retry.backoff.ms=1000
```
This will send 10 retries, 1 every 1000ms.

---
### Trying how Kafka Producer Retries work

Make sure you have all kafka brokers running

Start up `ProductsMicroservice` and copy the port number it started on

Update the port number on Postman and send the HTTP request. You will see a successful response.

Stop one server, send the request again and see that it is still successful.

Stop one more server, send the request again and see that you receive an error because the producer is expecting acknowlegment from 2 servers and only 1 is running

Go to the logs and you will see that it tries to send 10 retries, 1 every 1000ms and an error message in Postman

---
### Kafka Producer Delivery & Request Timeout

Comment out in `application.properties`
```
#spring.kafka.producer.retries=10
#spring.kafka.producer.properties.retry.backoff.ms=1000
```
and add
```
spring.kafka.producer.properties.delivery.timeout.ms=120000

spring.kafka.producer.properties.linger.ms=0
spring.kafka.producer.properties.request.timeout.ms=30000
```
---
### Trying how Kafka Producer Delivery & Request Timeout works

Make sure you have all kafka brokers running

Start up `ProductsMicroservice` and copy the port number it started on

Update the port number on Postman and send the HTTP request. You will see a successful response.

Stop 2 kafka brokers to activate retry behaviour 

Go to Postman and send the request. Go to yout console logs and you will see it retries for the allotted 2 minutes until it timeouts

---
### Quiz 5: Quiz: Kafka Producer Acknowledgements and Retries

**Q1: What does the 'acks' configuration in a Kafka Producer specify?**
**A: The acknowledgment level required from the Kafka cluster for successful message delivery.** 
The 'acks' configuration in a Kafka Producer determines the level of acknowledgment required from the Kafka cluster for a message to be considered successfully delivered. For example, 'acks=0' means the producer will not wait for any acknowledgment, 'acks=1' means waiting for an acknowledgment from the leader broker only, and 'acks=all' means waiting for acknowledgments from all in-sync replicas.

**Q2: What is the impact of setting 'acks=all' in a Kafka Producer configuration?**  
**A: It ensures higher data durability by requiring acknowledgment from all in-sync replicas.**  
The 'acks=all' setting in a Kafka Producer configuration ensures higher data durability. This is because it requires acknowledgments from all in-sync replicas before considering the message successfully sent, reducing the likelihood of data loss in case of broker failure.

**Q3: What is a possible drawback of setting 'acks=0' in a Kafka Producer?**  
**A: It may lead to data loss as the producer does not wait for any acknowledgment from brokers.**  
This answer is correct. One of the main drawbacks of setting 'acks=0' in a Kafka Producer is the increased risk of data loss. In this configuration, the producer sends messages without waiting for any acknowledgment from the brokers, which means it won't know if the message was not received or stored by the Kafka cluster.

**Q4: What does the 'retries' configuration in a Kafka Producer control?**  
**A: The number of times the producer will attempt to resend a message after a send failure.**  
This answer is correct. The 'retries' configuration in a Kafka Producer specifies the number of retry attempts the producer will make if a message send fails. This is crucial for ensuring message delivery in the event of transient issues, such as temporary network problems or brief broker unavailability.

**Q5: How does the 'retry.backoff.ms' setting affect Kafka Producer retries?**  
**A: It specifies the time to wait before attempting a message retry after a failure.**  
This answer is correct. The 'retry.backoff.ms' setting in a Kafka Producer specifies the amount of time to wait before attempting another retry after a send failure. This backoff time is crucial to prevent overloading the network or broker with rapid successive retries.

---
### Kafka Producer Spring Bean Configuration

Open `KafkaConfig.java`

Add a new method
```
Map<String, Object> producerConfigs() {
    Map<String, Object> config = new HashMap<>();
    
    return config;
}

```
Hover over `HashMap` with your mouse and click `Import HashMap`

Now paste so your file looks like this
```
package com.appsdeveloperblog.ws.products;

import java.util.HashMap;
import java.util.Map;

import org.apache.kafka.clients.admin.NewTopic;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;
import com.appsdeveloperblog.ws.core.ProductCreatedEvent;

@Configuration
public class KafkaConfig {
	
	@Value("${spring.kafka.producer.bootstrap-servers}")
	private String bootstrapServers;
	
    @Value("${spring.kafka.producer.key-serializer}")
    private String keySerializer;

    @Value("${spring.kafka.producer.value-serializer}")
    private String valueSerializer;

    @Value("${spring.kafka.producer.acks}")
    private String acks;

    @Value("${spring.kafka.producer.properties.delivery.timeout.ms}")
    private String deliveryTimeout;

    @Value("${spring.kafka.producer.properties.linger.ms}")
    private String linger;

    @Value("${spring.kafka.producer.properties.request.timeout.ms}")
    private String requestTimeout;
	
	Map<String, Object> producerConfigs() {
		Map<String, Object> config = new HashMap<>();
		
		config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, keySerializer);
		config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, valueSerializer);
		config.put(ProducerConfig.ACKS_CONFIG, acks);
		config.put(ProducerConfig.DELIVERY_TIMEOUT_MS_CONFIG, deliveryTimeout);
		config.put(ProducerConfig.LINGER_MS_CONFIG, linger);
		config.put(ProducerConfig.REQUEST_TIMEOUT_MS_CONFIG, requestTimeout);
		
		return config;
	}
	
	@Bean
	ProducerFactory<String, ProductCreatedEvent> producerFactory() {
		return new DefaultKafkaProducerFactory<>(producerConfigs());
	}
	
	@Bean
	KafkaTemplate<String, ProductCreatedEvent> kafkaTemplate() {
		return new KafkaTemplate<String, ProductCreatedEvent>(producerFactory());
	}
	
	@Bean
	NewTopic createTopic() {
		return TopicBuilder.name("product-created-events-topic")
				.partitions(3)
				.replicas(3)
				.configs(Map.of("min.insync.replicas","2"))
				.build();
	}

}
```
---

