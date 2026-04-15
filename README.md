# 💊 Wasla - Smart Pharmacy Multi-Vendor Marketplace

**Wasla** (وصلة) is a professional mobile application built with **Flutter** that connects users with multiple local pharmacies. It provides a seamless experience for browsing medical products, managing shopping carts, and facilitating healthcare accessibility in Gaza.

---

## 🚀 Key Features
* **Multi-Vendor Architecture:** Browse and compare products from various pharmacies in one place.
* **Advanced Product Filtering:** Search by category, pharmacy name, or medical type.
* **Persistent Cart System:** A robust cart management system for handling items from different vendors.
* **Localization (i18n):** Full support for **Arabic** and **English** languages with RTL support.
* **Responsive UI:** Pixel-perfect design across all screen sizes using `flutter_screenutil`.
* **Secure Backend:** Powered by **Firebase** for real-time data sync and secure authentication.

---

## 🛠️ Technical Stack & Architecture
This project is built following industry-standard **Software Engineering** principles to ensure scalability and maintainability:

* **Architecture:** **Clean Architecture** (Separation of Data, Domain, and Presentation layers).
* **Design Pattern:** **MVVM** (Model-View-ViewModel) for clean UI/Logic separation.
* **State Management:** (Insert your tool here, e.g., Bloc / Cubit / Provider).
* **Database:** Firebase Firestore (Cloud) & (Insert local DB if used, e.g., Hive/Sqflite).
* **Networking:** Dio with interceptors for API handling.
* **Principles:** **SOLID Principles** applied to ensure decoupled and testable code.

---

## 📂 Project Structure
```text
lib/
 ├── core/            # Common utils, constants, and shared widgets
 ├── features/        # Feature-based modules (Auth, Cart, Products)
 │    ├── data/       # Models, Repositories Implementation
 │    ├── domain/     # Entities, Use Cases, Repository Interfaces
 │    └── presentation/ # UI Widgets and State Managers
 └── main.dart        # Application entry point
