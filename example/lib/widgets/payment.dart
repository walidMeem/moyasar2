import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';

class PaymentMethods extends StatelessWidget {
  final PaymentConfig paymentConfig;
  final Function onPaymentResult;

  const PaymentMethods(
      {super.key, required this.paymentConfig, required this.onPaymentResult});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ApplePay(
            config: paymentConfig,
            onPaymentResult: onPaymentResult,
          ),
        ),
        const Text("or"),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CreditCard(
                      config: paymentConfig,
                      onPaymentResult: onPaymentResult,
                    ),
                  ),
                );
              },
            );
          },
          child: const Text("Mada Button"),
          
        ),
      ],
    );
  }
}
