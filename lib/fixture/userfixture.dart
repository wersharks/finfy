import 'dart:convert';

import 'package:crypto_app/models/usermodel.dart';

class CUserFixture {
    static CUser dummyHSK(){
        Map<String, dynamic> data = jsonDecode('{"studentId":"abcddef","name":"HSK","rollno":"102003066","teachercode":"tcoda1r3","phoneNo":"8872276957","schoolname":"Thapar","fincoin":1000}');
        final CUser hsk = CUser.fromJson(data);
        return hsk;
    }

}
