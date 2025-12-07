# 📘 User API (Node.js + TypeScript)
A simple versioned API built with Express.js and TypeScript.
It demonstrates clean architecture with routers, controllers, models, and data separation

## 🚀 Features
Versioned routes (`/v1/users`, `/v2/users`)

## 📂 Project Structure
<pre>
src/
├── index.ts      # Entry point (Express App)
├── routes/
│ ├── v1.ts       # v1 Router
│ └── v2.ts       # v2 Router
├── controllers/
│ └── userController.ts    # UserController logic
├── models/
│ └── user.ts         # User model (interface)
├── data/
│ ├── users.json      # User records
│ └── users.ts.       # Loads JSON into typed array
</pre>

## ⚙️ Setup
1. Clone the repo
```bash
git clone https://github.com/your-username/user-api.git
cd user-api
```
2. Install dependencies
```bash
npm install
```
3. Run in development
```
npm run dev
```

## 🌐 API Endpoints
### v1 Users
```Code
GET /v1/users
Response: [
  { "firstName": "Ava", "lastName": "Sharma" },
  { "firstName": "Ben", "lastName": "Carter" }
]
```
### v2 Users
```Code
GET /v2/users
Response: [
  { "fullName": "Ava Sharma" },
  { "fullName": "Ben Carter" }
]
```

## 🧪 Testing
Use curl or Postman:
```bash
curl http://localhost:3000/v1/users
curl http://localhost:3000/v2/users
```

