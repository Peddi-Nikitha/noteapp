import 'package:flutter/material.dart';
import '../utils/illustrations.dart';
import '../widgets/illustration_widget.dart';

/// Demo screen showcasing all available unDraw illustrations
class IllustrationsDemoScreen extends StatelessWidget {
  const IllustrationsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Illustrations'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildIllustrationCard(
            context,
            'Taking Notes',
            Illustrations.takingNotes,
            'Perfect for note-taking features',
          ),
          const SizedBox(height: 16),
          _buildIllustrationCard(
            context,
            'Empty State',
            Illustrations.emptyState,
            'Use when there are no notes to display',
          ),
          const SizedBox(height: 16),
          _buildIllustrationCard(
            context,
            'To-Do List',
            Illustrations.toDoList,
            'Great for task or checklist features',
          ),
          const SizedBox(height: 16),
          _buildIllustrationCard(
            context,
            'Book Lover',
            Illustrations.bookLover,
            'Reading or learning related content',
          ),
          const SizedBox(height: 16),
          _buildIllustrationCard(
            context,
            'Creative Thinking',
            Illustrations.creativeThinking,
            'Brainstorming or creative features',
          ),
          const SizedBox(height: 16),
          _buildIllustrationCard(
            context,
            'Welcome',
            Illustrations.welcome,
            'Onboarding or welcome screens',
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrationCard(
    BuildContext context,
    String title,
    String assetPath,
    String description,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 16),
            Center(
              child: IllustrationWidget(
                assetPath: assetPath,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
