// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../assets/colors.dart';
// import '../../../assets/icons.dart';
// import '../../models/formz/formz_status.dart';
// import '../../models/formz/formz_type.dart';
// import '../../models/formz/rules.dart';
// import '../w_scale.dart';
// import 'bloc/validation_bloc.dart';

// class WTextField extends StatefulWidget {
//   final bool? hasBorderColor;
//   final bool? hasClearButton;
//   final String title;
//   final double borderRadius;
//   final TextStyle? titleTextStyle;
//   final TextStyle? textStyle;
//   final String? hintText;
//   final TextStyle? prefixStyle;
//   final TextStyle? hintTextStyle;
//   final String prefixText;
//   final bool? hideCounterText;
//   final Widget? prefix;
//   final EdgeInsets? prefixPadding;
//   final double? width;
//   final double? height;
//   final int? maxLength;
//   final TextInputType? keyBoardType;
//   final bool isObscureText;
//   final Widget? suffix;
//   final String? suffixIcon;
//   final EdgeInsets? suffixPadding;
//   final TextCapitalization textCapitalization;
//   final ValueChanged<String> onChanged;
//   final TextEditingController controller;
//   final List<TextInputFormatter>? textInputFormatters;
//   final EdgeInsets? contentPadding;
//   final bool hasError;
//   final double sizeBetweenFieldTitle;
//   final Color? errorColor;
//   final Color? fillColor;
//   final EdgeInsets? margin;
//   final VoidCallback? onEyeTap;
//   final FocusNode? focusNode;
//   final TextAlign textAlign;
//   final TextInputAction textInputAction;
//   final Function? onTapSuffix;
//   final Function()? onEditCompleted;
//   final Function()? onTap;
//   final int? maxlines;
//   final int? minLines;
//   final bool autoFocus;
//   final Color? disabledColor;
//   final Function()? onClearTap;
//   final String? titleWidget;
//   final FormzType validationType;
//   final Rules? rules;
//   final bool? isDense;
//   const WTextField({
//     required this.controller,
//     required this.onChanged,
//     this.hasBorderColor,
//     this.disabledColor,
//     this.hideCounterText,
//     this.autoFocus = false,
//     this.borderRadius = 4,
//     this.maxlines = 1,
//     this.prefixStyle,
//     this.hasClearButton,
//     this.textAlign = TextAlign.start,
//     this.width,
//     this.fillColor,
//     this.title = '',
//     this.titleTextStyle,
//     this.textStyle,
//     this.hintText,
//     this.hintTextStyle,
//     this.contentPadding =
//         const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//     this.prefixText = '',
//     this.prefix,
//     this.prefixPadding = const EdgeInsets.all(2),
//     this.suffix,
//     this.suffixIcon,
//     this.suffixPadding = const EdgeInsets.all(12),
//     this.isObscureText = false,
//     this.onEyeTap,
//     this.margin,
//     this.sizeBetweenFieldTitle = 8,
//     this.errorColor,
//     this.hasError = false,
//     this.textInputFormatters,
//     this.textCapitalization = TextCapitalization.none,
//     this.keyBoardType,
//     this.maxLength,
//     this.focusNode,
//     this.textInputAction = TextInputAction.done,
//     this.height,
//     this.onTapSuffix,
//     Key? key,
//     this.onEditCompleted,
//     this.minLines,
//     this.onTap,
//     this.onClearTap,
//     this.titleWidget,
//     this.validationType = FormzType.none,
//     this.rules,
//     this.isDense,
//   }) : super(key: key);

//   @override
//   _WTextFieldState createState() => _WTextFieldState();
// }

// class _WTextFieldState extends State<WTextField>
//     with SingleTickerProviderStateMixin {
//   late FocusNode focusNode;
//   bool focused = false;
//   bool hasText = false;
//   bool isObscure = false;
//   late AnimationController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );

//     focusNode = FocusNode();

