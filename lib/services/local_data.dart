// lib/services/local_data.dart
// Simple local data provider for prototype mode

import 'dart:async';

class LocalData {
  // single mock current user
  static final Map<String, dynamic> me = {
    "uid": "u1",
    "name": "Test Bro",
    "username": "test_bro",
    "photoUrl": "",
    "vibes": ["Chill", "Music"],
    "trusted": ["u2"],
    "trustedBy": ["u3"],
    "location": "Mumbai",
    "latitude": 12.9716,
    "longitude": 77.5946,
    "bio": "I make vibes.",
  };

  static final List<Map<String, dynamic>> mockChats = [
    {
      "chatId": "c1",
      "participant": {
        "uid": "u2",
        "name": "Rohit",
        "photoUrl": "",
      },
      "lastMessage": "Yo bro, what's up?",
      "timestamp": DateTime.now().subtract(const Duration(minutes: 4)),
      "unreadCount": 2,
    },
    {
      "chatId": "c2",
      "participant": {
        "uid": "u3",
        "name": "Alex",
        "photoUrl": "",
      },
      "lastMessage": "Let's hangout tmr!",
      "timestamp": DateTime.now().subtract(const Duration(hours: 3)),
      "unreadCount": 0,
    },
  ];

  static final List<Map<String, dynamic>> mockMoments = [
    {
      "id": "m1",
      "userName": "Rohit",
      "userPhoto": "",
      "vibe": "Chill",
      "caption": "Coffee + sunset",
      "imageUrl": "",
      "likes": 24,
      "comments": 5,
      "timeStamp": DateTime.now().subtract(const Duration(hours: 2)),
      "trusted": true
    },
    {
      "id": "m2",
      "userName": "Alex",
      "userPhoto": "",
      "vibe": "Music",
      "caption": "jamming",
      "imageUrl": "",
      "likes": 12,
      "comments": 1,
      "timeStamp": DateTime.now().subtract(const Duration(days: 1)),
      "trusted": false
    },
  ];

  static final List<Map<String, dynamic>> mockHangouts = [
    {
      "id": "h1",
      "title": "Beach Volleyball",
      "subtitle": "Lively Shore",
      "bros": 12,
      "trustedOnly": false,
      "location": "Morning Cafe",
      "time": "April 25, 4:00 PM",
      "tags": ["Sports", "Energetic"],
      "image": "",
    },
    {
      "id": "h2",
      "title": "Open Mic Night",
      "subtitle": "Cozy corner",
      "bros": 8,
      "trustedOnly": false,
      "location": "DownTown Bar",
      "time": "Nov 20, 8:00 PM",
      "tags": ["Music"],
      "image": "",
    }
  ];

  static final List<Map<String, dynamic>> mockSuggestions = [
    {
      "uid": "u4",
      "name": "Arun",
      "photoUrl": "",
      "vibes": ["Gaming", "Creative"],
      "location": "Chennai",
    },
    {
      "uid": "u5",
      "name": "Leo",
      "photoUrl": "",
      "vibes": ["Chill", "Sports"],
      "location": "Bangalore",
    },
  ];

  // Simulated network delay helpers (use these in FutureBuilders)
  static Future<Map<String, dynamic>> fetchCurrentUser({int ms = 300}) async {
    await Future.delayed(Duration(milliseconds: ms));
    return me;
  }

  static Future<List<Map<String, dynamic>>> fetchChats({int ms = 300}) async {
    await Future.delayed(Duration(milliseconds: ms));
    return mockChats;
  }

  static Future<List<Map<String, dynamic>>> fetchMoments({int ms = 300}) async {
    await Future.delayed(Duration(milliseconds: ms));
    return mockMoments;
  }

  static Future<List<Map<String, dynamic>>> fetchHangouts({int ms = 300}) async {
    await Future.delayed(Duration(milliseconds: ms));
    return mockHangouts;
  }

  static Future<List<Map<String, dynamic>>> fetchSuggestions({int ms = 250}) async {
    await Future.delayed(Duration(milliseconds: ms));
    return mockSuggestions;
  }
}