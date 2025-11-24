import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ShopifyProductsListCall {
  static Future<ApiCallResponse> call({
    String? searchText = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "query (\$searchText: String) { products(first: 200, query: \$searchText) { edges { node { id title handle description featuredImage { url altText } priceRange { minVariantPrice { amount currencyCode } } } } } }",
  "variables": {
    "searchText": "${escapeStringForJson(searchText)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ShopifyProductsList',
      apiUrl: 'https://fja21g-xi.myshopify.com/api/2024-10/graphql.json',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Shopify-Storefront-Access-Token': 'afeff794b263ddaf1489bc6772e2e001',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.data.products.edges''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? handle(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.handle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.featuredImage.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.priceRange.minVariantPrice.amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.priceRange.minVariantPrice.currencyCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data.products.edges[*].node.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
