import '../models/note_model.dart';

class StaticNotesData {
  static List<NoteModel> getSampleNotes() {
    final now = DateTime.now();
    
    return [
      NoteModel(
        id: '1',
        title: 'Flutter Development Tips',
        content: 'Remember to use const constructors wherever possible to improve performance. Also, always dispose controllers in the dispose method to prevent memory leaks.',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 5)),
        updatedAt: now.subtract(const Duration(hours: 2)),
        category: 'Study',
      ),
      NoteModel(
        id: '2',
        title: 'Team Meeting Notes',
        content: 'Discussed Q2 goals and project timeline. Need to follow up with design team about the new UI mockups. Sprint planning scheduled for next Monday.',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 3)),
        updatedAt: now.subtract(const Duration(hours: 5)),
        category: 'Work',
      ),
      NoteModel(
        id: '3',
        title: 'Grocery List',
        content: 'Milk, Eggs, Bread, Chicken, Vegetables (carrots, broccoli), Fruits (apples, bananas), Coffee, Pasta, Tomato sauce, Cheese',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(hours: 8)),
        category: 'Shopping',
      ),
      NoteModel(
        id: '4',
        title: 'Workout Routine',
        content: 'Monday: Chest & Triceps\nWednesday: Back & Biceps\nFriday: Legs & Shoulders\nRemember to do 10 min warm-up and cool-down stretches.',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 7)),
        updatedAt: now.subtract(const Duration(days: 1)),
        category: 'Personal',
      ),
      NoteModel(
        id: '5',
        title: 'Book Recommendations',
        content: 'Clean Code by Robert Martin, The Pragmatic Programmer, Design Patterns: Elements of Reusable Object-Oriented Software, Atomic Habits by James Clear',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(days: 2)),
        category: 'Study',
      ),
      NoteModel(
        id: '6',
        title: 'Project Ideas',
        content: 'Build a weather app with animations, Create a recipe sharing platform, Develop a habit tracker with statistics, Make a budget management tool',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 4)),
        updatedAt: now.subtract(const Duration(hours: 12)),
        category: 'Work',
      ),
      NoteModel(
        id: '7',
        title: 'Birthday Gift Ideas',
        content: 'For Mom: Spa voucher or gardening tools\nFor Dad: New watch or golf accessories\nFor Sarah: Art supplies or concert tickets',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 6)),
        updatedAt: now.subtract(const Duration(days: 3)),
        category: 'Personal',
      ),
      NoteModel(
        id: '8',
        title: 'Travel Checklist',
        content: 'Passport, Tickets, Hotel confirmation, Travel insurance, Medications, Chargers, Camera, Comfortable shoes, Weather-appropriate clothes',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(hours: 6)),
        category: 'Misc',
      ),
      NoteModel(
        id: '9',
        title: 'Code Review Feedback',
        content: 'Great work on the new feature! Consider extracting the validation logic into a separate utility class. Also, add unit tests for edge cases.',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(hours: 18)),
        updatedAt: now.subtract(const Duration(hours: 1)),
        category: 'Work',
      ),
      NoteModel(
        id: '10',
        title: 'Recipe: Pasta Carbonara',
        content: 'Ingredients: Spaghetti, Eggs, Parmesan, Bacon, Black pepper, Salt\nCook pasta, fry bacon, mix eggs with cheese, combine everything. Simple and delicious!',
        userId: 'demo_user',
        createdAt: now.subtract(const Duration(days: 8)),
        updatedAt: now.subtract(const Duration(days: 4)),
        category: 'Personal',
      ),
    ];
  }
}
