import 'package:flutter/material.dart';
import '../utils/illustrations.dart';
import 'illustration_widget.dart';

/// Empty state widget to display when user has no notes
class EmptyNotesState extends StatelessWidget {
  final VoidCallback? onCreateNote;

  const EmptyNotesState({
    super.key,
    this.onCreateNote,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IllustrationWidget(
              assetPath: Illustrations.emptyState,
              height: 200,
            ),
            const SizedBox(height: 32),
            Text(
              'No notes yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'Start capturing your thoughts and ideas',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (onCreateNote != null)
              ElevatedButton.icon(
                onPressed: onCreateNote,
                icon: const Icon(Icons.add),
                label: const Text('Create Your First Note'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
