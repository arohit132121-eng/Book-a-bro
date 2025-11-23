// central dummy models & sample data used everywhere

class UserModel {
  final String id;
  final String name;
  final String username;
  final String vibe;

  const UserModel({required this.id, required this.name, required this.username, required this.vibe});
}

class ChatMessage {
  final String id;
  final String fromId;
  final String text;
  final DateTime time;

  ChatMessage({required this.id, required this.fromId, required this.text, required this.time});
}

class Hangout {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final int bros;
  final String vibe;

  Hangout({required this.id, required this.title, required this.subtitle, required this.time, required this.bros, required this.vibe});
}

class Moment {
  final String id;
  final String userId;
  final String text;
  final String timeAgo;
  final int likes;
  final int comments;

  Moment({required this.id, required this.userId, required this.text, required this.timeAgo, this.likes = 0, this.comments = 0});
}

// current user
const currentUser = UserModel(id: 'u0', name: 'You', username: 'you_bro', vibe: 'Chill');

// other users
const users = [
  UserModel(id: 'u1', name: 'Sarah', username: 'sarah09', vibe: 'Chill'),
  UserModel(id: 'u2', name: 'John', username: 'johnny', vibe: 'Music'),
  UserModel(id: 'u3', name: 'Megan', username: 'meg', vibe: 'Creative'),
  UserModel(id: 'u4', name: 'Alex', username: 'alex123', vibe: 'Sports'),
  UserModel(id: 'u5', name: 'Emily', username: 'emz', vibe: 'Chill'),
];

// chats (list of maps: peer, last, time, messages)
final chatList = [
  {
    'peer': users[0],
    'last': 'Great! How about you?',
    'time': '9:00 AM',
    'messages': [
      ChatMessage(id: 'm1', fromId: 'u1', text: 'Hey are we still on for lunch?', time: DateTime.now().subtract(const Duration(minutes: 90))),
      ChatMessage(id: 'm2', fromId: 'u0', text: 'Yes, definitely!', time: DateTime.now().subtract(const Duration(minutes: 85))),
    ],
  },
  {
    'peer': users[1],
    'last': 'See you then!',
    'time': '8:45 AM',
    'messages': [
      ChatMessage(id: 'm3', fromId: 'u2', text: 'See you then!', time: DateTime.now().subtract(const Duration(days: 1))),
    ],
  },
];

// hangouts
final hangouts = [
  Hangout(id: 'h1', title: 'Board Game Night', subtitle: 'Downtown Cafe', time: 'Today, 7:00 PM', bros: 8, vibe: 'Games'),
  Hangout(id: 'h2', title: 'Beach Volleyball', subtitle: 'Sunny Shore', time: 'Apr 25, 4:00 PM', bros: 12, vibe: 'Sports'),
  Hangout(id: 'h3', title: 'Coding Meetup', subtitle: 'Tech Hub', time: 'Tomorrow, 6:30 PM', bros: 6, vibe: 'Tech'),
];

// moments
final moments = [
  Moment(id: 'mm1', userId: 'u5', text: 'Relaxing with my coffee and enjoying the view.', timeAgo: '10 min ago', likes: 24, comments: 5),
  Moment(id: 'mm2', userId: 'u2', text: 'Who\'s up for an evening run at the park?', timeAgo: '30 min ago', likes: 6, comments: 1),
];