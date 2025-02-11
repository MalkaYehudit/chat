import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/message.dart';
class ChatService extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;// אימות משתמש
  final _firestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverID, String message) async {
    final currentUser = _auth.currentUser!;
    final newMessage = Message(
      senderEmail: currentUser.email!,
      senderID: currentUser.uid,
      receiverID: receiverID,
      message: message,
      timeStamp: Timestamp.now()
    );
    final chatRoomId = [currentUser.uid, receiverID]..sort();
    await _firestore
    .collection('caht_rooms')
    .doc(chatRoomId.join('_'))
    .collection('message')
    .add(newMessage.toMap());
    await _firestore.collection("Users").doc(currentUser.uid).update({'hasUnreadMessage':true});

  }
Stream<List<Users>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot){
        return snapshot.docs.map((doc) => 
        Users.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }
  Future <void> markMessageAsRead(String reciverID,String senderID) async{
    final chatRoomID = [reciverID,senderID]..sort();
    final messageSnapshot = await _firestore
    .collection("chat_rooms")
    .doc(chatRoomID.join("_"))
    .collection("messages")
    .where('isRead',isEqualTo: false).get();

    for(var doc in messageSnapshot.docs) {
      await doc.reference.update({'isRead' : true});
    }
    await _firestore
    .collection("Users")
    .doc(senderID)
    .update({'hasUnreadMessage':false});
  }
  Stream<QuerySnapshot>getMessage(String reciverID,String otherUserID){
    final chatRoomID = [reciverID, otherUserID]..sort();

    return _firestore
    .collection("chat_rooms")
    .doc(chatRoomID.join("_"))
    .collection("messages")
    .orderBy('timeStamp',descending: false)
    .snapshots();
  }
}