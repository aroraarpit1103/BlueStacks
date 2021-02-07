class UserResponse {
  String name;
  String avatar;
  int eloPoints;
  int tournamentsPlayed;
  int tournamentsWon;
  int winPercent;

  UserResponse(
      {this.name,
        this.avatar,
        this.eloPoints,
        this.tournamentsPlayed,
        this.tournamentsWon,
        this.winPercent});

  UserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    eloPoints = json['elo_points'];
    tournamentsPlayed = json['tournaments_played'];
    tournamentsWon = json['tournaments_won'];
    winPercent = json['win_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['elo_points'] = this.eloPoints;
    data['tournaments_played'] = this.tournamentsPlayed;
    data['tournaments_won'] = this.tournamentsWon;
    data['win_percent'] = this.winPercent;
    return data;
  }
}
