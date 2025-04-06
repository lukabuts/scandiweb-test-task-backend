
# 🧠 GraphQL Backend API

A lightweight PHP GraphQL backend designed to support a product-based application. Built with Illuminate Database (from Laravel), this backend provides a structured, flexible, and scalable approach for managing products, attributes, and orders using GraphQL.

---

## 📦 Features

- ⚡ GraphQL API for efficient querying and mutations
- 🛒 Product, Attribute, and Item management
- 🧾 Order placement with validation logic
- 💬 Standardized message response service
- 🧠 Illuminate ORM for clean database interaction
- 🔐 Route guarding and error display

---

## 🛠️ Tech Stack

- **PHP**
- **GraphQL-PHP**: [webonyx/graphql-php](https://github.com/webonyx/graphql-php)
- **Illuminate Database** (Eloquent ORM)
- **MySQL** (or any database supported by Illuminate)
- **Composer** for dependency management

---

## 📁 Project Structure

/project-root
│
├── public/
│   └── index.php # Main entry point
│
├── src/
│   ├── Config/           # DB configuration
│   ├── Controller/       # Controllers
│   ├── GraphQL/          # Containing Resolvers, Types folders with GraphQLSchema and Types Files
│   ├── Helpers/          # Helper functions/services
│   ├── Models/           # Eloquent models
│   ├── Services/         # Helper services like MessageResponse, OrderValidator
│
├── .env                  # Environment variables
├── .env.example          # Example environment file
├── .gitignore            # Git ignore file
├── composer.json         # Composer dependencies
├── composer.lock         # Composer lock file
├── README.md             # Project README
├── docs/
│   └── ecommerce_db_seed_backup_2025-04-06.sql # SQL seed backup file
│   └── database_schema.pdf # Database schema diagram

---

## 🚀 Getting Started

### 1. **Clone the Repository**

```bash
git clone https://github.com/lukabuts/scandiweb-test-task-backend.git
cd scandiweb-test-task-backend
```

### 2. Install Dependencies
Make sure you have PHP and Composer installed.

```bash
composer install
```

### 3. Environment Setup
Copy the example .env file and configure your DB credentials:

```bash
cp .env.example .env
```

Edit .env:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### 4. Database Setup
Make sure your MySQL database is created and configured.

The project assumes you’ve already imported the database schema.
If not, import the SQL dump manually or use migration files if available.

For the SQL seed data, you can find the seed file in the `docs/` folder under the name `ecommerce_db_seed_backup_2025-04-06.sql`. To seed the database, import the SQL file into your MySQL database.

### 5. Run Local Server
Use PHP’s built-in server for testing:

```bash
cd ./public
php -S localhost:8000 -t public
```

The API is now available at:

```bash
http://localhost:8000/graphql
```

---

## 📄 Database Schema

For a visual representation of the database structure, an **Entity-Relationship Diagram (ERD)** has been provided. It shows the relationships between tables, attributes, and constraints.

You can find the schema diagram in the `docs/` folder under the name `database_schema.pdf`.

### How to Access:
1. Navigate to the `docs/` directory.
2. Open `database_schema.pdf` to view the database structure.

This diagram will help you quickly understand how the database is structured and the relationships between different entities.

---

### 📬 GraphQL Usage
You can interact with the API using a GraphQL client (e.g., Insomnia, Altair, or Postman).

Send a POST request to:

```bash
http://localhost:8000/graphql
```

Example query:

```graphql
query {
  products {
    id
    name
    in_stock
    attributes {
      id
      name
      items {
        id
        display_value
        value
      }
    }
  }
}
```

### 🧪 Testing Tips
- Make sure .env values are correct
- Watch public/index.php for route guards and error display
- Use error logs or enable PHP error reporting for debugging

### 👨‍💻 Author
Luka Butskhrikidze
