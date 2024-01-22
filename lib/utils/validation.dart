mixin class Validation {
  String? emptyStringValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    }
    return null;
  }
}
