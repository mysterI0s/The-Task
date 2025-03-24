# Project Documentation

## Prerequisites

Before running the backend server and Flutter application, ensure you have the following installed:

### Flutter Environment
- **Flutter Version:** `3.24.1`
- **Dart SDK:** Included with Flutter
- **Platform:** The application is optimized for **Android devices**.

To check your installed Flutter version, run:
```bash
flutter --version
```
If you have a different version installed, consider switching to `3.24.1` using:
```bash
flutter downgrade 3.24.1
```
Or install the correct version from the official Flutter site:  
[Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Backend Environment
- **Go Language (Golang) Installed**  
  Verify installation by running:
  ```bash
  go version
  ```
  If Go is not installed, download it from: [Golang Official Site](https://golang.org/dl/)

- **MongoDB Installed and Running**  
  Ensure MongoDB is installed and running locally or through a cloud provider like  
  [MongoDB Atlas](https://www.mongodb.com/atlas/database).

---

## Running the Backend Server
1. Open a terminal and navigate to the backend directory:
   ```bash
   cd golang-jwt-project
   ```
2. Start the server using:
   ```bash
   go run main.go
   ```
3. The server should now be running and listening for requests.

---

## Setting Up the Flutter Application
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Fetch all necessary dependencies:
   ```bash
   flutter pub get
   ```

### Configure the API Base URL:
- Open the file located at:
  ```
  core/constants/app_const.dart
  ```
- Modify the `baseUrl` string based on your environment:

#### **If running on an Android Emulator:**
```dart
static const String baseUrl = "http://10.0.2.2:8000";
```

#### **If running on a physical Android device:**
1. Ensure both your **laptop** and **mobile phone** are connected to the same Wi-Fi network.
2. Find your laptop’s **IPv4 address** by running:
   - **Windows:** `ipconfig`
   - **Mac/Linux:** `ifconfig`
3. Replace `baseUrl` with your IPv4 address, keeping the port unchanged:
   ```dart
   static const String baseUrl = "http://YOUR_IPV4_ADDRESS:8000";
   ```

---

## Running the Flutter Application
1. Ensure your **device or emulator** is connected by running:
   ```bash
   flutter devices
   ```
2. Start the application using:
   ```bash
   flutter run
   ```
3. If using a **physical device**, ensure **USB debugging** is enabled or connect via **wireless debugging**.

---

## Troubleshooting

### **1. `flutter` command not found**
- Ensure Flutter is properly added to your system’s **PATH**.

### **2. MongoDB connection failed**
- Check if MongoDB is running using:
  ```bash
  mongod --version
  ```

### **3. Cannot connect to backend from mobile**
- Verify that your **IPv4 address** is correctly set in `baseUrl`.
- Ensure your **firewall** is not blocking incoming connections.

---

## Conclusion
By following these steps, you should be able to successfully run both the backend and Flutter frontend. If you encounter issues, ensure all dependencies are installed correctly and that the API connection settings are configured based on your environment.
