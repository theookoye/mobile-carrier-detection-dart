class MobileCarrierDetection {
  static const Map<String, String> _carrierPatterns = {
    'MTN':
        r'^(060[3-5]|063[0-5]|063[8-9]|065[5-7]|0710|071[7-9]|073|078|083|0810)',
    'Vodacom':
        r'^(060[6-9]|063[6-7]|064[6-9]|065[0-3]|066[0-5]|071[1-6]|072|076|079|0818|082)',
    'Cell C': r'^(061[0-3]|061[5-9]|062|064[1-5]|074|084)',
    'Telkom Mobile': r'^(0614|065[8-9]|067[0-2]|0811|0815|0817)',
    'Lycamobile SA': r'^0654',
    'Virgin Mobile': r'^0741',
    'Rain': r'^0816',
    'Toll-free': r'^080',
    'USAL licence holders': r'^085',
    'Sharecall/MaxiCall/Premium-rate services': r'^086[0-9]{1,2}',
    'Value-added services (VoIP)': r'^087',
    'Pagers and Telkom CallAnswer voicemail': r'^088',
    'Maxinet, polls, and radio call-in services': r'^089',
    'Premium-rate services': r'^(090|0902|091|092)',
    'Machine related services': r'^(096|097|098)',
  };

  static final Map<String, RegExp> _compiledPatterns = Map.fromEntries(
    _carrierPatterns.entries.map(
      (entry) => MapEntry(entry.key, RegExp(entry.value)),
    ),
  );

  static String _cleanPhoneNumber(String phoneNumber) {
    var cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleaned.startsWith('27')) {
      cleaned = cleaned.substring(2);
    }
    
    if (!cleaned.startsWith('0')) {
      cleaned = '0$cleaned';
    }
    
    return cleaned;
  }

  static String? detectCarrier(String phoneNumber) {
    final cleanedNumber = _cleanPhoneNumber(phoneNumber);
    return _compiledPatterns.entries
            .firstWhere(
              (entry) => entry.value.hasMatch(cleanedNumber),
              orElse: () => MapEntry('', RegExp('')),
            )
            .key
            .isNotEmpty
        ? _compiledPatterns.entries
            .firstWhere(
              (entry) => entry.value.hasMatch(cleanedNumber),
            )
            .key
        : null;
  }
}
