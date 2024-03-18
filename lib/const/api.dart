import 'package:flutter_dotenv/flutter_dotenv.dart';

///Base URL
 String baseURL = dotenv.get("baseURL", fallback: null);

///Endpoint
const String registerEndpoint = "buyers/register";
const String loginEndpoint = "buyers/login";
const String getProductEndpoint = "products/buyers/allProducts";
const String orderEndpoint = "products/buyers/productOrder";
const String getOrderHistoryEndpoint = "products/buyers/order/history";

///Authorization token
 String authorizationToken =dotenv.get("API_TOKEN", fallback: null);

const String contentType = 'application/json';