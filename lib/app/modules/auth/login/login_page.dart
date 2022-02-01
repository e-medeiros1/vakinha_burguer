import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha/app/core/ui/vakinha_ui.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_textFormField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (_, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'Senha'),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: VakinhaButton(
                      label: 'ENTRAR',
                      onPressed: () {},
                      widht: context.width,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não possui uma conta?'),
                      TextButton(
                        onPressed: () {
                          Get.offNamed('/auth/register');
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: VakinhaUI.textBold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      }),
    );
  }
}
