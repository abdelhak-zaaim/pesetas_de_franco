

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pesetas_de_franco/utils/constants.dart';

import '../moodle/coin_module.dart';
import '../utils/dimensions.dart';
import '../utils/root_helper.dart';
import 'base/custom_ink_well.dart';
import 'base/custom_small_button.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //const MainScreen({super.key});

  String selectedOption = "All"; // Initial selected option
  List<CoinModel> coins = [];
  List<String> options = ["All"]; // Dropdown options
  @override
  void initState()  {
  super.initState();

  _loadCoinsData();
  }

  List<String> getUniqueYears(List<CoinModel> coins) {
    Set<String> uniqueYears = Set<String>(); // Use a set to store unique years
    uniqueYears.add("All");
    for (var coin in coins) {
      uniqueYears.add(coin.year ?? ''); // Add the year to the set, handling null values
    }

    List<String> sortedUniqueYears = uniqueYears.toList()..sort(); // Convert to a list and sort it

    return sortedUniqueYears;
  }
  Future<void> _loadCoinsData() async {
    final String jsonString =
    await rootBundle.loadString('assets/coins/coins2.json');

   final Map<String, dynamic> jsonmap = json.decode(jsonString);

    final List<dynamic> jsonList = jsonmap['Full 1'];


  List<CoinModel>  coinsm = jsonList.map((json) => CoinModel.fromJson(json)).toList();
    Map<String, CoinModel> uniqueItemsMap = {};

    for (var coin in coinsm) {
      final foto1 = coin.foto_1;
      if (!uniqueItemsMap.containsKey(foto1)) {
        uniqueItemsMap[foto1!] = coin;
      }
    }

    List<CoinModel> uniqueCoinsList = uniqueItemsMap.values.toList();




    setState(() {
 coins =uniqueCoinsList;
 options=getUniqueYears(uniqueCoinsList);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor:  Theme.of(context).secondaryHeaderColor,
        automaticallyImplyLeading: false,
        title: Text(AppConstants.appName, style: const TextStyle(fontSize: 22,color: Colors.black)),
        actions: [
      Container(
      margin: const EdgeInsets.all( 7.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
    //    color: const Color(0xFF2A2727),
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedOption,
          onChanged: ( newValue) {
         //   setState(() {
         //     selectedOption = newValue;
         //   });
          },
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors. black54, // Change the text color
                ),
              ),
            );
          }).toList(),
            ),
          ),
      )
        ],
      ),
      body: ListView.builder(
        itemCount: coins.length, // Replace with the number of items you want in the list
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: CustomInkWell(
              onTap: (){
          //      showDialog(context: context, builder: (context) => NotificationDialog(notificationModel: notification.notificationList![index]));
              },
              highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall,horizontal:  Dimensions.paddingSizeExtraLarge),
                child: Row(
                  children: [

                    SizedBox(

                      height:MediaQuery.of(context).size.width * 0.20,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: ClipRRect(
                     //   borderRadius: BorderRadius.circular(Dimensions.radiusSizeExtraSmall),
                        child: Image.asset(coins[index].foto_1!),
                      ),
                    ),
                   const SizedBox(width: 7,),
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(coins[index].name! ,maxLines: 2,),
                        const SizedBox(height: Dimensions.paddingSizeSmall,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(coins[index].year!),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