//     focusNode.addListener(
//       () => setState(() => focused = !focused),
//     );
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ValidationBloc(),
//       child: Builder(
//         builder: (context) {
//           return Container(
//             margin: widget.margin,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (widget.titleWidget != null)
//                   RichText(
//                     text: TextSpan(
//                       text: widget.titleWidget,
//                       children: [
//                         TextSpan(
//                           text: ' *',
//                           style:
//                               Theme.of(context).textTheme.headline1!.copyWith(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: Theme.of(context).colorScheme.error,
//                                   ),
//                         )
//                       ],
//                       style: Theme.of(context).textTheme.headline2!.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                           ),
//                     ),
//                   )
//                 else if (widget.title.isNotEmpty)
//                   Text(
//                     widget.title,
//                     style: widget.titleTextStyle ??
//                         Theme.of(context).textTheme.headline1!.copyWith(
//                               fontSize: 14,
//                             ),
//                   )
//                 else
//                   const SizedBox(),
//                 SizedBox(
//                   height: widget.title.isNotEmpty || widget.titleWidget != null
//                       ? widget.sizeBetweenFieldTitle
//                       : null,
//                 ),
//                 Container(
//                   height: widget.height,
//                   width: widget.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.transparent,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(widget.borderRadius),
//                         child: BlocBuilder<ValidationBloc, ValidationState>(
//                           builder: (context, state) {
//                             return TextField(
//                               onTap: widget.onTap,
//                               textAlign: widget.textAlign,
//                               inputFormatters: widget.textInputFormatters,
//                               textInputAction: widget.textInputAction,
//                               textCapitalization: widget.textCapitalization,
//                               obscureText: isObscure,
//                               keyboardType: widget.keyBoardType,
//                               maxLength: widget.maxLength,
//                               controller: widget.controller,
//                               minLines: widget.minLines ?? 1,
//                               maxLines: widget.maxlines,
//                               autofocus: widget.autoFocus,
//                               cursorColor: Theme.of(context)
//                                   .colorScheme
//                                   .secondaryVariant,
//                               cursorHeight: 20,
//                               onEditingComplete: widget.onEditCompleted,
//                               onChanged: (s) {
//                                 setState(() => hasText = s.isNotEmpty);

