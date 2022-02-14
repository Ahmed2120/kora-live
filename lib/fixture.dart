class SoccerMatch{
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  League league;
  SoccerMatch(this.fixture, this.home, this.away, this.goal, this.league);

  factory SoccerMatch.fromJson(Map<String, dynamic> json){
    return SoccerMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals']),
      League.fromJson(json['league']),
    );
  }
}

class Fixture{
  int id;
  String? date;
  Status status;
  Venue venue;

  Fixture(this.id, this.date, this.status, this.venue);
  
  factory Fixture.fromJson(Map<String, dynamic> json){
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']), Venue.fromJson(json['venue']));
  }
}

class Status{
  int? elapsedTime;
  String? long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json){
    return Status(json['elapsed'], json['long']);
  }
}

class Venue{
  String? name;
  Venue(this.name);

  factory Venue.fromJson(Map<String, dynamic> json){
    return Venue(json['name']);
  }
}

class League{
  String? name;
  String? logoUrl;
  String? round;
  League(this.name, this.logoUrl, this.round);

  factory League.fromJson(Map<String, dynamic> json){
    return League(json['name'], json['logo'], json['round']);
  }
}

class Team{
  int? id;
  String? name;
  String? logoUrl;
  bool? winner;
  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromJson(Map<String, dynamic> json){
    return Team(json['id'],json['name'],json['logo'], json['winner']);
  }
}

class Goal{
  int? home;
  int? away;
  Goal(this.home, this.away);

  factory Goal.fromJson(Map<String, dynamic> json){
    return Goal(json['home'], json['away']);
  }
}