import 'package:flutter/material.dart';
import 'package:lab2/screens/details.dart';
import 'package:lab2/screens/summary.dart';

import 'constants.dart';
import 'models/mockdata.dart';

Route<dynamic>? createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
    case summaryRoute:
      return MaterialPageRoute(
        builder: (context) => SummaryScreen(mockData[0].member, mockData),
      );

    case detailsRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(settings.arguments),
      );
  }
  return null;
}
