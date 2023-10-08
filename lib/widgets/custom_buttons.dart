import 'package:flutter/material.dart';


class CustomButton8 extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  const CustomButton8({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.0,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          backgroundColor: backgroundColor,
          disabledBackgroundColor: Colors.grey[300],
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Color(0xffFFFFFF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    Key? key,
    required this.text,
    this.btnColor,
    this.textColor,
    this.width = 90,
    required this.onPress,
  }) : super(key: key);
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final VoidCallback onPress;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 30,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: btnColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomElevatedBtn extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final double height;
//   final double width;
//   final Widget child;
//   final double radius;
//   final BorderSide? side;
//
//   CustomElevatedBtn({
//     Key? key,
//     this.side,
//     this.width = double.infinity,
//     this.height = 48,
//     this.onPressed,
//     this.backgroundColor,
//     this.foregroundColor,
//     required this.child,
//     this.radius = 10,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         side: side,
//         backgroundColor: backgroundColor,
//         foregroundColor: foregroundColor,
//         minimumSize: Size(width, height),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(radius),
//         ),
//       ),
//       child: child,
//     );
//   }
// }

class CustomTextBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double width;
  final Widget child;
  final double radius;

  CustomTextBtn({
    Key? key,
    this.width = double.infinity,
    this.height = 52,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    this.radius = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}

// class DashboardTextBtn extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final double height;
//   final double width;
//   final double radius;
//   final String btnTitle;
//   final IconData btnIcon;

//   DashboardTextBtn({
//     Key? key,
//     this.width = double.infinity,
//     this.height = 55,
//     this.onPressed,
//     this.backgroundColor = Colors.white,
//     this.foregroundColor = ThemeColors.mainColor,
//     this.radius = 14,
//     required this.btnTitle,
//     required this.btnIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextBtn(
//       height: height,
//       onPressed: onPressed,
//       backgroundColor: backgroundColor,
//       foregroundColor: foregroundColor,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               btnTitle,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ),
//             Icon(
//               btnIcon,
//               size: 30,
//               color: ThemeColors.mainColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
