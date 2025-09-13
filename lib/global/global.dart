
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpool/models/direction_details_info.dart';

import '../models/user_model.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentUser;

UserModel? userModelCurrentInfo;

String cloudMessagingServerToken ="key=1f1cd6c624b19462b1654c93ff3a8b37e3117ffa";
List driversList =[];
DirectionDetailsInfo? tripDirectionDetailsInfo;
String userDropOffAddress = "";
String driverCarDetails = "";
String driverName = "";
String driverPhone = "";

double countRatingStars =0.0;
String titleStarRating = "";

