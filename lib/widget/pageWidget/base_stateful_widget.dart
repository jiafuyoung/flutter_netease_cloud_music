import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/person_info_login_status.dart';

import '../../controller/base_controller.dart';
import '../../utils/mixin/toast/toast_mixin.dart';
import '../../component/load_state_widget.dart';
import '../../component/loading_widget.dart';

///具有状态管理的基础页面，满足一些特定需要State的Widget(暂时还未发现需要使用State的场景)
abstract class BaseStatefulWidget<T extends BaseController>
    extends StatefulWidget with ToastMixin {
  const BaseStatefulWidget({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller {
    return GetInstance().find<T>(tag: tag);
  }

  ///Get 局部更新字段
  get updateId => null;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: buildBody(context),
      drawer: _createDrawer(),
    );
  }

  ///AppBar生成逻辑
  AppBar? _createAppBar(BuildContext context) {
    if (showTitleBar()) {
      return createAppBar(titleString(), showBackButton(),
          appBarActionWidget(context), showSearch(),
          titleWidget: titleWidget());
    } else {
      //不显示TitleBar的页面构建的画面
      return null;
    }
  }

  Widget? _createDrawer() {
    if (showDrawer()) {
      return indexDrawer();
    } else {
      //不显示TitleBar的页面构建的画面
      return null;
    }
  }

  Widget createText(String lead) {
    return Text(lead);
  }

  ///创建AppBar ActionView
  List<Widget>? appBarActionWidget(BuildContext context) {
    return null;
  }

  ///构建Scaffold-body主体内容
  Widget buildBody(BuildContext context) {
    if (useLoadSir()) {
      return controller.obx((state) => buildContent(context),
          onLoading: Center(
            child: LoadingWidget(),
          ),
          onError: (error) => createErroWidget(controller, error),
          onEmpty: createEmptyWidget(controller));
    } else {
      //没有开启加载状态，直接构建
      return buildContent(context);
    }
  }

  PersonInfoLoginStatus personInfo() => PersonInfoLoginStatus();

  ///是否展示titleBar标题栏
  bool showTitleBar() => false;

  ///是否标题位置展示为搜索框
  bool showSearch() => false;

  ///是否展示titleBar标题栏
  bool showDrawer() => false;

  ///页面标题设置
  String titleString() => "首页";

  //标题栏title的通用Widget样式
  Widget? titleWidget() => null;

  Widget indexDrawer() => createIndexDrawer("默认", "默认");

  ///是否开启加载状态
  bool useLoadSir() => true;

  ///是否展示回退按钮
  bool showBackButton() => true;

  //showSuccess展示成功的布局
  Widget buildContent(BuildContext context);

  ///widget生命周期
  get lifecycle => null;

  @override
  State createState() => AutoDisposeState<T>();
}

class AutoDisposeState<T extends GetxController>
    extends State<BaseStatefulWidget>
    with
        AutomaticKeepAliveClientMixin<BaseStatefulWidget>,
        WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<T>(
        tag: widget.tag,
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<T>(tag: widget.tag);
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
