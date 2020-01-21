import 'package:airtel_test/airtel_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
Future<http.Response> airtelCTobTransaction({
  String customerNo,
  String merchantNo,
  double amount,
  String pin,
}) async {
  final String payload = 
  '''
  <COMMAND>
  <TYPE>C2B</TYPE>
  <CUSTOMERMSISDN>$customerNo</CUSTOMERMSISDN>
  <MERCHANTMSISDN>$merchantNo</MERCHANTMSISDN>
  <AMOUNT>$amount</AMOUNT>
  <PIN>$pin</PIN>
  <REFERENCE></REFERENCE>
  <USERNAME></USERNAME>
  <PASSWORD></PASSWORD>
  <REFERENCE1></REFERENCE1>
  </COMMAND>
  ''';

  final Map<String, String> headers = {
      'content-type': 'text/xml',
  };

  const String url = "https://41.223.58.182:9193/MerchantPaymentService.asmx";
  const bool trustSelfSigned = true;
  final HttpClient httpClient = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  final IOClient ioClient = IOClient(httpClient);
  

  final http.Response res = await ioClient.post(url, headers: headers, body: payload);

  return res;
}