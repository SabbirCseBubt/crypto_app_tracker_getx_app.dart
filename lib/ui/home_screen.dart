
import 'package:crypto_app_tracker_getx/controllers/coin_controller.dart';
import 'package:crypto_app_tracker_getx/models/Coin.dart';
import 'package:crypto_app_tracker_getx/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CoinController coinController=Get.put(CoinController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 60,right: 20.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crypto Market",
              style: textStyle(25, Colors.white, FontWeight.bold),
              ),
             Obx(() =>coinController.isLoading.value ?const Center(child:  CircularProgressIndicator())  :ListView.builder(
               itemCount: coinController.coinsList.length,
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context,index)
               {
                 return Padding(
                   padding: const EdgeInsets.only(bottom: 20.0),
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     height: 60,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Container(
                               height: 60,
                               width: 60,
                               decoration: BoxDecoration(
                                   color: Colors.grey[700],
                                   borderRadius:BorderRadius.circular(15),
                                   boxShadow: [BoxShadow(
                                     color: Colors.grey[700]!,
                                     offset: const Offset(4, 4),
                                     blurRadius: 5,
                                   )]
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(10),
                                 child: Image.network(coinController.coinsList[index].image),
                               ),
                             ),
                             const  SizedBox(width: 20,),

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 const SizedBox(height: 8,),
                                 Text(coinController.coinsList[index].name,style: textStyle(18, Colors.white, FontWeight.w600),),
                                 Text(" ${coinController.coinsList[index].priceChangePercentage24H.toStringAsFixed(2) }%",style: textStyle(18, Colors.grey, FontWeight.w600),)

                               ],
                             ),
                           ],
                         ),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             const SizedBox(height: 8,),
                             Text("\$ ${coinController.coinsList[index].currentPrice.round() }",style: textStyle(18, Colors.white, FontWeight.w600),),
                             Text(coinController.coinsList[index].symbol.toUpperCase(),style: textStyle(18, Colors.grey, FontWeight.w600),)

                           ],
                         ),


                       ],
                     ),
                   ),
                 );
               },
             ))
            ],
          ),

        ),
      ),

    );
  }
}
