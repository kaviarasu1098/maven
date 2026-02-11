# Space Rental Booking (Flutter)

A production-oriented Flutter app foundation for booking **backyards, dunkyards, parking spaces, and grounds**.

## Android compatibility

- **Minimum supported:** Android 9 (API 28)
- **Compile/target SDK:** 35 (forward-compatible baseline for Android 15/16 cycles)

## What's included in this branch (`feature/next-milestones`)

### 1) Map discovery + location permissions
- Google Maps powered discovery view with map/list toggle
- Runtime location permission flow (via `geolocator`)
- Listing markers with category and price context

### 2) Authentication with owner/renter roles
- Role-based sign-in scaffold (`renter`, `owner`)
- Simple auth service abstraction, ready to swap with Firebase/OAuth backend

### 3) Payments, refunds, and payouts orchestration
- Payment intent simulation surface
- Refund request flow (policy-aware)
- Owner payout request flow
- Service boundaries designed for real gateway integration

### 4) AI-assisted dynamic pricing recommendations
- Host console with configurable pricing inputs
- Heuristic recommendation engine for weekend/event/occupancy-aware pricing
- ML-ready service boundary (`PricingService`) for future model integration

## Recommended next additions

1. **Backend contracts first**
   - Define API schema for bookings, payout ledgers, and refund states.
2. **Secure auth in production**
   - Implement token-based auth with role claims enforced server-side.
3. **Payments hardening**
   - Add webhook ingestion, idempotency keys, and reconciled transaction ledger.
4. **Observability**
   - Add event telemetry (search → booking funnel, refund rates, payout latency).
5. **AI evolution**
   - Upgrade heuristic model to trained dynamic pricing model with offline + online evaluation.

## Setup

```bash
flutter pub get
flutter run
```

> Add your Google Maps API key in `android/app/src/main/AndroidManifest.xml` under `com.google.android.geo.API_KEY`.
