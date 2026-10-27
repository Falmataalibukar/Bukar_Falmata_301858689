5.1 Introduction
Distributed databases allow data to be stored and managed across multiple computers or locations while supporting access to the data as part of a database system. Cloud databases provide database services through cloud infrastructure, which can help organisations improve accessibility, scalability, and availability.
For the Hotel Reservation System, distributed database concepts are relevant because hotel staff may need to access guest details, room availability, bookings, and payment records from different locations. This portfolio examines how replication, sharding, availability, and consistency could support the system.
The discussion uses the existing Hotel Reservation System developed with MySQL and MongoDB as its case study.

5.2 Proposed Distributed Database Architecture
The Hotel Reservation System could use a distributed database architecture to support hotel operations across multiple branches. Each branch could access guest information, room availability, bookings, and payment records through a central database service or distributed database infrastructure.
For example, a hotel with branches in Abuja and Lagos could allow authorised staff at both locations to access reservation information. A shared database would help staff check existing bookings and reduce the risk of assigning the same room to different guests.
The architecture could use a primary database server to process updates and one or more replica servers to provide additional copies of the data. The system would need appropriate access controls, network security, backup procedures, and consistency rules to protect guest information and maintain accurate reservations.
This architecture is a proposed design for the case study; it has not been deployed or tested as a distributed database in this practical exercise.

5.3 Database Replication
Database replication is the process of maintaining copies of data on multiple database servers. It can improve data availability, support read operations, and help a system recover when one server fails.
In the Hotel Reservation System, replication could be used to maintain a copy of guest, room, booking, and payment data on a secondary server. If the primary server becomes unavailable, a properly configured system could use the replica to support continued access or recovery. However, replication requires careful management to prevent inconsistencies between copies. For example, a newly confirmed booking must be reflected appropriately across the system so that staff do not rely on outdated room availability information. Replication can be synchronous, where changes are confirmed according to the replication system's consistency rules, or asynchronous, where changes may reach replicas after a delay. The appropriate method depends on the hotel's requirements for consistency, performance, and availability.
Replication is discussed here as a proposed design. Replication between database servers was not configured or tested in this practical exercise.

5.4 Database Sharding
Database sharding is a technique for dividing a large dataset into smaller parts called shards. Each shard stores a portion of the data, and the shards may be distributed across multiple servers. This can help a database handle larger amounts of data and more requests.
For the Hotel Reservation System, bookings could be divided by hotel branch or another suitable partitioning key. For example, bookings associated with an Abuja branch could be stored in one shard, while bookings associated with a Lagos branch could be stored in another.
A suitable shard key is important because it affects how data is distributed and retrieved. A poorly chosen shard key may cause uneven data distribution or make some queries more difficult. The system must also ensure that booking records remain accessible and that related data can be managed reliably.
Sharding may become useful as the hotel expands and the volume of reservations increases. For the current small sample database, sharding would add unnecessary complexity. Therefore, sharding is discussed as a possible future improvement and was not implemented in this exercise.

5.5 Database Availability and Consistency
Availability refers to the ability of a database system to remain accessible when users need it. Consistency means that data remains correct and follows the system's rules as updates occur.
In the Hotel Reservation System, availability is important because staff need to check room availability, confirm reservations, and retrieve guest information. Database backups, replication, monitoring, and recovery procedures can help reduce service interruptions. Consistency is equally important. For example, if a guest books room 101 for a particular period, the system must prevent another guest from confirming a conflicting reservation for the same room and dates. Appropriate transactions, constraints, and concurrency controls can help maintain correct booking information.
Distributed systems sometimes require trade-offs between immediate consistency, availability, and tolerance of network partitions. The hotel should prioritise reliable booking and payment records while designing suitable recovery and access procedures.
These concepts were evaluated theoretically. A multi-server availability or consistency test was not performed as part of this exercise.

5.6 Cloud Database Deployment
Cloud database deployment involves hosting a database on cloud infrastructure rather than relying entirely on a local computer or server. Cloud platforms can provide managed backups, monitoring, scalability, security controls, and high-availability options, depending on the service selected.
For the Hotel Reservation System, a cloud-hosted MySQL or MongoDB database could allow authorised staff to access reservation information from different locations. As the hotel grows, computing and storage resources could be increased to support additional guests and bookings.
A cloud deployment would require secure authentication, appropriate user permissions, encrypted connections, regular backups, and careful management of database access. The hotel would also need to consider network reliability, service costs, privacy requirements, and recovery procedures.
In this practical exercise, MySQL was configured locally and MongoDB was run in a Docker container on the computer. A cloud database was not deployed. Cloud hosting is therefore presented as a proposed future improvement rather than a completed implementation.

5.7 Evaluation and Conclusion
This portfolio examined how distributed and cloud database concepts could support the Hotel Reservation System. Replication can improve data availability, sharding can support growth, and suitable consistency controls can help maintain accurate booking records. Cloud hosting could also allow authorised staff to access the system from different locations.
The main limitation is that replication, sharding, and cloud deployment were not implemented or tested. The exercise used a local MySQL database and a MongoDB server running through Docker. Therefore, the benefits discussed represent proposed improvements rather than measured results.
In conclusion, distributed database concepts provide useful options for improving the scalability, availability, and resilience of the Hotel Reservation System as it grows. Any future implementation should be tested carefully to ensure that booking and payment information remains secure, accurate, and reliable.
