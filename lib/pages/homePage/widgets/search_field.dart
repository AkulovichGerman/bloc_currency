// import 'package:flutter/material.dart';
//
// class SearchField extends StatelessWidget {
//   const SearchField({super.key});
//
//   void filterSearchResults(String query) {
//       var items = duplicateItems
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         onChanged: (value) {
//           filterSearchResults(value);
//         },
//         controller: editingController,
//         decoration: const InputDecoration(
//             labelText: "Search",
//             hintText: "Search",
//             prefixIcon: Icon(Icons.search),
//             border: OutlineInputBorder(
//                 borderRadius:
//                 BorderRadius.all(Radius.circular(25.0)))),
//       ),
//     );
//   }
// }
