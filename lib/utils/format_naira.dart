String formatNaira(int amount) {
  final String symbol = '₦';
  final String fixedDigits = amount.toStringAsFixed(2);

  final List<String> parts = fixedDigits.split('.');

  final String integerPart = parts[0];
  final String decimalPart = parts[1];

  // Regex matches groups of 3 digits from right to left
  final RegExp regExp = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  String formattedInteger = integerPart.replaceAllMapped(
    regExp,
    (Match match) => '${match[1]},',
  );

  return '$symbol$formattedInteger.$decimalPart';
}
