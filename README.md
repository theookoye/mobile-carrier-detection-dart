# Mobile Carrier Detection Library (Dart)

This library detects the mobile carrier of a given South African phone number based on specific number patterns.

## Installation

Install the package using `dart pub`:

```bash

dart pub add mobile_carrier_detection

```

## Usage

```

import 'package:mobile_carrier_detection/index.dart';

void main() {
  final phoneNumber = '0821234567';
  final carrier = CarrierDetection.detectCarrier(phoneNumber);
  print('Carrier: $carrier');  // Output: Carrier: Vodacom
}


```

## Supported Carriers

MTN \
Vodacom \
Cell C \
Telkom Mobile \
Lycamobile SA \
Virgin Mobile \
Rain \
Toll-free, Premium-rate, and other service numbers 


## License

This project is licensed under the [MIT License](./LICENSE).
