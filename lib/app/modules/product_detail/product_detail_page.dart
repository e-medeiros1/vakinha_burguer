import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha/app/core/ui/formatter_helper.dart';
import 'package:vakinha/app/core/ui/vakinha_ui.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppBar(),
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width,
                      height: context.heightTransformer(reducedBy: 50),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://hamburguerdesucesso.com.br/wp-content/uploads/2021/05/lanches-mais-vendidos-no-brasil.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('BURG',
                          style: context.textTheme.headline4?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Contém muita coisa, alimenta o sua gatinha',
                        style: context.textTheme.bodyText2!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('BOTÃO'),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Total',
                        style: VakinhaUI.textBold,
                      ),
                      trailing: Text(
                        FormatterHelper.formatCurrency(22.00),
                        style: VakinhaUI.textBold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: context.widthTransformer(reducedBy: 10),
                        child: VakinhaButton(
                          label: 'ADICIONAR',
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
