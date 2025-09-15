# Kazang Pay

A Flutter-based point-of-sale (POS) terminal application designed for payment processing on Android devices, specifically optimized for Sunmi and Urovo hardware platforms.

## Overview

Kazang Pay is a comprehensive payment terminal solution that enables merchants to process various types of transactions including purchases, cashback, cash withdrawals, and transaction voids. The application integrates with specialized POS hardware and provides a robust payment processing interface with support for multiple languages and receipt printing.

## Features

- **Transaction Processing**
  - Purchase transactions
  - Cashback transactions
  - Cash withdrawal processing
  - Transaction void capabilities
  - Real-time transaction status monitoring

- **Hardware Integration**
  - Sunmi POS terminal support
  - Urovo device integration
  - Bluetooth connectivity
  - Card reader (MSR/ICC/Contactless) support
  - Receipt printer integration

- **User Interface**
  - Responsive design for various screen sizes
  - Multi-language support (English, Afrikaans, Amharic, Somali)
  - Intuitive keypad input
  - Animated transaction feedback
  - Dark/light theme support

- **Security Features**
  - PIN-based authentication
  - Secure transaction processing
  - Device-specific permissions
  - KMS (Key Management System) updates

- **Additional Features**
  - Transaction history
  - Settlement reporting
  - Receipt generation and printing
  - Network connectivity monitoring
  - Device management

## Technical Stack

- **Framework**: Flutter 3.6.0+
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Networking**: Dio HTTP client
- **Serialization**: JSON annotation with Freezed
- **Localization**: Flutter Intl
- **Animations**: Lottie
- **Platform**: Android (API level varies by device)

## Project Structure

```
lib/
├── common/           # Shared components and utilities
│   ├── dialogs/     # Dialog components
│   ├── providers/   # Riverpod providers
│   └── widgets/     # Reusable UI components
├── core/            # Core constants and configurations
├── helpers/         # Utility functions
├── l10n/            # Internationalization files
├── models/          # Data models and DTOs
├── pages/           # Application screens
└── theme.dart       # Application theming

android/
└── app/src/main/kotlin/net/kazang/pegasus/
    ├── MainActivity.kt          # Main Android activity
    ├── TransactionHandler.kt    # Transaction processing
    ├── PrinterHandler.kt        # Receipt printing
    └── TerminalConfig.kt        # Device configuration
```

## Hardware Requirements

- **Supported Devices**: Sunmi V2/V2 Pro/V2s, Urovo smart terminals
- **Android Version**: Android 7.0+ (API level 24+)
- **Hardware Features**: 
  - Card readers (magnetic stripe, chip, contactless)
  - Receipt printer
  - Bluetooth connectivity
  - Network connectivity (WiFi/Ethernet)

## Permissions

The application requires the following Android permissions:
- Network access (WiFi/Internet)
- Bluetooth connectivity
- Storage access
- Device hardware access (card readers, printers)
- Location services (for device identification)
- Audio recording (for transaction feedback)

## Getting Started

### Prerequisites

- Flutter SDK 3.6.0 or higher
- Android SDK with API level 24+
- Compatible POS hardware (Sunmi/Urovo)

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd kazangpay
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code files:
```bash
flutter packages pub run build_runner build
```

4. Build and install:
```bash
flutter build apk --release
flutter install
```

### Configuration

Configure the terminal settings through the application's settings interface or by modifying the terminal configuration parameters in the Android native code.

## Development

### Build Commands

- **Debug build**: `flutter build apk --debug`
- **Release build**: `flutter build apk --release`
- **Run tests**: `flutter test`
- **Code generation**: `flutter packages pub run build_runner build`

### Localization

The app supports multiple languages. To add new translations:

1. Add entries to the ARB files in `lib/l10n/`
2. Run `flutter gen-l10n` to generate localization files

## Architecture

The application follows a layered architecture pattern:

- **Presentation Layer**: Flutter UI components and pages
- **Business Logic Layer**: Riverpod providers and state management
- **Data Layer**: Models and repository patterns
- **Platform Layer**: Android-specific payment processing via Kotlin

## Transaction Flow

1. **Initialization**: Device connects to payment gateway
2. **Transaction Request**: User initiates payment through UI
3. **Card Processing**: Hardware reads card data securely
4. **Authorization**: Transaction sent to payment processor
5. **Response Handling**: Result displayed and receipt printed
6. **Settlement**: Transaction recorded for later reconciliation

## Contributing

Please ensure all code follows the established patterns:
- Use Riverpod for state management
- Follow the existing naming conventions
- Add appropriate error handling
- Include tests for new features
- Update documentation as needed

## Support

For technical support or questions regarding the Kazang Pay terminal application, contact the development team.