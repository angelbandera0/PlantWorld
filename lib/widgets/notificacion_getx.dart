import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationGetx {
  notificar(String message, IconData icon,String tipo) {
    Get.snackbar(tipo.capitalize, message,
        icon: Icon(
          icon,
          size: 32,
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
        borderRadius: 20,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }
}
