import 'package:flutter/material.dart';

void main() {
  runApp(ErrorDemoApp());
}

class ErrorDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Error Demo',
      home: ErrorDemoHomePage(),
    );
  }
}

class ErrorDemoHomePage extends StatelessWidget {
  // Generates an invalid API error
  void generateInvalidApiError() async {
    throw Exception("Invalid API Endpoint: Failed to fetch data from /invalid-api");
  }

  // Generates a Null Reference Error
  void generateNullReferenceError() {
    Future.delayed(Duration.zero, () {
      dynamic obj = null;
      obj['key']; // Accessing a property on null
    });
  }

  // Generates a Type Mismatch Error
  void generateTypeMismatchError() {
    Future.delayed(Duration.zero, () {
      dynamic number = 42;
      String str = number as String; // Invalid type cast
    });
  }

  // Generates a Range Error
  void generateRangeError() {
    Future.delayed(Duration.zero, () {
      List<int> nums = [1, 2, 3];
      print(nums[10]); // Accessing an out-of-range index
    });
  }

  // Additional buttons to demonstrate PhysicalShape and custom ElevatedButton
  void onPhysicalShapeButtonPressed() {
    debugPrint("PhysicalShape button pressed");
  }

  void onCustomElevatedButtonPressed() {
    debugPrint("Custom ElevatedButton pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                generateInvalidApiError();
              },
              child: Text('Generate Invalid API Error'),
            ),
            ElevatedButton(
              onPressed: () {
                generateNullReferenceError();
              },
              child: Text('Generate Null Reference Error'),
            ),
            ElevatedButton(
              onPressed: () {
                generateTypeMismatchError();
              },
              child: Text('Generate Type Mismatch Error'),
            ),
            ElevatedButton(
              onPressed: () {
                generateRangeError();
              },
              child: Text('Generate Range Error'),
            ),
            // PhysicalShape button example
            PhysicalShape(
              clipper: ShapeBorderClipper(shape: CircleBorder()),
              elevation: 4.0,
              color: Colors.blue,
              child: InkWell(
                onTap: onPhysicalShapeButtonPressed,
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    'PhysicalShape',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing
            // Custom ElevatedButton example
            ElevatedButton(
              onPressed: onCustomElevatedButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Custom ElevatedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
