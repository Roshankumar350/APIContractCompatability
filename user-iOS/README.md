# 📱 API Contract Compatibility Demo
This project demonstrates API versioning contracts in Swift. It shows how to design, implement, and test multiple API contract versions (v1, v2) while maintaining a unified consumer interface (UserViewModel).

## 🎯 Purpose
- Showcase API contract compatibility across multiple versions.
- Demonstrate how to decode different JSON structures (UserV1, UserV2) into a unified User model.
- Provide a protocol-driven ResourceManager for fetching data.
- Illustrate Combine-friendly ViewModel design for SwiftUI integration.
- Enable unit testing with stub to validate contract compatibility.

## 🧭 Architecture Diagram
The following diagram illustrates how user data is fetched from different API contract versions and unified into a single model for backward-compatible rendering:

<img src="https://github.com/Roshankumar350/APIContractCompatability/blob/main/user-iOS/Flow.png" width="900"/>