//                                 widget.onChanged(s);
//                                 context
//                                     .read<ValidationBloc>()
//                                     .add(ValidationEvent.validate(
//                                       widget.controller.text,
//                                       onSuccess: () {},
//                                       onFailure: (message) {},
//                                       type: widget.validationType,
//                                       rules: widget.rules,
//                                     ));
//                               },
//                               focusNode: focusNode,
//                               style: widget.textStyle ??
//                                   Theme.of(context)
//                                       .textTheme
//                                       .headline1!
//                                       .copyWith(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                               decoration: InputDecoration(
//                                 isDense: widget.isDense,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     widget.borderRadius,
//                                   ),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: widget.hasError ||
//                                             state.status ==
//                                                 FormzStatus.submissionFailure
//                                         ? Theme.of(context).colorScheme.error
//                                         : white.withOpacity(0.2),
//                                   ),
//                                 ),
//                                 counterText: widget.hideCounterText != null &&
//                                         widget.hideCounterText!
//                                     ? ''
//                                     : null,
//                                 hintText: widget.hintText,
//                                 hintStyle: widget.hintTextStyle ??
//                                     Theme.of(context)
//                                         .textTheme
//                                         .headline1!
//                                         .copyWith(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w300),
//                                 filled: true,
//                                 prefixIcon: widget.prefix,
//                                 fillColor: widget.disabledColor != null
//                                     ? widget.controller.text.isNotEmpty
//                                         ? widget.fillColor
//                                         : widget.disabledColor
//                                     : widget.fillColor,
//                                 contentPadding: widget.contentPadding,
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       widget.borderRadius),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: widget.hasBorderColor != null &&
//                                             !widget.hasBorderColor!
//                                         ? Colors.transparent
//                                         : widget.hasError ||
//                                                 state.status ==
//                                                     FormzStatus
//                                                         .submissionFailure
//                                             ? Theme.of(context)
//                                                 .colorScheme
//                                                 .error
//                                             : white.withOpacity(0.2),
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       widget.borderRadius),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: widget.hasBorderColor != null &&
//                                             !widget.hasBorderColor!
//                                         ? Colors.transparent
//                                         : widget.hasError ||
//                                                 state.status ==
//                                                     FormzStatus
//                                                         .submissionFailure ||
//                                                 state.status ==
//                                                     FormzStatus
//                                                         .submissionFailure
//                                             ? Theme.of(context)
//                                                 .colorScheme
//                                                 .error
//                                             : white.withOpacity(0.2),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       widget.borderRadius),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: widget.hasBorderColor != null &&
//                                             !widget.hasBorderColor!
//                                         ? Colors.transparent
//                                         : widget.hasError ||
//                                                 state.status ==
//                                                     FormzStatus
//                                                         .submissionFailure
//                                             ? Theme.of(context)
//                                                 .colorScheme
//                                                 .error
//                                             : Theme.of(context)
//                                                 .colorScheme
//                                                 .primary,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       if (widget.prefixText.isNotEmpty)
//                         Positioned(
//                           top: 11,
//                           left: 12,
//                           child: Padding(
//                             padding: widget.prefixPadding ?? EdgeInsets.zero,
//                             child: Text(
//                               widget.prefixText,
//                               style: widget.prefixStyle ??
//                                   Theme.of(context)
//                                       .textTheme
//                                       .headline1!
//                                       .copyWith(fontSize: 16),
//                             ),
//                           ),
//                         )
//                       else
//                         const SizedBox(),
//                       Positioned(
//                         right: 12,
//                         child: widget.hasClearButton != null &&
//                                 widget.hasClearButton!
//                             ? widget.controller.text.isNotEmpty
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       setState(() {});
//                                       widget.controller.clear();
//                                       if (widget.onClearTap != null) {
//                                         widget.onClearTap!();
//                                       }
//                                     },
//                                     child: SvgPicture.asset(AppIcons.close),
//                                   )
//                                 : const SizedBox()
//                             : WScaleAnimation(
//                                 onTap: () {
//                                   if (widget.onTapSuffix != null) {
//                                     widget.onTapSuffix!();
//                                   }
//                                 },
//                                 child: widget.suffix ?? const SizedBox(),
//                               ),
//                       ),
//                       Positioned(
//                         top: 6,
//                         right: 8,
//                         bottom: 6,
//                         child: !widget.isObscureText
//                             ? widget.suffixIcon != null
//                                 ? WScaleAnimation(
//                                     onTap: () {
//                                       if (widget.onTapSuffix != null) {
//                                         widget.onTapSuffix!();
//                                       }
//                                     },
//                                     child: Padding(
//                                       padding:
//                                           const EdgeInsets.fromLTRB(0, 6, 2, 6),
//                                       child: SvgPicture.asset(
//                                         widget.suffixIcon!,
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox()
//                             : WScaleAnimation(
//                                 onTap: () {
//                                   setState(() {
//                                     if (isObscure) {
//                                       controller.reverse();
//                                     } else {
//                                       controller.forward();
//                                     }
//                                     isObscure = !isObscure;
//                                   });
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Center(
//                                     child: AnimatedBuilder(
//                                       animation: controller,
//                                       child: SvgPicture.asset(AppIcons.eye),
//                                       builder: (context, child) => CustomPaint(
//                                         foregroundPainter:
//                                             StrokePaint(controller.value),
//                                         child: child,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 BlocBuilder<ValidationBloc, ValidationState>(
//                   builder: (context, state) {
//                     if (state.status == FormzStatus.submissionFailure) {
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SvgPicture.asset(AppIcons.validationError),
//                             const SizedBox(width: 6),
//                             Expanded(
//                               child: Text(
//                                 state.validationMessage,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6!
//                                     .copyWith(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
