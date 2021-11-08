String colorizeConsoleText(String myString) {
  return "\u001b[42m\x1B[34m" + myString + "\x1B[0m\u001b[0m";
}

void printColorizedConsoleText(String myString) {
  print("\u001b[42m\x1B[34m" + myString + "\x1B[0m\u001b[0m");
}
