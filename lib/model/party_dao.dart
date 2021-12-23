import 'package:firebase_database/firebase_database.dart';
import 'package:shifumi/model/party.dart';

class PartyDao {
  DatabaseReference ref =
      FirebaseDatabase.instance.reference().child("parties");
  late DatabaseReference child;

  void saveParty(Party party) {
    ref.child(party.code).set(party.toJson());
  }

  String getParty(String partyCode, var visitor) {
    Party p = Party("pas cette fois", "", 0, 0);
    String h = "-";

    /*ref.child(partyCode).child("host").once().then((DataSnapshot snapshot) {
      return Party.fromJson(Map<snapshot.key, snapshot.value>);
    });*/
    ref.child(partyCode).child("host").once().then((DataSnapshot dataSnapshot) {
      h = dataSnapshot.value.toString();
    });
    //return p;
    return h;
  }
}
