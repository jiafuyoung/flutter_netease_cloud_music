import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/widget/widget_net_error.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// FutureBuilder 简单封装，除正确返回和错误外，其他返回 小菊花
/// 错误时返回定义好的错误 Widget，例如点击重新请求
class CustomFutureBuilder<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Function futureFunc;
  final Map<String, dynamic> params;
  final Widget loadingWidget;

  const CustomFutureBuilder({
    super.key,
    required this.futureFunc,
    required this.builder,
    required this.params,
    required this.loadingWidget,
  });

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  ///延迟初始化的变量无法判断是否初始化，又因为是泛型，所以另用flag字段判断
  late Future<T>? _future;
  String oldParams = '';
  bool _futureFlag = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      logI("回调更改状态" + _futureFlag.toString());
      _request();
      logI("回调更改状态完成" + _futureFlag.toString());
    });
  }

  void _request() {
    setState(() {
      _future = widget.futureFunc(widget.params);
      // oldParams = widget.params.values.join();
      _futureFlag = true;
    });
  }

  @override
  void didUpdateWidget(CustomFutureBuilder<T> oldWidget) {
    // 如果方法不一样了，那么则重新请求
    if (oldWidget.futureFunc != widget.futureFunc) {
      WidgetsBinding.instance.addPostFrameCallback((call) {
        _request();
      });
    }

    // 如果方法还一样，但是参数不一样了，则重新请求
    if ((oldWidget.futureFunc == widget.futureFunc)) {
      if (oldParams != widget.params.values.join()) {
        oldParams = widget.params.values.join();
        WidgetsBinding.instance.addPostFrameCallback((call) {
          _request();
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    ///_future未初始化前，先加载默认没有数量的评论图标
    return !_futureFlag
        ? widget.loadingWidget
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return widget.loadingWidget;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data as T);
                  } else if (snapshot.hasError) {
                    logE(snapshot.toString());
                    return NetErrorWidget(
                      callback: () {
                        _request();
                      },
                    );
                  }
              }
              return Container();
            },
          );
  }
}
