
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timeStamp;
  final bool isRead;
  Message(
      {required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.message,
      required this.timeStamp,
      this.isRead = false});
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timeStamp': timeStamp,
      'isRead': isRead,
    };
  }



static Message fromMap(Map<String, dynamic> map) {
    return Message(
      senderID: map['senderID'],
      senderEmail: map['senderEmail'],
      receiverID: map['receiverID'],
      message: map['message'],
      timeStamp: map['timeStamp'],
      isRead: map['isRead'] ?? false,
    );
  }
}
class Users {
  String uid;
  String email;
  bool hasUnread;
  Users({
    required this.uid,
    required this.email,
    this.hasUnread = false,
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'hasUnread': hasUnread,
    };
  }
  static Users fromMap(Map<String, dynamic> map) {
    return Users(
      uid: map['uid'],
      email: map['email'],
      hasUnread: map['hasUnread'] ?? false,
    );
  }
}