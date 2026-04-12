
class RatingDistribution {
  int one;
  int two;
  int three;
  int four;
  int five;

  RatingDistribution({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
  });

  factory RatingDistribution.fromJson(Map<String, dynamic> json) {
    return RatingDistribution(
      one: json['1'],
      two: json['2'],
      three: json['3'],
      four: json['4'],
      five: json['5'],
    );
  }
}