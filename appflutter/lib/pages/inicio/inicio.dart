import 'package:flutter/material.dart';

// ignore: camel_case_types
class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'EMPRESA SNKRS',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Bienvenido !!!! ',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Nuestro Telefono : XXXXXXXX',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Correo: correo@gmail.com ',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'WhatsApp : 999666999 ',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:appflutter/widgets/RowItemsWidget.dart';
// import 'package:appflutter/widgets/AllItemsWidget.dart';
// import 'package:appflutter/widgets/HomeBottonNavBar.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF5F9FD),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF457269).withOpacity(0.3),
//                         ),
//                       ],
//                     ),
//                     child: Icon(
//                       Icons.sort,
//                       size: 30,
//                       color: Color(0xFF475269),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF5F9FD),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF457269).withOpacity(0.3),
//                         ),
//                       ],
//                     ),
//                     child: Badge(badgeColor: Colors.redAccent),
//                     padding: EdgeInsets.all(7),
//                     badgeContent: Text(
//                       "3",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     child: Icon(
//                       Icons.notifications,
//                       size: 30,
//                       color: Color(0xFF475269),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 15),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               height: 55,
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F9FD),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF475269).withOpacity(0.3),
//                     blurRadius: 5,
//                     spreadRadius: 1,
//                   )
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                   // margin : EdgeInsets.only(left: 5),
//                   width: 300,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Buscar",
//                     ),
//                   ),
//                   ),
//                   Spacer(),
//                   Icon(
//                     Icons.search,
//                     size: 27,
//                     color: Color(0xFF475269),
//                   ), 
//                 ],
//                 ),
//             ),
//             SizedBox(height: 30),
//             RowItemsWidget(),
//             SizedBox(height: 20),
//             AllItemsWidget(),
//           ],
//         ),
//       ),
//       ),
//       bottomNavigationBar: HomeBottonNavBar(),
//     );
//   }
// }