import 'package:flutter/material.dart';
import 'package:flutter_application_1/quote.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              quote.author,
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(
              height: 8,
            ),
            TextButton.icon(
                onPressed: delete,
                icon: Icon(Icons.delete, color: Colors.red[700]),
                label: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red[700]),
                ))
          ],
        ),
      ),
    );
  }
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: 'Rá ie ié', author: 'Malandro'),
    Quote(
        text: 'Eiiitaaa Mainhaaa!! Esse Lorem ipsum é só na sacanageeem!!',
        author: 'Cumpadi'),
    Quote(
        text: 'E que abundância meu irmão viuu!! Assim você vai matar o papai.',
        author: 'Cumpadi'),
    Quote(
        text: 'Só digo uma coisa, Domingo ela não vai! Danadaa!!',
        author: 'Cumpadi'),
    Quote(text: 'É hora do show!!!', author: 'Bambam'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Quotes Incríveis'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
        body: Column(
            children: quotes
                .map((quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    }))
                .toList()));
  }
}
