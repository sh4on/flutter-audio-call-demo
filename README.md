# Flutter ZegoCloud Audio Call Demo

A one-to-one audio calling application built with Flutter, using **ZegoCloud Prebuilt Call Kit** and **GetX** for state management. This project demonstrates how to implement a call invitation system where users can call each other using unique IDs.

## 🚀 Features

- **One-to-One Audio Calling**: High-quality voice calls.
- **Call Invitations**: Users can receive call notifications even when the app is in the background (using Zego Signaling Plugin).
- **Unique User IDs**: Every user has a unique ID for targeted calling.
- **Clean Architecture**: Business logic is separated into a `CallController` using GetX.
- **Modern UI**: Built with Material 3.

## 📋 Prerequisites

Before running the project, you need:
1. [ZegoCloud Account](https://console.zegocloud.com/): Create a project and get your **AppID** and **AppSign**.
2. Flutter SDK (v3.10.4 or higher).
3. A physical device (Android or iOS) for testing (Call features don't work well on emulators).

## 🛠️ Setup

### 1. Environment Configuration
Create a `.env` file in the root directory and add your ZegoCloud credentials:

```env
ZEGO_APP_ID=your_app_id
ZEGO_APP_SIGN=your_app_sign
```

### 2. Permissions

#### Android
Add the following to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```

#### iOS
Add the following to `ios/Runner/Info.plist`:

```xml
<key>NSMicrophoneUsageDescription</key>
<string>We need access to the microphone for audio calls.</string>
<key>NSCameraUsageDescription</key>
<string>We need access to the camera for video calls (if enabled).</string>
```

### 3. Install Dependencies
Run the following command in your terminal:

```bash
flutter pub get
```

## 🏃 How to Use

1. **Run the app** on two different devices.
2. **Login**: Enter a unique User ID and Name on each device (e.g., `user_1` and `user_2`).
3. **Initiate Call**: On `user_1`'s device, enter `user_2` in the "Target User ID" field.
4. **Call**: Tap the audio call button. `user_2` will receive an incoming call notification.

## 🏗️ Project Structure

- `lib/main.dart`: Entry point, app configuration, and navigator key setup.
- `lib/controller/call_controller.dart`: Business logic for Zego service initialization.
- `lib/screens/login_screen.dart`: User authentication (simulated).
- `lib/screens/home_screen.dart`: Call invitation interface.

## 📄 License
This project is for demonstration purposes. Refer to ZegoCloud's official documentation for production guidelines.
