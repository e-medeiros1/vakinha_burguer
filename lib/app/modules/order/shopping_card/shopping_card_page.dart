import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha/app/core/ui/formatter_helper.dart';

import 'package:vakinha/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';

import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  final formKey = GlobalKey<FormState>();

  ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (_, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Form(
                  key: formKey,
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   'Carrinho',
                          //   style: context.textTheme.headline6?.copyWith(
                          //     fontWeight: FontWeight.bold,
                          //     color: context.theme.primaryColorDark,
                          //     fontSize: 28,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: Text(
                              'Nenhum item adicionado ao carrinho!',
                              style: context.textTheme.headline6?.copyWith(
                                color: context.theme.primaryColorDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Image.asset(
                                'assets/images/empty.png',
                              ),
                              // child: Icon(
                              //   Icons.remove_shopping_cart_outlined,
                              //   color: Colors.black26,
                              //   size: 140,
                              // ),
                            ),
                          )
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Carrinho',
                                style: context.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: context.theme.primaryColorDark,
                                  fontSize: 27,
                                ),
                              ),
                              IconButton(
                                onPressed: () => controller.clearAllProducts(),
                                icon: const Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Obx(() {
                          return Column(
                            children: controller.products
                                .map(
                                  (p) => Container(
                                    margin: const EdgeInsets.all(15),
                                    child: PlusMinusBox(
                                        label: p.product.name,
                                        elevated: true,
                                        backgroundColor: Colors.white,
                                        calculateTotal: true,
                                        quantity: p.quantity,
                                        price: p.product.price,
                                        //Se der erro, voltar aqui e setar a função do jeito normal
                                        minusCallback: () => controller
                                            .subtractQuantityInProduct(p),
                                        plusCallback: () =>
                                            controller.addQuantityInProduct(p)),
                                  ),
                                )
                                .toList(),
                          );
                        }),
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total do Pedido',
                                      style:
                                          context.textTheme.bodyText1?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                  Obx(() {
                                    return Text(
                                        FormatterHelper.formatCurrency(
                                            controller.totalValue),
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                        ));
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Divider(),
                        const _AdressField(),
                        const Divider(),
                        const _CpfField(),
                        const Divider(),
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: VakinhaButton(
                              label: 'FINALIZAR',
                              onPressed: () {
                                final formValid =
                                    formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  controller.createOrder();
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    ));
  }
}

class _AdressField extends GetView<ShoppingCardController> {
  const _AdressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'CPF',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
