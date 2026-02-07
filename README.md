# Smart House Application

A full-stack Smart House application with NestJS backend, Angular frontend, and MongoDB database, all containerized with Docker.

## Project Structure

```
Smart House/
├── backend/                 # NestJS backend application
│   ├── src/
│   ├── Dockerfile
│   └── package.json
├── frontend/                # Angular frontend application
│   ├── src/
│   ├── Dockerfile
│   └── package.json
└── docker-compose.yml       # Docker orchestration
```

## Services

- **Backend (NestJS)**: Runs on port 3000
- **Frontend (Angular)**: Runs on port 4200
- **MongoDB**: Runs on port 27017

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### 1. Start all services with Docker Compose:

```bash
docker-compose up --build
```

This command will:
- Build the Docker images for frontend and backend
- Start MongoDB database
- Start NestJS backend (connected to MongoDB)
- Start Angular frontend

### 2. Access the applications:

- **Frontend**: http://localhost:4200
- **Backend API**: http://localhost:3000
- **MongoDB**: mongodb://localhost:27017

### 3. Stop all services:

```bash
docker-compose down
```

### 4. Stop and remove volumes (database data):

```bash
docker-compose down -v
```

## MongoDB Credentials

- **Username**: admin
- **Password**: admin123
- **Database**: smarthouse

## Development

The containers are configured with volume mounting for hot-reloading:
- Changes to backend code will automatically restart the NestJS server
- Changes to frontend code will trigger Angular live reload

## Useful Commands

```bash
# View logs
docker-compose logs -f

# View logs for specific service
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f mongodb

# Rebuild specific service
docker-compose up --build backend

# Execute commands in running container
docker-compose exec backend npm install <package-name>
docker-compose exec frontend npm install <package-name>

# Access MongoDB shell
docker-compose exec mongodb mongosh -u admin -p admin123
```

## Next Steps

- Add routes and controllers to the NestJS backend
- Create components and services in the Angular frontend
- Define MongoDB schemas and models in NestJS
- Implement authentication and authorization
- Add environment-specific configurations
