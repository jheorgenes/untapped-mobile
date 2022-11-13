import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedOrderBottomSheet extends StatelessWidget {
  final String message;
  final String iconAsset;
  final String subtitle;
  final String? titleButtom;
  final Function()? buttomCallback;

  const CompletedOrderBottomSheet({
    super.key,
    required this.message,
    required this.iconAsset,
    required this.subtitle,
    this.buttomCallback,
    this.titleButtom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: double.infinity,
      height: context.heightTransformer(reducedBy: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Color(0XFF242526),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -30,
            child: Image.asset(
              iconAsset,
            ),
          ),
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    // fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                if (buttomCallback != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onPressed: buttomCallback,
                    child: SizedBox(
                      height: 35,
                      width: context.widthTransformer(reducedBy: 20),
                      child: Center(
                        child: Text(
                          titleButtom ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
