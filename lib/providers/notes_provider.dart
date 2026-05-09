import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/note_model.dart';

class NotesProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<NoteModel> _notes = [];
  List<NoteModel> _visibleNotes = [];
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<NoteModel> get notes => _visibleNotes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => const ['All', 'Study', 'Work', 'Personal', 'Shopping', 'Misc'];

  void updateUser(User? user) {
    _user = user;
    if (user != null) {
      fetchNotes();
    } else {
      _notes = [];
      _visibleNotes = [];
      notifyListeners();
    }
  }

  Future<void> fetchNotes() async {
    if (_user == null) return;

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final querySnapshot = await _firestore
          .collection('notes')
          .where('user_id', isEqualTo: _user!.uid)
          .get();

      _notes = querySnapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
      _notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      _applyFilters();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to fetch notes: ${e.toString()}';
      notifyListeners();
    }
  }

  Future<bool> addNote(String title, String content, String category) async {
    if (_user == null) return false;

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final now = DateTime.now();
      final noteData = {
        'title': title,
        'content': content,
        'user_id': _user!.uid,
        'created_at': Timestamp.fromDate(now),
        'updated_at': Timestamp.fromDate(now),
        'category': category,
      };

      await _firestore.collection('notes').add(noteData);
      await fetchNotes();

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to add note: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateNote(
    String noteId,
    String title,
    String content,
    String category,
  ) async {
    if (_user == null) return false;

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _firestore.collection('notes').doc(noteId).update({
        'title': title,
        'content': content,
        'category': category,
        'updated_at': Timestamp.fromDate(DateTime.now()),
      });

      await fetchNotes();

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to update note: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteNote(String noteId) async {
    if (_user == null) return false;

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _firestore.collection('notes').doc(noteId).delete();
      await fetchNotes();

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to delete note: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  void searchNotes(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    final normalizedQuery = _searchQuery.trim().toLowerCase();
    _visibleNotes = _notes.where((note) {
      final categoryMatches = _selectedCategory == 'All' || note.category == _selectedCategory;
      final searchMatches = normalizedQuery.isEmpty ||
          note.title.toLowerCase().contains(normalizedQuery) ||
          note.content.toLowerCase().contains(normalizedQuery);
      return categoryMatches && searchMatches;
    }).toList();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
