import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../Home.dart';

class PaymentEmail extends StatefulWidget {
  int totalPrice;
  PaymentEmail({
    this.totalPrice,
  });
  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<PaymentEmail> {
  final GlobalKey<FormState> formStatekey = GlobalKey<FormState>();
  String _name, _number, _date, _code, _zipcode;
  String _dattaname, _dattanumber, _dattanamedate, _dattacode, _dattazipcode;
  _showdiaiog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'your payment succeded...',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              content: Text(
                'you will recive a confirmation message please check your email',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              contentPadding: EdgeInsets.all(100),
              backgroundColor: Colors.deepPurple,
              elevation: 30.2,
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                   // Navigator.of(context).pop();
                    Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FancyBottomBarPage()));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ));
  }

  void sendMail() async {
    String body = '<h1> Hello sir</h1>' +
        '<h3> congratulation sir , your payment succeded </h3>' +
        '<center><h3>your payment details </h3></center>' +
        '<center><p> $_dattaname </p></center>' +
        '<center><p> $_dattanumber </p></center>' +
        '<center><p> $_dattanamedate </p></center>' +
        '<center><p> $_dattazipcode</p></center>' +
        '<h3>If you do not cancel your reservation  befor 5 days ,you agree that you will automatically be charged</h3>' +
        '<p> ${DateTime.now()}</p>';
    String username = 'ahmedshtat70@gmail.com';
    String password = 'a 50a 50a 50';
    final stmpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'shtat')
      ..recipients.add('ahmedshtat70@gmail.com')
      ..subject = 'Ｈ 𝒆ν𝑒Ňⓣ'
      ..html = body;

    try {
      final sendReport = await send(message, stmpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*  appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0.0,
          title: Text('payment=>',
                        style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.italic
                    ),),  
          actions: <Widget>[
              CircleAvatar(
                 backgroundColor: Colors.deepPurple[100],
                 child:IconButton(
                      icon:Icon(Icons.home,size: 20,color: Colors.white,), 
                      onPressed:(){})
          )
        ],            
                    ),*/

        body: ListView(children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          color: Colors.deepPurple[50],
          child: Column(children: <Widget>[
            Material(
                color: Colors.white,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(120.0),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          Text(
                            'Ｈ 𝒆ν𝑒Ňⓣ',
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                        ])))),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Material(
                color: Colors.white,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                           Column(children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                             // height: 600,
                              margin: EdgeInsets.only(left: 20.0),
                              child: Center(
                                child: Row(children: <Widget>[
                                  Text(
                                    'payment amount',
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  ),
                                  SizedBox(width: 30,),
                                  Text(
                                    widget.totalPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Form(
                                    key: formStatekey,
                                    child: Column(children: <Widget>[
                                      TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple)),
                                          hintText: 'name on card',
                                          suffixIcon: Icon(Icons.credit_card,
                                              color: Colors.deepPurple),
                                        ),
                                        validator: (String val) {
                                          if (val.isEmpty) {
                                            return 'please enter the name';
                                          }
                                        },
                                        onSaved: (val) => _name = val,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple)),
                                          hintText: 'card number',
                                          suffixIcon: Icon(Icons.lock,
                                              color: Colors.deepPurple),
                                        ),
                                        validator: (String val) {
                                          if (val.isEmpty) {
                                            return 'please enter the card  number';
                                          }
                                        },
                                        onSaved: (val) => _number = val,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple)),
                                          hintText: 'expairy date',
                                          suffixIcon: Icon(Icons.date_range,
                                              color: Colors.deepPurple),
                                        ),
                                        validator: (String val) {
                                          if (val.isEmpty) {
                                            return 'please enter the date';
                                          }
                                        },
                                        onSaved: (val) => _date = val,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple)),
                                          hintText: 'security code/CVV',
                                          suffixIcon: Icon(
                                              Icons.not_listed_location,
                                              color: Colors.deepPurple),
                                        ),
                                        validator: (String val) {
                                          if (val.isEmpty) {
                                            return 'please enter your Cvv';
                                          }
                                        },
                                        onSaved: (val) => _code = val,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple)),
                                          hintText: 'ZIP/postal code',
                                          suffixIcon: Icon(
                                            Icons.near_me,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                        validator: (String val) {
                                          if (val.isEmpty) {
                                            return 'please enter the your postal code';
                                          }
                                        },
                                        onSaved: (val) => _zipcode = val,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      RaisedButton(
                                        child: Text('submit'),
                                        color: Colors.deepPurple,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          if (!formStatekey.currentState
                                              .validate()) {
                                            return;
                                          }
                                          formStatekey.currentState.save();
                                          setState(() {
                                            _dattaname = _name;
                                            _dattanumber = _number;
                                            _dattanamedate = _date;
                                            _dattacode = _code;
                                            _dattazipcode = _zipcode;
                                          });
                                          sendMail();
                                          _showdiaiog();
                                        },
                                      ),
                                    ])))
                          ])
                          )),
                ))
          ]))
    ]));
  }
}
