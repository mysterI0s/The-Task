Project Documentation

Prerequisites

Before running the backend server and Flutter application, ensure you have the following installed:

Flutter Environment
Flutter Version: 3.24.1

Dart SDK: Included with Flutter

Platform: The application is optimized for Android devices

To check your installed Flutter version, run:

flutter --version

If you have a different version installed, consider switching to 3.24.1 using:

flutter downgrade 3.24.1

Or install the correct version from the Flutter official site: https://flutter.dev/docs/get-started/install

Backend Environment
Go Language (Golang) Installed

Verify by running:
go version

If Go is not installed, download it from: https://golang.org/dl/

MongoDB Installed and Running

Ensure MongoDB is installed and running locally or through a cloud provider like MongoDB Atlas: https://www.mongodb.com/atlas/database

Running the Backend Server
Open a terminal and navigate to the backend directory:
cd golang-jwt-project

Start the server using:
go run main.go

The server should now be running and listening for requests.

Setting Up the Flutter Application
Navigate to the frontend directory:
cd frontend

Fetch all necessary dependencies:
flutter pub get

Configure the API Base URL:

Open the file located at:
core/constants/app_const.dart

Modify the baseUrl string based on your environment:

If running on an Android Emulator:
static const String baseUrl = "http://10.0.2.2:PORT_NUMBER";

If running on a physical Android device:

Ensure both your laptop and mobile phone are connected to the same Wi-Fi network.

Find your laptop’s IPv4 address by running:
ipconfig (Windows) | ifconfig (Mac/Linux)

Replace baseUrl with your IPv4 address, keeping the port unchanged:
static const String baseUrl = "http://YOUR_IPV4_ADDRESS:PORT_NUMBER";

Running the Flutter Application
Ensure your device or emulator is connected by running:
flutter devices

Start the application using:
flutter run

If using a physical device, enable USB debugging or connect via wireless debugging.

Troubleshooting
Issue: flutter command not found

Ensure Flutter is properly added to your system’s PATH.

Issue: MongoDB connection failed

Check if MongoDB is running using:
mongod --version

Issue: Cannot connect to backend from mobile

Verify that your IPv4 address is correctly set in baseUrl.

Ensure your firewall is not blocking incoming connections.

Conclusion
By following these steps, you should be able to successfully run both the backend and Flutter frontend. If you encounter issues, ensure all dependencies are installed correctly and that the API connection settings are configured based on your environment.
