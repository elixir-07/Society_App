import 'package:flutter/material.dart';

class VisitorCard extends StatelessWidget {
  const VisitorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Mitisha Agarwal"),
                    const Text("Mobile No.: 945xxxxxx2"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("19/05/2022 \n03.00 pm"),
                    Text("Flat No. 26, \nD-Block"),
                  ],
                ),
                Container(
                  height: 30,
                  width: 300,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 63, 192, 65),
                          Color.fromARGB(255, 43, 111, 45)
                        ],
                      )),
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                        child: Text(
                      'Visited',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2nd

        // Container(
        //   // color: secondaryColor,
        //   height: MediaQuery.of(context).size.height * 0.3,
        //   width: double.infinity,
        //   padding: const EdgeInsets.all(8.0),
        //   child: Card(
        //     elevation: 5,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     // color: secondaryColor,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Text("Ritu K. Murmu"),
        //             Text("Mobile No.: 87xxxxx61"),
        //           ],
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Text("21/05/2022 \n08.00 pm"),
        //             Text("Flat No. 10, \nA-Block"),
        //           ],
        //         ),
        //         Container(
        //           height: 30,
        //           width: 300,
        //           margin:
        //               const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               gradient: const LinearGradient(
        //                 colors: [
        //                   Color.fromARGB(255, 30, 41, 67),
        //                   Colors.blueGrey
        //                 ],
        //               )),
        //           child: InkWell(
        //             onTap: () {},
        //             child: const Center(
        //                 child: Text(
        //               'Processing',
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.bold),
        //             )),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
