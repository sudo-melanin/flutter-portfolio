# Amos Emmanuel | Flutter Developer

**Flutter and Dart developer building practical, reliable cross-platform applications.**

🌐 **Portfolio:** [amos-emmanuel.pages.dev](https://amos-emmanuel.pages.dev/)  
💻 **GitHub:** [sudo-melanin](https://github.com/sudo-melanin)  
🔗 **LinkedIn:** [Amos Emmanuel](https://www.linkedin.com/in/amosemma93/)

## About

I am a Flutter developer focused on building applications that solve real-world problems. My work covers mobile application development, API integration, state management, local data persistence, and maintainable application architecture.

With a background in Chemical Engineering, I bring a systems-oriented approach to software development. I value clean code, thoughtful user experiences, performance, and solutions that remain reliable as applications grow.

## Featured Projects

### Police Hub
An offline-first professional reference and examination preparation application designed for law enforcement personnel, particularly in low-connectivity environments.

- Professional reference materials and study resources
- Promotional examination preparation
- Flutter-based Android application

**Status:** In Progress

### CoreLog
An offline-first productivity application for managing tasks, habits, and daily routines.

- Task and habit tracking
- Local data persistence
- Structured navigation and state management

**Status:** In Progress

### Weatherly
A weather application built with Flutter, developed as part of the HNG internship.

- Weather information presented through a mobile interface
- API integration
- Android release build

**Status:** Completed

### AI Background Remover
A mobile application for removing image backgrounds through an integrated background-removal service.

**Status:** Completed

### FitLink
A fitness-focused application designed to help users discover nearby gyms and connect with workout partners.

- Location-based discovery
- Gym exploration
- Matchmaking and messaging features

**Status:** In Progress

Explore these projects, along with additional work, screenshots, source links, and available APK downloads on the [live portfolio](https://amos-emmanuel.pages.dev/).

## Technical Skills

- **Languages:** Dart
- **Framework:** Flutter
- **State Management:** Riverpod, Provider
- **Navigation:** GoRouter
- **Backend and APIs:** Supabase, Firebase, REST APIs
- **Local Storage:** Hive, SQLite
- **Architecture:** Clean Architecture, feature-based organization
- **Tools:** Git, GitHub, Cloudflare Pages

## Portfolio Features

- Responsive layouts for desktop and mobile browsers
- Dedicated pages for projects, experience, and contact information
- Detailed project pages with features, technologies, and available links
- Contact form with validation and submission feedback
- Direct links to GitHub, LinkedIn, email, project repositories, and available Android builds

## Run Locally

### Prerequisites

- Flutter SDK
- Dart SDK, included with Flutter
- Git

### Setup

Clone the repository and enter the project directory:

```bash
git clone https://github.com/sudo-melanin/flutter-portfolio.git
cd flutter-portfolio
```

Install dependencies:

```bash
flutter pub get
```

Run the application locally:

```bash
flutter run -d web-server
```

Build the production web application:

```bash
flutter build web --release
```

The compiled website is generated in `build/web`.

## Deployment

The portfolio is hosted on Cloudflare Pages:

**Live site:** https://amos-emmanuel.pages.dev/

The repository uses a separate development and production workflow:

1. Develop and test changes on `dev`.
2. Run `flutter analyze` and verify the changes locally.
3. Merge the tested changes into `main`.
4. Push `main` to GitHub to trigger the production deployment on Cloudflare Pages.

The Cloudflare build script is located at `scripts/cloudflare_build.sh`.

## Contact

I am interested in opportunities to build useful software, collaborate with development teams, and continue growing as a Flutter developer.

- **GitHub:** https://github.com/sudo-melanin
- **LinkedIn:** https://www.linkedin.com/in/amosemma93/
- **Portfolio:** https://amos-emmanuel.pages.dev/