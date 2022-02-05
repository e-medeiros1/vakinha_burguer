import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vakinha/app/core/ui/formatter_helper.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:get/get.dart';
import 'package:vakinha/app/models/order_pix.dart';

class PixPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_orderPix.image).data;
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor à pagar',
                  style: context.textTheme.headline4,
                ),
                Text(
                  FormatterHelper.formatCurrency(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 40),
                  height: context.heightTransformer(reducedBy: 60),
                ),
                TextButton(
                    style: TextButton.styleFrom(primary: Colors.grey),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _orderPix.code));
                      Get.rawSnackbar(
                        message: 'Código pix copiado!',
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chave aleatória',
                          style: context.textTheme.headline4?.copyWith(
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dashed),
                        ),
                        const Icon(
                          Icons.copy_rounded,
                          size: 30,
                          color: Colors.black54,
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
