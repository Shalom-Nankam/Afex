import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: Color(0xff1e1e1e), width: 0.5)),
          onPressed: () {},
          height: 58,
          minWidth: 97,
          color: const Color(0xffffffff),
          textColor: const Color(0xff54565b),
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const Spacer(),
        MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPressed: () {},
          height: 58,
          minWidth: 97,
          color: const Color(0xff1d925d),
          textColor: const Color(0xffdffffff),
          child: const Text(
            'Next',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
