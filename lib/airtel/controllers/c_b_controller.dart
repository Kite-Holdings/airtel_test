import 'package:airtel_test/airtel/modules/airtel_modules.dart' show airtelCTobTransaction;
import 'package:airtel_test/airtel/serializers/airtel_serializers.dart' show AirtellCBSerializer;
import 'package:http/http.dart' as http;
import 'package:airtel_test/airtel_test.dart';

class AirtelCBController extends ResourceController{

  @Operation.post()
  Future<Response> cb(@Bind.body(require: ['customerNo', 'merchantNo', 'amount', 'pin']) AirtellCBSerializer airtellCBSerializer)async{
    final http.Response _res =  await airtelCTobTransaction(
      customerNo: airtellCBSerializer.customerNo,
      merchantNo: airtellCBSerializer.merchantNo,
      amount: airtellCBSerializer.amount,
      pin: airtellCBSerializer.pin,
      );
    return Response(_res.statusCode, _res.headers, _res.body);
  }  
}