import 'package:flutter/material.dart';
import 'package:landing_page/app/core/common/extensions/all_extension.dart';
import 'package:toastification/toastification.dart';

class Toasting {
  static void error(
    BuildContext context, {
    String title = 'Ocorreu um erro!',
    String? description,
    Duration? duration = const Duration(seconds: 4),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    Toastification().show(
      context: context,
      type: ToastificationType.error,
      style: style,
      title: Text(title),
      description: description.isNull ? null : Text(description!),
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static void success(
    BuildContext context, {
    String title = 'Sucesso!',
    String? description,
    Duration? duration = const Duration(seconds: 4),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    Toastification().show(
      context: context,
      type: ToastificationType.success,
      style: style,
      title: Text(title),
      description: description.isNull ? null : Text(description!),
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static void noConnection(
    BuildContext context, {
    String? message,
    Duration? duration,
  }) {
    error(
      context,
      title: 'Sem conexão com a internet!',
      description: message,
      duration: duration,
    );
  }

  static void warning(
    BuildContext context, {
    String title = 'Aconteceu algo inesperado!',
    String? description,
    Duration? duration = const Duration(seconds: 4),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    Toastification().show(
      context: context,
      type: ToastificationType.warning,
      style: style,
      title: Text(title),
      description: description.isNull ? null : Text(description!),
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
