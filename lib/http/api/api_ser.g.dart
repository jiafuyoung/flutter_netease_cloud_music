// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_ser.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiSer implements ApiSer {
  _ApiSer(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://wawayoung.top:3000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PersonInfo> getPersonInfo(
    phone,
    password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone': phone,
      r'password': password,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PersonInfo>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/login/cellphone',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    //其余接口通过 basecontroller 封装，登录接口因为请求的接口是经过服务器转发，要用 statuscode 判断
    //调登录接口时保存用户信息
    if (_result.statusCode == 200) {
      final value = PersonInfo.fromJson(_result.data!);
      return value;
    } else {
      PersonInfo p = PersonInfo();
      p.code = _result.statusCode;
      return p;
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
