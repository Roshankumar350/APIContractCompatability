# 🎯 Purpose

This repository demonstrates **API contract compatibility** between a Node.js backend and an iOS client.

- **Backend (`user-api`)** → Implements versioned endpoints (`/v1/users`, `/v2/users`) with different response contracts.
- **Client (`user-iOS`)** → Consumes the API and shows how contract changes affect decoding and behavior.

## Why this matters
API contracts define the shape of data exchanged between server and client.  
When contracts evolve (e.g., adding/removing fields, changing structure), clients must adapt.  

This demo highlights:
- How versioned APIs prevent breaking changes.
- How Swift models (`User`, `UserV2`) map to different contracts.
- How async/await networking handles responses gracefully.

## Repositories
- [Client (user-iOS)](https://github.com/Roshankumar350/APIContractCompatability/tree/main/user-iOS)  
- [API (user-api)](https://github.com/Roshankumar350/APIContractCompatability/tree/main/user-api)

## Client- Server Communication
iOS client communicates with the server using versioned endpoints.
<img width="900" height="760" alt="Client-Server" src="https://github.com/user-attachments/assets/52adbdd8-b1fd-4caa-b33d-779f419497a4" />

The iOS Client sends two requests:
- GET /v1/users → expects { firstName, lastName }
- GET /v2/users → expects { fullName }
  
The Server responds with versioned contracts:
- API v1 returns separate fields
- API v2 returns a combined field

