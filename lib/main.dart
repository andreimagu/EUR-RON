import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double amountInput = 0;
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency  da convertor'),
      ),
      body: Card(
        elevation: 5,
        child: SingleChildScrollView(
          child: Container(

            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    'https://www.impact.ro/wp-content/uploads/2020/07/cati-bani-avem-de-platit-pentru-un-euro.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: 'Enter te amoun in Euro',
                      suffix: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          amountInput = 0;
                        },
                      )),
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    amountInput = double.parse(value);
                  },
                ),
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    setState(() {
                      amountInput = amountInput * 4.5;
                    });
                  },
                ),
                if (amountInput == 0)
                  const Text(
                    'No amount',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.blueGrey,
                    ),
                  )
                else
                  Text(
                    'Euroi ${amountInput.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.blueGrey,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
