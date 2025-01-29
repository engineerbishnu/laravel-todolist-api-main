# Laravel To-Do List API

A simple To-Do list API built with Laravel.

## Setup Instructions

Follow these steps to get the application up and running.

### Prerequisites

- Vagrant setup
- virtual box or vmware or hypervusor setup
- MySQL Server
- Redis Server
- PHP 8.3
- PHP Composer

### Installation Steps

1. **Clone the repository***

   ```bash
   git clone https://github.com/engineerbishnu/laravel-todolist-api-main.git
   cd /your/cloned/path/for/this/repo/laravel-todolist-api-main.git
   cd /your/cloned/path/for/this/repo/laravel-todolist-api-main/Vagrant_Server/
   vagrant up
   ```

2. **Infrastructure Created***

   ```
   Now Infrastructure created, we can do setup self-hosted runner for CD part, after creating github workflow file, it will handle CI part.
   Now We can start deployment part here.
   ```
3. **Self-Hosted Runner Setup**

   ```
   Gi to settings of repositore and search left hand side Actions, inside actions there is Runners. Create one self-hosted runners for now.
   ```

4. **Start Runner `run the runner`**
   ```bash
   ./run.sh
   ```

5. **Install Dependencies**

   ```bash
   composer install
   ```

6. **Generate Application Key**

   ```bash
   php artisan key:generate
   ```

7. **Run Database Seeder**

   ```bash
   php artisan db:seed
   ```

8. **Serve site with herd or valet or nginx**

    #### herd example
    ```bash
   herd domain test
   herd link laravel-todolist-api
   herd secure --site=laravel-todolist-api
   ```
   
Follow official documentation for nginx configuration and valet.

### Verify Application Functionality

You can test the application using the following HTTP requests:

#### 1. Register

**Request:**

```http
POST https://laravel-todolist-api.test/api/register
Content-Type: application/json

{
  "name": "bishnu",
  "email": "bishnu@tester.com",
  "password": "password",
  "password_confirmation": "password"
}

```

#### 2. Login

**Request:**

```http
POST https://laravel-todolist-api.test/api/login
Content-Type: application/json

{
  "email": "bishnu@tester.com",
  "password": "password"
}
```

#### 3. Create To-Do Item

**Request:**

```http
POST https://laravel-todolist-api.test/api/todo
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json

{
  "title": "My First Todo List",
  "description": "This is sample test todo list",
  "completed": "0"
}
```

#### 4. List To-Do Items

**Request:**

```http
GET https://laravel-todolist-api.test/api/todo
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json
```

#### 5. To-Do Item Detail

**Request:**

```http
GET https://laravel-todolist-api.test/api/todo/1
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json

{
  "completed": 1
}
```

#### 6. Update To-Do Item

**Request:**

```http
PATCH https://laravel-todolist-api.test/api/todo/1
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json

{
  "title": "My First Todo with updated List",
  "description": "TODO has been updated",
  "completed": "1"
}
```

#### 7. Delete To-Do Item

**Request:**

```http
DELETE https://laravel-todolist-api.test/api/todo/1
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json
```

---

Replace `YOUR_ACCESS_TOKEN` with the actual token obtained during login for authorization effectively. For further instructons, follow the documented docs available inside my repo.
