import 'package:airtel_test/airtel/modules/airtel_modules.dart' show airtelBTocTransaction;
import 'package:airtel_test/airtel/serializers/airtel_serializers.dart' show AirtellBCSerializer;
import 'package:http/http.dart' as http;
import 'package:airtel_test/airtel_test.dart';

class AirtelBCController extends ResourceController{
  Future<Response> bc(@Bind.body(require: ['customerNo', 'merchantNo', 'amount', 'pin']) AirtellBCSerializer airtellBCSerializer)async{
    final http.Response _res =  await airtelBTocTransaction(
      customerNo: airtellBCSerializer.customerNo,
      merchantNo: airtellBCSerializer.merchantNo,
      amount: airtellBCSerializer.amount,
      pin: airtellBCSerializer.pin,
    );
    return Response(_res.statusCode, _res.headers, _res.body);
  }
}