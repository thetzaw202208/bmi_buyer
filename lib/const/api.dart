///Base URL
const String baseURL = "https://bmiagri.com/api/v1/";

///Endpoint
const String registerEndpoint = "buyers/register";
const String loginEndpoint = "buyers/login";
const String getProductEndpoint = "products/buyers/allProducts";
const String orderEndpoint = "products/buyers/productOrder";
const String getOrderHistoryEndpoint = "products/buyers/order/history";

///Authorization token
const String authorizationToken =
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JtaWFncmkuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcwOTg3MjI2NSwibmJmIjoxNzA5ODcyMjY1LCJqdGkiOiJ2UjFQTVpwTktrelRZU2pvIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.70rDlI1IHMF33ot4_Knl98oSW8VYczGsILY5rKN2IOU";
const String contentType = 'application/json';