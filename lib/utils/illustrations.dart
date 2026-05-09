/// Centralized access to unDraw SVG illustrations
/// All illustrations are from undraw.co (MIT licensed, no attribution required)
class Illustrations {
  // Private constructor to prevent instantiation
  Illustrations._();

  // Base path for all illustrations
  static const String _basePath = 'assets/images/';

  // Illustration paths
  static const String takingNotes = '${_basePath}taking_notes.svg';
  static const String emptyState = '${_basePath}empty_state.svg';
  static const String toDoList = '${_basePath}to_do_list.svg';
  static const String bookLover = '${_basePath}book_lover.svg';
  static const String creativeThinking = '${_basePath}creative_thinking.svg';
  static const String welcome = '${_basePath}welcome.svg';
}
