import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';

class ShowSnackBar {
  void showSnackBar(
    String message,
    BuildContext context, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 1),
    bool noAction = false,
  }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration,
          elevation: 6,
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          action: noAction
              ? null
              : action ??
                  SnackBarAction(
                    textColor: Theme.of(context).colorScheme.secondary,
                    label: AppLocalizations.of(context)!.ok,
                    onPressed: () {},
                  ),
        ),
      );
    } catch (e) {
      Logger.root.severe('Failed to show Snackbar with title: $message', e);
    }
  }
}
