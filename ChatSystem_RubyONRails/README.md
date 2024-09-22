Here’s the updated README with the Docker Compose part removed and the setup instructions for a regular Rails app:

---

# Instabug Backend Challenge

This project implements a chat system backend, as specified in the **Instabug Backend Challenge**. The system allows creating applications identified by a unique token, with chats and messages that are uniquely numbered per application and chat, respectively. Although several features were planned, some were not implemented due to the project deadline.

## Features

- **Applications**: Each application is uniquely identified by a system-generated token. Applications can have multiple chats.
- **Chats**: Chats are uniquely numbered within an application, and no two chats in the same application share the same number.
- **Messages**: Messages are uniquely numbered within a chat, with numbering starting at 1 for each chat.
- **RESTful Endpoints**: The API provides endpoints for creating, updating, and reading applications, chats, and messages.

## Technology Stack

- **Ruby on Rails**: Main backend framework.
- **MySQL**: Used as the primary datastore for storing applications, chats, and messages.

## Setup Instructions

### Prerequisites

Ensure the following are installed on your system:
- Ruby
- Rails
- MySQL

### To Run the Application

1. Clone this repository.
2. Navigate to the project directory.
3. Install the required gems:

   ```bash
   bundle install
   ```

4. Set up the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

5. Start the Rails server:

   ```bash
   rails server
   ```

6. The application should be available at `http://localhost:3000`.

### API Endpoints

- **Create Application**: `POST /applications`
- **Update Application**: `PUT /applications/:token`
- **Get Application**: `GET /applications/:token`
- **Create Chat**: `POST /applications/:application_token/chats`
- **Update Chat**: `PUT /applications/:application_token/chats/:number`
- **Get Chat**: `GET /applications/:application_token/chats/:number`
- **Create Message**: `POST /applications/:application_token/chats/:chat_number/messages`
- **Update Message**: `PUT /applications/:application_token/chats/:chat_number/messages/:number`
- **Get Message**: `GET /applications/:application_token/chats/:chat_number/messages/:number`

## Features Not Implemented (Due to Time Constraints)

While the core functionality of the chat system is in place, several additional features were planned but could not be implemented within the given time frame:

### 1. **Redis Caching**
- **Planned**: Redis was intended to be used for caching frequently accessed data, such as chat and message counts, to improve performance and reduce the load on the MySQL database.
- **Current Status**: Unfortunately, Redis was not implemented due to time constraints. Given more time, I would have added Redis to optimize data access and reduce the number of direct database queries.

### 2. **Queue System**
- **Planned**: A queue system was planned to handle chat and message creation requests efficiently, especially in a concurrent environment. The **First-In-First-Out (FIFO)** technique would have been implemented to ensure that requests are processed in the exact order they are received, preventing race conditions.
- **Current Status**: Due to the project deadline, the queue system was not implemented. In a future iteration, I would integrate a queue system using a tool like Sidekiq or RabbitMQ to handle background processing and ensure data consistency.

### 3. **Elasticsearch**
- **Planned**: Elasticsearch was intended for searching messages with partial body matching. This would allow for efficient full-text search across messages.
- **Current Status**: The integration of Elasticsearch was planned but was not completed due to the approaching deadline. This feature would be crucial for implementing the search functionality and would be added in a future version.

### 4. **Docker Configuration**
- **Planned**: A more robust Docker configuration was intended to streamline the development and deployment process, ensuring that all services are properly configured and isolated.
- **Current Status**: While the application runs in Docker, the configuration lacks optimizations for production use. In a future iteration, I would enhance the Docker setup with multi-stage builds, health checks, and more comprehensive service definitions to improve maintainability and performance.

## Future Enhancements

Given more time, I would implement the following:
- **Redis for Caching**: Integrating Redis to cache frequently accessed data, improving performance by reducing the load on the database.
- **Queue System with FIFO**: Implementing a queue system (using Sidekiq, RabbitMQ, etc.) with FIFO to ensure efficient and ordered request handling.
- **Elasticsearch for Search**: Adding full-text search capabilities using Elasticsearch to allow partial matching of message content.

## Testing

You can run the tests using the following command:

```bash
rails test
```

## Conclusion

While this project successfully implements the core functionality of the chat system, the features like Redis caching, the queuing system, Elasticsearch, and an enhanced Docker configuration were left out due to the time constraints of the challenge. Given more time, these features would have been included to enhance performance and search capabilities.

For any questions, please refer to the emails provided in the challenge instructions.

---

Let me know if you need any further changes!
