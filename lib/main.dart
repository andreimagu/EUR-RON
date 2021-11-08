import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double amountInput = 0;

  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  bool buttonClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency convertor',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Card(
        elevation: 5,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      //'https://www.impact.ro/wp-content/uploads/2020/07/cati-bani-avem-de-platit-pentru-un-euro.jpg',
                      'https://external-preview.redd.it/nQc89-6X7FJPs9ytgdQni3dDQFYhxtTCiCxLzBbnv8I.jpg?auto=webp&s=75bab251306cf803b42ae6405dd86731aa59f923',
                      fit: BoxFit.cover,
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        hintText: 'Enter the amount',
                        labelText: 'Enter amount in RON',
                        suffix: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _controller.clear();
                            amountInput = 0;
                          },
                        )),
                    onChanged: (String value) {
                      amountInput = double.parse(value);
                      buttonClick = true;
                      print(buttonClick);
                    },
                  ),
                  TextButton(
                    child: const Text('Convert'),
                    onPressed: () {
                      if (buttonClick == true) {
                        setState(() {
                          amountInput = amountInput * 5;
                          buttonClick = false;
                        });
                      }
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
                      'RON ${amountInput.toStringAsFixed(2)}',
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
      ),
    );
  }
}
