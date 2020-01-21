import 'package:airtel_test/airtel/modules/airtel_modules.dart' show airtelEnrol;
import 'package:http/http.dart' as http;
import 'package:airtel_test/airtel_test.dart';

class AirtelEnrollController extends ResourceController{

  @Operation.post()
  Future<Response> enroll()async{
    final http.Response _res =  await airtelEnrol();
    return Response(_res.statusCode, _res.headers, _res.body);
  }
}