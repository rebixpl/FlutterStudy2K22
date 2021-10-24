// Packages
import 'package:flutter/material.dart';

// Global Variables
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final BuildContext navigatorContext =
    navigatorKey.currentState!.overlay!.context;
