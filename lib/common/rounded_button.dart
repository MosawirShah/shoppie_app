import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
   RoundedButton({this.btnLabel,this.onPress,});

   String? btnLabel;
   final  Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0, ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          alignment: Alignment.center,
          child: Text(btnLabel!,style: TextStyle(fontSize: 14,color: Colors.white),),
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
