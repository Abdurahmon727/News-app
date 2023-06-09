// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:internal_business_cards/assets/colors.dart';

// class PopUp extends StatelessWidget {
//   final String _message;
//   final String _icon;
//   final Color _color;
//   final GlobalKey _globalKey;
//   final bool _showPopUp;
//   const PopUp({
//     required GlobalKey globalKey,
//     required String icon,
//     required Color color,
//     required String messageText,
//     required bool showPopUp,
//     Key? key,
//   })  : _message = messageText,
//         _icon = icon,
//         _color = color,
//         _globalKey = globalKey,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.warning({
//     required GlobalKey globalKey,
//     String warningMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = warningMessage,
//         _globalKey = globalKey,
//         _color = primary,
//         _icon = AppIcons.settings,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.error({
//     required GlobalKey globalKey,
//     String errorMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = errorMessage,
//         _globalKey = globalKey,
//         _color = red,
//         _icon = AppIcons.settings,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.success({
//     required GlobalKey globalKey,
//     String successMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = successMessage,
//         _globalKey = globalKey,
//         _showPopUp = showPopUp,
//         _color = Colors.green,
//         _icon = AppIcons.settings,
//         super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedPositioned(
//       left: 16,
//       right: 16,
//       bottom: _showPopUp
//           ? 16
//           : _globalKey.currentContext != null
//               ? -(_globalKey.currentContext!.findRenderObject() as RenderBox)
//                   .size
//                   .height
//               : -62,
//       duration: const Duration(milliseconds: 200),
//       child: Container(
//         key: _globalKey,
//         decoration: BoxDecoration(
//           color: _color,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 1),
//               blurRadius: 4,
//               color: black.withOpacity(0.12),
//             )
//           ],
//         ),
//         padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
//         child: Material(
//           color: Colors.transparent,
//           child: Row(
//             children: [
//               SvgPicture.asset(_icon),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   _message,
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1!
//                       .copyWith(fontSize: 12, color: white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
