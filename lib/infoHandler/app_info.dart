import 'package:flutter/cupertino.dart';
import 'package:xpool/models/directions.dart';
import 'package:xpool/models/trips_history_model.dart';

class AppInfo extends ChangeNotifier {
  Directions? userPickUpLocation, userDropOffLocation;
  int countTotalTrips = 0;
  List<String> historyTripsKeysList = [];
  List<TripsHistoryModel> allTripsHistoryInformationList = []; // 🔥 Add this line

  void updatePickUpLocationAddress(Directions userPickUpAddress) {
    userPickUpLocation = userPickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Directions dropOffAddress) {
    userDropOffLocation = dropOffAddress;
    notifyListeners();
  }

  void resetDropOffLocation() {
    userDropOffLocation = null;
    notifyListeners();
  }

  updateOverAllTripsCounter(int overAllTripsCounter){
    countTotalTrips = overAllTripsCounter;
    notifyListeners();
  }

  updateOverAllTripsKeys(List<String> tripsKeysList){
    historyTripsKeysList = tripsKeysList;
    notifyListeners();
  }

  updateOverAllTripsHistoryInformation(TripsHistoryModel eachTripsHistory){
    allTripsHistoryInformationList.add(eachTripsHistory);
    notifyListeners();
  }
}
