<div align="center">

<img src="docs/banner.png" alt="Lustre — premium accessories e-commerce app" width="100%"/>

# LUSTRE

### A premium accessories e-commerce mobile app built with Flutter

Watches · Rings · Earrings · Anklets · Pendants · Wallets — delivered fast, priced fairly.

[Features](#features) · [Screenshots](#screenshots) · [Getting Started](#getting-started) · [Team](#team)

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![State](https://img.shields.io/badge/State-Bloc%2FCubit-8A6F3E)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-3DDC84)
![i18n](https://img.shields.io/badge/Languages-English%20%7C%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9-C9A96E)
![Graduation Project](https://img.shields.io/badge/Graduation-Project-black)

</div>

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Screenshots](#screenshots)
- [Demo](#demo)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Design System](#design-system)
- [Getting Started](#getting-started)
- [Backend API](#backend-api)
- [Roadmap](#roadmap)
- [Team](#team)
- [Acknowledgements](#acknowledgements)
- [License](#license)

---

## About the Project

**Lustre** is a full-featured e-commerce mobile application for an accessories store. It covers the whole shopping journey — from signing up and browsing categories, to viewing product details and reviews, managing a cart with coupons, saving delivery addresses, and tracking orders — plus an **admin dashboard** for managing the product catalog.

The app ships with a refined **dark and light theme** (gold-accented), full **English / Arabic** localization with RTL support, and a clean feature-first architecture built on **Bloc/Cubit**.

---

## Features

### Customer
- **Onboarding & splash** screens for a polished first impression
- **Authentication** — register with email OTP verification, login, **Google Sign-In**, forgot / reset password with OTP, and change password
- **Home** — promo banners, category chips, *Hot Deals*, and all products
- **Categories & search** — browse by category and search products
- **Product details** — image gallery, specs (color, weight, stock), quantity selector, ratings, and **customer reviews** (write your own review)
- **Cart** — add / remove items, change quantity, apply **coupon codes**, and a friendly empty state
- **Checkout & orders** — payment method selection, order summary, order history, order details, and an **order tracking timeline**
- **Addresses** — add, edit, and delete delivery addresses
- **Profile** — profile photo upload, notifications (read / unread), privacy policy, about us, contact us, and secure logout
- **Dark / Light mode** and **English / Arabic (RTL)** — switchable at any time from the profile

### Admin
- **Admin dashboard** (shown only to the designated admin account) to list, search, add, and delete products — with bilingual (EN/AR) name and description, price, stock, color, category, and cover image upload

---

## Screenshots

### Authentication

<div align="center">
<img src="docs/screenshots/login-dark.jpg" width="200" alt="Login"/>
<img src="docs/screenshots/signup-dark.jpg" width="200" alt="Sign up"/>
<img src="docs/screenshots/forgot-password-dark.jpg" width="200" alt="Forgot password"/>
<img src="docs/screenshots/change-password-dark.jpg" width="200" alt="Change password"/>
</div>

### Shopping

<div align="center">
<img src="docs/screenshots/home-dark.jpg" width="200" alt="Home"/>
<img src="docs/screenshots/category-products-dark.jpg" width="200" alt="Category products"/>
<img src="docs/screenshots/product-details-dark.jpg" width="200" alt="Product details"/>
<img src="docs/screenshots/cart-dark.jpg" width="200" alt="Cart"/>
</div>

### Orders, Addresses & Profile

<div align="center">
<img src="docs/screenshots/orders-dark.jpg" width="200" alt="My orders"/>
<img src="docs/screenshots/addresses-dark.jpg" width="200" alt="Addresses"/>
<img src="docs/screenshots/notifications-dark.jpg" width="200" alt="Notifications"/>
<img src="docs/screenshots/profile-dark.jpg" width="200" alt="Profile"/>
</div>

### Light Mode & Arabic (RTL)

<div align="center">
<img src="docs/screenshots/login-light.jpg" width="200" alt="Login (light)"/>
<img src="docs/screenshots/product-details-light.jpg" width="200" alt="Product details (light)"/>
<img src="docs/screenshots/home-ar-light.jpg" width="200" alt="Home (Arabic)"/>
<img src="docs/screenshots/categories-ar-light.jpg" width="200" alt="Categories (Arabic)"/>
</div>

<details>
<summary><b>More screens</b></summary>
<br/>

<div align="center">
<img src="docs/screenshots/empty-cart-dark.jpg" width="200" alt="Empty cart"/>
<img src="docs/screenshots/cart-light.jpg" width="200" alt="Cart (light)"/>
<img src="docs/screenshots/categories-light.jpg" width="200" alt="Categories (light)"/>
<img src="docs/screenshots/profile-light.jpg" width="200" alt="Profile (light)"/>
<img src="docs/screenshots/profile-ar-light.jpg" width="200" alt="Profile (Arabic)"/>
</div>

</details>

### Admin Dashboard

<div align="center">
<img src="docs/screenshots/admin-products-dark.jpg" width="200" alt="Admin products overview"/>
<img src="docs/screenshots/admin-add-product-dark.jpg" width="200" alt="Admin add product"/>
</div>

---

## Demo

> 🎥 **Demo video:** _add your YouTube / Google Drive link here_
> 📦 **Download APK:** _add a link to your release APK (GitHub → Releases)_

---

## Tech Stack

| Category | Technology |
| --- | --- |
| Framework | [Flutter](https://flutter.dev) (Dart) |
| State management | `flutter_bloc` / `bloc` (Cubit) |
| Networking | `dio`, `pretty_dio_logger` |
| Functional error handling | `dartz` (`Either`), `equatable` |
| Secure storage | `flutter_secure_storage` (auth tokens) |
| Authentication | Email + OTP, `google_sign_in` |
| Localization | `flutter_localizations`, `intl` (ARB files — EN / AR) |
| Responsive UI | `flutter_screenutil` |
| UI & assets | `google_fonts`, `flutter_svg`, `timeline_tile`, `pinput`, `pin_code_fields`, `fluttertoast` |
| Media & files | `image_picker`, `file_picker`, `path_provider` |

---

## Architecture

The app follows a **feature-first, layered architecture**. Each feature is split into a `data` layer (models, remote data sources, repositories) and a `presentation` layer (screens, widgets, cubits), with shared code in `core`.

```mermaid
flowchart LR
    UI["UI<br/>screens & widgets"] -->|user actions| C["Cubit (Bloc)<br/>state management"]
    C -->|emits states| UI
    C --> R["Repository<br/>Either&lt;Failure, Data&gt;"]
    R --> D["Remote data source<br/>Dio"]
    D -->|REST / JSON| API[("Lustre API")]
    D -.->|tokens| S[("Secure storage")]
```

### User Journey

```mermaid
flowchart LR
    A([Splash]) --> B[Onboarding] --> C{Logged in?}
    C -- No --> D[Login / Sign up<br/>+ Google, OTP]
    C -- Yes --> E
    D --> E[Home]
    E --> F[Categories & Search]
    F --> G[Product details<br/>+ reviews]
    G --> H[Cart<br/>+ coupon]
    H --> I[Checkout<br/>address & payment]
    I --> J[Orders<br/>+ tracking timeline]
```

---

## Project Structure

```
lib/
├── core/
│   ├── cache/            # Secure storage helpers
│   ├── errors/           # Failure & error handling
│   ├── helper/           # Validators, strings
│   ├── language/         # Language cubit & content localization
│   ├── network/          # Dio factory & API constants
│   ├── routing/          # Route generator & route names
│   ├── shared_widgets/   # Reusable widgets (product card, nav bar, ...)
│   ├── theme/            # Light / dark themes & theme cubit
│   └── utils/            # Colors, styles, image paths
├── feature/
│   ├── onboarding/  splash/  auth/  home/  categories/  search/
│   ├── product_details/  cart/  order/  adresses/  profile/  admin/
│   └── main/             # Bottom-navigation shell
├── l10n/                 # app_en.arb, app_ar.arb
└── main.dart
```

---

## Design System

Lustre uses a warm **gold-on-charcoal** identity with a luxury serif for headings (**DM Serif Display**) and clean sans-serif body text — available in both dark and light themes.

| Token | Dark | Light |
| --- | --- | --- |
| Primary (gold) | ![#C9AE7C](https://img.shields.io/badge/-C9AE7C-C9AE7C?style=flat-square) `#C9AE7C` | ![#9B8054](https://img.shields.io/badge/-9B8054-9B8054?style=flat-square) `#9B8054` |
| Background | ![#131315](https://img.shields.io/badge/-131315-131315?style=flat-square) `#131315` | ![#F8F5EF](https://img.shields.io/badge/-F8F5EF-F8F5EF?style=flat-square) `#F8F5EF` |
| Surface / cards | ![#1C1C1F](https://img.shields.io/badge/-1C1C1F-1C1C1F?style=flat-square) `#1C1C1F` | ![#FFFFFF](https://img.shields.io/badge/-FFFFFF-FFFFFF?style=flat-square) `#FFFFFF` |
| Primary text | ![#F2F2F2](https://img.shields.io/badge/-F2F2F2-F2F2F2?style=flat-square) `#F2F2F2` | ![#1E1B16](https://img.shields.io/badge/-1E1B16-1E1B16?style=flat-square) `#1E1B16` |
| Danger | ![#F08A8A](https://img.shields.io/badge/-F08A8A-F08A8A?style=flat-square) `#F08A8A` | ![#C94B4B](https://img.shields.io/badge/-C94B4B-C94B4B?style=flat-square) `#C94B4B` |

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel, Dart `>=3.13.1`)
- Android Studio or VS Code with the Flutter extension
- An Android emulator / iOS simulator or a physical device

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/mohamedshabaan223/E_commerce_App.git
cd E_commerce_App

# 2. Install dependencies
flutter pub get

# 3. Generate localization files
flutter gen-l10n

# 4. Run the app
flutter run
```

### Build a release APK

```bash
flutter build apk --release
```

> **Google Sign-In:** to use it on your own build, register your app's package name and SHA-1 fingerprint in your Google Cloud / Firebase project.

---

## Backend API

The app consumes a REST API configured in [`lib/core/network/api_constatnt.dart`](lib/core/network/api_constatnt.dart):

```dart
static const String baseUrl = 'https://accessories-eshop.runasp.net/api/';
```

| Area | Endpoints (examples) |
| --- | --- |
| Auth | `auth/register`, `auth/verify-email`, `auth/login`, `auth/google/mobile`, `auth/refresh-token`, `auth/change-password`, `auth/logout` |
| Products | `products` |
| Cart | `cart`, `cart/items`, `cart/items/decrement`, `cart/apply-coupon` |
| Reviews | `reviews/{productId}` |

To point the app to your own server, change `baseUrl` in that file.

---

## Roadmap

- [x] Authentication (email OTP, Google Sign-In, password reset)
- [x] Product catalog, categories, search, and reviews
- [x] Cart with coupons, checkout, and order tracking
- [x] Dark / light themes and English / Arabic (RTL)
- [x] Admin product management
- [ ] Wishlist / favorites
- [ ] Online payment gateway integration
- [ ] Push notifications for order updates
- [ ] Role-based admin access from the backend
- [ ] Unit & widget test coverage

---

## Team

| # | Name | Role | GitHub |
| :-: | --- | --- | --- |
| 1 | **Raghdaa Emad Elsayed** | _Role_ | [@raghdaaaaa](https://github.com/raghdaaaaa) |
| 2 | **Mohamed Shabaan Abdelrazik** | _Role_ | [@mohamedshabaan223](https://github.com/mohamedshabaan223) |
| 3 | **Reham Mohamed Nofal** | _Role_ | [@reham-05](https://github.com/reham-05) |
| 4 | **Ahmed Mahmoud Hassan** | _Role_ | [@medo337](https://github.com/medo337) |
| 5 | **Sohailah Mohammed Eliwa** | _Role_ | [@sohailahazab257-droid](https://github.com/sohailahazab257-droid) |
| 6 | **Malak Mahmoud Elgizawy** | _Role_ | [@malakelgizawy11](https://github.com/malakelgizawy11) |
| 7 | **Alaa Diaa Mohamed** | _Role_ | [@haladiaa47-create](https://github.com/haladiaa47-create) |
| 8 | **Mervat Hamed Elshafie** | _Role_ | [@Nevo-code](https://github.com/Nevo-code) |

**Supervisor:** _Dr. Full Name_
**Faculty / University:** _Faculty of ..., University name_ — Graduation Project, _2026_

---

## Acknowledgements

- [Flutter](https://flutter.dev) and the open-source packages listed above
- Our supervisor and faculty for their guidance and support

---

## License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for details.
