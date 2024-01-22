import 'package:flutter/material.dart';

import '../../utils/mixin/toast/toast_mixin.dart';

///实现一些基础功能SatefulWidget组件（例如Toast等，可继续拓展）
abstract class CommonStatefulWidget extends StatefulWidget with ToastMixin {
  const CommonStatefulWidget({super.key});
}
