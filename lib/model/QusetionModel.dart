class QusetionModel {
late int id;
late String name;
late String A;
late String B;
late String C;
late String D;
late String S;
QusetionModel.FromJs(Map<dynamic,dynamic>map){
   this.id = map['id'];
   this.name = map['name'];
   this.A = map['A'];
   this.B = map['B'];
   this.C = map['C'];
   this.S = map['S'];
   this.D = map['D'];
  }
QusetionModel();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'A': A,
      'B': B,
      'C': C,
      'D': D,
      'S': S,
    };
  }

}
