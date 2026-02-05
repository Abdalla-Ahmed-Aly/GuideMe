import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double cardWidth = size.width * 0.85 > 360 ? 360 : size.width * 0.85;
    final double cardHeight = cardWidth * 0.63;

    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CreditCardWidget(
                    width: cardWidth,
                    height: cardHeight,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: showBackView,
                    onCreditCardWidgetChange: (CreditCardBrand p1) {},
                    cardBgColor: Colors.black,
                    isHolderNameVisible: true,
                    enableFloatingCard: true,
                    obscureCardCvv: false,
                    frontCardBorder: Border.all(color: Colors.grey),
                    backCardBorder: Border.all(color: Colors.grey),
                  ),

                  CreditCardForm(
                    formKey: formKey,
                    autovalidateMode: autovalidateMode,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    cardHolderValidator: (value) {
                      return value == null || value.isEmpty
                          ? 'Card holder name is required'
                          : null;
                    },
                    onCreditCardModelChange: onCreditCardModelChange,
                    inputConfiguration: InputConfiguration(
                      cardNumberDecoration: InputDecoration(
                        labelText: context.l10n.cardNumber,
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: InputDecoration(
                        labelText: context.l10n.expiryDate,
                        hintText: 'MM/YY',
                      ),
                      cardHolderDecoration: InputDecoration(
                        labelText: context.l10n.cardHolder,
                        hintText: context.l10n.cardHolder,
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 34,
                ),
                child: AppButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      buildSuccessBottomSheet(context, size);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  text: context.l10n.save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }

  Future<dynamic> buildSuccessBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          left: false,
          right: false,
          top: false,
          child: SizedBox(
            height: size.height * 0.47,
            child: Column(
              children: [
                const SizedBox(height: 16),

                Container(
                  height: 6,
                  width: 146,
                  decoration: BoxDecoration(
                    color: const Color(0xff999999),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        Image.asset(
                          AppImages.success,
                          height: context.isPortrait
                              ? size.height * 0.2
                              : size.width * 0.2,
                        ),

                        const SizedBox(height: 16),

                        Text(
                          context.l10n.successMsg,
                          style: AppTextStyles.interMedium30.copyWith(
                            color: const Color(0xff181F71),
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          context.l10n.yourAccountSaved,
                          style: AppTextStyles.interMedium10.copyWith(
                            color: const Color(
                              0xff505050,
                            ).withValues(alpha: .5),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 50.p,
                            right: 50.p,
                          ),
                          child: AppButton(
                            onPressed: () {
                              context.pop();
                            },
                            text: context.l10n.confirmMsg,
                            textStyle: AppTextStyles.interSemiBold18,
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
