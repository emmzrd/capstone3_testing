class Post {
  String id;
  String profileImageUrl;
  String mobile;
  String position;
  String name;
  String email;
  String company;
  String address;
  String telephone;
  String fax;
  String leaves;




  Post({
    required this.id,
    required this.profileImageUrl,
    required this.mobile,
    required this.position,
    required this.name,
    required this.email,
    required this.company,
    required this.address,
    required this.telephone,
    required this.fax,
    required this.leaves
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      mobile: json['mobile'] ?? '',
      position: json['position'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      company: json['company'] ?? '',
      address: json['address'] ?? '',
      telephone: json['telephone'] ?? '',
      fax: json['fax'] ?? '',
      leaves: json['leaves'] ?? '',

    );
  }
}
