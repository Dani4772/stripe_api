import 'package:flutter/material.dart';
import 'package:stripe_api/charge_model.dart';
import 'package:stripe_api/refund_model.dart';
import 'package:stripe_api/service.dart';
import 'package:stripe_api/token_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _monthController=TextEditingController();
  final _yearController=TextEditingController();
  final _nmbrController=TextEditingController();
  final _cvcController=TextEditingController();
  final _amountController=TextEditingController();
  final _currencyController=TextEditingController();
  var token;
  var chargeToken;
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle:const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                child: TextFormField(
                  controller: _monthController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                   // labelText: "Classroom Name",
                    hintText: "Expiry Month",
                  ),
                )),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: "Expiry Year",
                ),
                //maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: TextFormField(
                controller: _nmbrController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Card Number",
                ),
                //maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: TextFormField(
                controller: _cvcController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter CVC",
                ),
                //maxLines: 5,
              ),
            ),
           const SizedBox(height: 10,),
            ElevatedButton(
              style: style,
              onPressed: () async{
              token= await Service().generateCardToken(TokenModel(
                  expMonth: _monthController.text, expYear: _yearController.text,
                  cardCvc: _cvcController.text, cardNumber: _nmbrController.text));
              print(token);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Token generated')));
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter amount",
                ),
                //maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: TextFormField(
                controller: _currencyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter currency",
                ),
                //maxLines: 5,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: style,
              onPressed: () async{
             chargeToken=    await Service().chargeAmount(ChargeModel(

                     amount: _amountController.text, currency: _currencyController.text, source: token));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Charges done')));
                print(chargeToken);
              },
              child: const Text('Succeed transaction'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: style,
              onPressed: () async{
                   await Service().refundAmount(RefundModel(chargeId: chargeToken));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Refund created')));
              },
              child: const Text('refund create'),
            ),
          ],
        ),
      ),
    );
  }
}
