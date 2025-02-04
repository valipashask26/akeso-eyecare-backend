# Example Backend

This project is a Node.js, Express, and MongoDB-based REST API that supports CRUD operations (Create, Read, Update, Delete). It is designed to be a simple backend for managing records, such as users, items, or other entities, and can be easily extended for any use case.

### Features

- **Node.js** for the server-side runtime
- **Express** for building the RESTful API
- **MongoDB** for the database
- Basic **CRUD operations** for managing records
- Configurable environment variables

---

## Table of Contents

1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Running the Application](#running-the-application)
4. [API Routes](#api-routes)
   - [GET /record](#get-record)
   - [GET /record/:id](#get-record-id)
   - [POST /record](#post-record)
   - [PATCH /record/:id](#patch-record-id)
   - [DELETE /record/:id](#delete-record-id)
5. [Environment Variables](#environment-variables)
6. [Testing](#testing)

---

## Installation

To install the backend project, follow the steps below:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/example-backend.git
   ```

2. Navigate to the project directory:
   ```bash
   cd example-backend
   ```

3. Install the dependencies:
   ```bash
   npm install
   ```

4. Create a `config.env` file in the root directory of the project (if it doesn't already exist) and configure your environment variables as mentioned below.

---

## Configuration

You need to configure the environment variables for your MongoDB connection and the port number. You can do this by creating a `config.env` file in the root of your project.

### `config.env` Example

```env
MONGO_URI=mongodb://<username>:<password>@<mongo-host>:27017/
PORT=3000
```

- **MONGO_URI**: The connection string for your MongoDB instance. Replace `admin` and `adminpassword` with your MongoDB credentials and the appropriate `mongo` hostname if you're using a Docker container for MongoDB.
- **PORT**: The port where the backend server will run. By default, it's set to `3000`.

---

## Running the Application

To run the application, use the following command:

```bash
npm start
```

This will start the server on the port specified in the `config.env` file (default is `3000`).

You should see output indicating that the server is running, like:

```
Server is running on port 3000
Connected to MongoDB
```

The API will now be accessible at `http://localhost:3000`.

---

## API Routes

Here are the available API routes for this backend:

### `GET /record`
Fetches all records from the database.

- **Response**: A list of all records.
- **Status Code**: `200 OK`

```bash
GET /record
```

### `GET /record/:id`
Fetches a specific record by its ID.

- **Parameters**: `:id` — The MongoDB `_id` of the record to fetch.
- **Response**: The record object if found, or a `404 Not Found` message if not found.
- **Status Codes**:
  - `200 OK` if record is found.
  - `404 Not Found` if record is not found.

```bash
GET /record/:id
```

### `POST /record`
Creates a new record in the database.

- **Request Body**: A JSON object with the following fields:
  - `name`: (String) The name of the record.
  - `position`: (String) The position of the record.
  - `level`: (String) The level of the record.
  
- **Response**: The result of the insert operation.
- **Status Code**: `204 No Content`

```bash
POST /record
```

### `PATCH /record/:id`
Updates an existing record by its ID.

- **Parameters**: `:id` — The MongoDB `_id` of the record to update.
- **Request Body**: A JSON object with updated values for `name`, `position`, and/or `level`.
  
- **Response**: The result of the update operation.
- **Status Code**: `200 OK`

```bash
PATCH /record/:id
```

### `DELETE /record/:id`
Deletes a record by its ID.

- **Parameters**: `:id` — The MongoDB `_id` of the record to delete.
  
- **Response**: The result of the delete operation.
- **Status Code**: `200 OK`

```bash
DELETE /record/:id
```

---

## Environment Variables

### `config.env` file

You need to create a `config.env` file in the root of your project to set the environment variables. The application will use the following variables:

- `MONGO_URI`: The connection string for MongoDB.
- `PORT`: The port to run the server on.

Example:

```env
MONGO_URI=mongodb://<username>:<password>@<mongo-host>:<mongo-port>/
PORT=3000
```

---


