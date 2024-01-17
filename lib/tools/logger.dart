import 'package:logger/logger.dart';

var logger = Logger(
  filter:
      DevelopmentFilter(), // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);

var loggerNoStack = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      printEmojis: false, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => loggerNoStack.i(match.group(0)));
}
