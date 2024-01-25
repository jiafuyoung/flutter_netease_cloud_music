import 'package:flutter/material.dart';

import '../../../const/constants.dart';

//登录页表单上方图片
class LoginPageTopImage extends StatelessWidget {
  const LoginPageTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "登录",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
            height: defaultPadding * 2), //SizedBox设置间距，在 row 和 column 中比内外边距好用
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              // child: SvgPicture.asset("assets/icons/login_logo.png"),//使用 svg 加载 png 会报Unhandled Exception: XmlParserException: name expected at 7:185 异常，具体原因需要看源码
              child: Image.asset("assets/icons/login_logo.png"), //最前面不需要加斜
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
