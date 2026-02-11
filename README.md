# Space Rental Booking (Flutter)

A product-grade Flutter starter app for booking micro-spaces such as **backyards, dunkyards, parking spaces, and grounds**.

## Android compatibility

This project is configured to support:
- **Minimum:** Android 9 (API 28)
- **Target/Compile:** Android 15+ toolchain target (`targetSdk`/`compileSdk` set to 35)

This setup is ready to stay compatible across Android 9 through newer Android versions (including Android 16 previews) with routine SDK updates.

## Core product modules

- **Marketplace Discovery:** category cards, search/filter-ready home scaffold
- **Booking Foundation:** slot-based booking flow placeholder
- **Owner Operations:** future-ready hooks for listing management and earnings dashboard
- **Trust Layer:** ratings, verification, and policy surfaces planned into UX sections

## Architecture direction

Recommended expansion path:

1. `presentation/` for screens, widgets, and state management
2. `domain/` for entities + use cases (Booking, Listing, Pricing)
3. `data/` for repositories and API/Firebase integrations
4. `core/` for shared components, error models, and utilities

## Run locally

1. Install Flutter SDK (stable channel, Dart 3.4+)
2. Run:

```bash
flutter pub get
flutter run
```

## Next milestones

- Integrate map-based discovery and location permissions
- Add authentication (owner/renter roles)
- Introduce payment, refunds, and payout orchestration
- Add AI-assisted dynamic pricing recommendations
