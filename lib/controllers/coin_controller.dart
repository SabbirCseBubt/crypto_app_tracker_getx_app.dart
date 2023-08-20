
import 'package:crypto_app_tracker_getx/models/Coin.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class CoinController extends GetxController {
  RxBool isLoading=true.obs;
  RxList<Welcome> coinsList=<Welcome>[].obs;
  @override
  void  onInit()
  {
    super.onInit();
    getCoins();
  }
  getCoins() async{
   try{
     var response= await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"));
     List<Welcome> coins=welcomeFromJson(response.body);
     coinsList.value=coins;
   }
       finally{
     isLoading(false);

       }

  }
 

}