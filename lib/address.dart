final String tableAddress = 'address';

class NoteAddress{
  static final String addLine1 = 'addLine1';
  static final String addLine2 = 'addLine2';
  static final String addLine3 = 'addLine3';
}

class Address{
 final String addLine1;
 final String addLine2;
 final String addLine3;

  Address({ 
    required this.addLine1 , 
    required this.addLine2 , 
    required this.addLine3  
    }); 

    Address copy({
        String? addLine1,
        String? addLine2,
        String? addLine3
    }) =>
      Address(
      addLine1: addLine1 ?? this.addLine1,
       addLine2: addLine2 ?? this.addLine2, 
       addLine3: addLine3 ?? this.addLine3
       );

    Map<String , dynamic> toJson() => {
      // AddressFields.addLine1 : addLine1 ,
      // AddressFields.addLine2 : addLine2 ,
      // AddressFields.addLine3 : addLine3 ,
      "addLine1" : addLine1, 
      "addLine2" : addLine2, 
      "addLine3" : addLine3
    };

  }
