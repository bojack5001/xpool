import 'package:flutter/material.dart';
import 'package:xpool/splashScreen/splash_screen.dart';

class PayFareAmountDialog extends StatefulWidget {

  double? fareAmount;

  PayFareAmountDialog({this.fareAmount});

  @override
  State<PayFareAmountDialog> createState() => _PayFareAmountDialogState();
}

class _PayFareAmountDialogState extends State<PayFareAmountDialog> {
  @override
  Widget build(BuildContext context) {

    bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: darkTheme ? Colors.black : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [

            SizedBox(height: 20,),

           Text("Fare Amount".toUpperCase(),
             style: TextStyle(
               fontWeight: FontWeight.bold,
               color: darkTheme ? Colors.white : Colors.black,
               fontSize: 16,
             ),
           ),

            SizedBox(height: 20,),

            Divider(
              thickness: 2,
              color: darkTheme ? Colors.amber.shade400 : Colors.white,
            ),

            SizedBox(height: 10,),

            Text(
              "₹"+widget.fareAmount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkTheme ? Colors.white : Colors.black,
                fontSize: 50,
              ),
            ),

            SizedBox(height: 10,),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "This is the total fare amount. Please pay it to the driver",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkTheme ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkTheme ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 10000), (){
                    Navigator.pop(context, "Cash Paid");
                    Navigator.push(context, MaterialPageRoute(builder: (c) => splashscreen()));
                  });
                },
                child: Row(
                  children: [
                    Text(
                      "Pay Cash",
                      style: TextStyle(
                        fontSize: 20,
                        color: darkTheme ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "₹"+widget.fareAmount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                          color: darkTheme ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
