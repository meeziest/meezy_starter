extension When on Object? {
  V? match<K, V>(Map<K, V Function()> variants) {
    for (final variant in variants.entries) {
      if (variant.key == this) return variant.value();
    }
    return null;
  }

  V when<K, V>(Map<K, V Function()> variants, V Function() orElse) {
    for (final variant in variants.entries) {
      if (variant.key == this) return variant.value();
    }
    return orElse();
  }

  V whenSure<K, V>(Map<K, V Function()> variants) {
    for (final variant in variants.entries) {
      if (variant.key == this) return variant.value();
    }
    throw 'whenSure -> No element found in variants';
  }

  V? whenOrNull<K, V>(Map<K, V Function()> variants) {
    for (final variant in variants.entries) {
      if (variant.key == this) return variant.value();
    }
    return null;
  }

  V whenNamed<K, V>({
    required Map<K, V Function()> variants,
    required V Function() orElse,
  }) {
    for (final variant in variants.entries) {
      if (variant.key == this) return variant.value();
    }
    return orElse();
  }
}
