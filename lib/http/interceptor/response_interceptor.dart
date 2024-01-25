import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/http/result/base_result.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';

class ResponseInterceptors<T> extends Interceptor {
  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    String body = response.data.toString();
    BaseResult baseResult = BaseResult();
    baseResult.statusCode = response.statusCode;
    baseResult.statusMessage = response.statusMessage;
    baseResult.data = response.data;
    baseResult.extra = response.extra;
    response.data = baseResult.toJson();
    try {
      if (response.statusCode == 200) {
        if (body.length > 600) {
          for (int i = 0; i < body.toString().length; i += 600) {
            if (i + 600 < body.toString().length) {
              logD(
                  "HTTP_RESPONSE_BODY::${body.toString().substring(i, i + 600)}");
            } else {
              logD(
                  "HTTP_RESPONSE_BODY::${body.toString().substring(i, body.toString().length)}");
            }
          }
        } else {
          logD('HTTP_RESPONSE_BODY::$body');
        }
      }
    } catch (e) {
      logD('ERROR::$body');
    }
    super.onResponse(response, handler);
  }
}
