import 'package:mobile_carrier_detection/index.dart';
import 'package:test/test.dart';

void main() {
  test('detectCarrier returns correct carrier', () {
    expect(MobileCarrierDetection.detectCarrier('0821234567'), equals('Vodacom'));
    expect(MobileCarrierDetection.detectCarrier('0731234567'), equals('MTN'));
    expect(MobileCarrierDetection.detectCarrier('27611234567'), equals('Cell C'));
    expect(MobileCarrierDetection.detectCarrier('invalid'), equals(null));
  });
}
