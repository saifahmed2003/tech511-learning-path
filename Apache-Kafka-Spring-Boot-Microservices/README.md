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
You will see this error
```
log4j:ERROR Could not read configuration file from URL
```
To fix this you must create the missing config file that the tools need
```
cp config/log4j.properties config/tools-log4j.properties
```
Fix the log.dirs path for Windows
```
nano config/kraft/server.properties
```
Right now, this line in your config uses a Linux-style temp path:
```
log.dirs=/tmp/kraft-combined-logs
```
Change it to:
```
log.dirs=C:\\kafka-logs
```
Reformat the storage directory
```
rm -rf /c/kafka-logs
```
Run
```
./bin/kafka-storage.sh format -t kq23bZZYRbmYy2XQ0y2m4A -c config/kraft/server.properties --ignore-formatted
```
You should see
```
Formatting C:\kafka-logs with metadata.version 3.6-IV2.
```
Now Patch the startup script
```
nano bin/kafka-server-start.sh
```
Change this line
```
EXTRA_ARGS=${EXTRA_ARGS-'-name kafkaServer -loggc'}
```
To this
```
EXTRA_ARGS=${EXTRA_ARGS-'-name kafkaServer'}
```

Save the file and re‑run:
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
