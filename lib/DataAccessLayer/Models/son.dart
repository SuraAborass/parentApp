import 'dart:convert';

class Son {
  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String birthday;
  final int gender;
  final String phone;
  final String address;
  final String year;
  final String image;
  final String email;
  final String userType;
  final String grade;
  final String section;

  Son({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.birthday,
    required this.gender,
    required this.phone,
    required this.address,
    required this.year,
    required this.image,
    required this.email,
    required this.userType,
    required this.grade,
    required this.section
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'father_name': fatherName,
      'mother_name': motherName,
      'birthday': birthday,
      'gender': gender,
      'phone': phone,
      'address': address,
      'year': year,
      'image': image,
      'email': email,
      'user_type': userType,
      'classs': grade,
      'section': section
    };
  }

  factory Son.fromMap(Map<String, dynamic> map) {
    return Son(
      id: map['id'] ?? 0,
      firstName: map['user']['first_name'] ?? '',
      lastName: map['user']['last_name'] ?? '',
      fatherName: map['user']['father_name'] ?? '',
      motherName: map['user']['mother_name'] ?? '',
      birthday: map['user']['birthday'] ?? '',
      gender: map['user']['gender'] ?? 0,
      phone: map['user']['phone'] ?? '',
      address: map['user']['address'] ?? '',
      year: map['user']['year'] ?? '',
      image: map['user']['image_file_url'] ?? '',
      email: map['user']['email'] ?? '',
      userType: map['user']['user_type'] ?? '',
      grade: map['classs']['name'] ?? '',
      section: map['section']['num_section'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Son.fromJson(String source) =>
      Son.fromMap(json.decode(source) as Map<String, dynamic>);
}
