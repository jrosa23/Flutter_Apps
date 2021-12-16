import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'movie_ui/movie_ui.dart';
import 'package:http/http.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);
  static List<Movie> movieList = Movie.getMovies();
  static List movies = [
    "Avatar",
    "I am Legend",
    "300",
    "The Avengers",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Gotham",
    "Power",
    "Narcos",
    "Breaking Bad",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies List"),
          backgroundColor: Colors.blueGrey.shade700,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: <Widget>[
                movieCard(movieList[index], context), //movieCard
                Positioned(
                    top: 11.0,
                    child: movieImage(movieList[index].images[0])), //movieImage
              ]);
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
            margin: const EdgeInsets.only(left: 45.0),
            width: MediaQuery.of(context).size.width,
            height: 123.0,
            child: Card(
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 52.0, right: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(movie.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.white)),
                              ),
                              Text("Rating: ${movie.imdbRating} / 10",
                                  style: mainTextStyle())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("Released: ${movie.released}",
                                  style: mainTextStyle()),
                              Text(movie.runtime, style: mainTextStyle()),
                              Text(movie.rated, style: mainTextStyle()),
                            ],
                          ),
                        ]),
                  ),
                ))),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieListViewDetails(
                      movieName: movie.title, movie: movie)));
        });
  }

  TextStyle mainTextStyle() {
    return const TextStyle(fontSize: 14.0, color: Colors.grey);
  }
  Widget movieImage(String imageUrl) {
    return Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ));
  }
}
//New Route or Page
class MovieListViewDetails extends StatelessWidget {
  const MovieListViewDetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);
  final String movieName;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          const HorizontalLine(),
          MovieDetailsCast(movie: movie),
          const HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images)
        ],
      ),
    );
  }
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  final Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //main parent container
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          alignment: Alignment.center,
          //color: Colors.white,
          child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20.5),
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.brown.shade200,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Total Per Person",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    //fontSize: 15.0,
                                    color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                  "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.green.shade900)),
                            )
                          ]),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.brown.shade200,
                        border: Border.all(
                            color: Colors.blueGrey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          style: const TextStyle(
                              //color: _purple
                          ),
                          decoration: const InputDecoration(
                              prefixText: "Bill Amount: ",
                              prefixIcon: Icon(Icons.attach_money)),
                          onChanged: (String value) {
                            try {
                              _billAmount = double.parse(value);
                            } catch (exception) {
                              _billAmount = 0.0;
                            }
                          },
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Split",
                                style: TextStyle(
                                    //color: Colors.grey.shade700
                                ),
                              ),
                              Row(children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (_personCounter > 1) {
                                        _personCounter--;
                                      } else {
                                        //do nothing
                                      }
                                    });
                                  },
                                  child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      margin: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          color: Colors.brown.withOpacity(0.4)
                                          ),
                                      child: const Center(
                                        child: Text("-",
                                            style: TextStyle(
                                                //color: _purple,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0)),
                                      )),
                                ),
                                Text(
                                  "$_personCounter",
                                  style: const TextStyle(
                                      //color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _personCounter++;
                                    });
                                  },
                                  child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      margin: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: Colors.brown.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: const Center(
                                        child: Text("+",
                                            style: TextStyle(
                                                //color: _purple,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ),
                              ])
                            ]),
                        //Tip
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Tip",
                              style: TextStyle(
                                  //color: Colors.grey.shade700
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                  "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      //color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      //fontSize: 17.0)),
                            ),
                              ),
                            ),
                          ],
                        ),
                        //Slider
                        Column(children: <Widget>[
                          Text(
                            "$_tipPercentage%",
                            style: const TextStyle(
                                //color: _purple,
                                //fontSize: 17.0,
                                //fontWeight: FontWeight.bold
                            ),
                          ),
                          Slider(
                              value: _tipPercentage.toDouble(),
                              min: 0,
                              max: 100,
                              //activeColor: _purple,
                              inactiveColor: Colors.grey,
                              divisions: 100,
                              onChanged: (double newValue) {
                                setState(() {
                                  _tipPercentage = newValue.round();
                                });
                              })
                        ])
                      ],
                    ))
              ])),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
      //don't do it
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);
  _tapButton() {
    debugPrint("Alarm button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gingey"),
          centerTitle: true,
          backgroundColor: Colors.brown.shade700,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.email),
                onPressed: () => debugPrint("Email Tapped!")),
            IconButton(
                icon: const Icon(Icons.access_alarms), onPressed: _tapButton)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint("Missed Call"),
          backgroundColor: Colors.lightGreen,
          child: const Icon(Icons.call_missed),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: "It's cold"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_tree), label: "Braces bracket"),
          ],
          onTap: (int index) => debugPrint("Tapped item: $index"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[CustomButton()],
            )),
        backgroundColor: Colors.brown.shade300);
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);
  get content => null;
  get snackBar => null;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Not the gumdrop button"),
              backgroundColor: Colors.lightGreen.shade800,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.blueAccent.shade100,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Text("Gumdrop"),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return const Center(child: Text("Hello Flutter", textDirection: TextDirection.ltr,), //Text
    //);
    return const Material(
        color: Colors.blueAccent,
        child: Center(
            child: Text("Hello Flutter",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ))));
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BizCard"),
        centerTitle: true,
        backgroundColor: Colors.brown.shade500,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getCard(), _getAvatar()]),
      ),
      backgroundColor: Colors.lightGreen.shade200,
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.black, width: 1.2),
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300/"),
              fit: BoxFit.cover)),
    );
  }

  Container _getCard() {
    return Container(
        width: 350,
        height: 200,
        margin: const EdgeInsets.all(50.0),
        decoration: BoxDecoration(
            color: Colors.green.shade500,
            borderRadius: BorderRadius.circular(14.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Jeremy Rosario",
                style: TextStyle(
                    fontSize: 20.9,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            const Text("jeremyrosario31@gmail.com"),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.person_outline),
                  Text("Twitter: @ShedaTyr")
                ])
          ],
        ));
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Fortune favors the bold. "
        "- Virgil",
    "Knowledge is power...",
    "Time is Money...",
    "Dont do that",
    "I swear if you do..."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Expanded(
            child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(quotes[_index % quotes.length],
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                                fontSize: 16.5))))),
          ),
          const Divider(
            thickness: 1.3,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButton.icon(
                  onPressed: _showQuote,
                  icon: const Icon(Icons.wb_sunny),
                  label: const Text("Inspire Me!"),
                  style: TextButton.styleFrom(primary: Colors.green.shade500))),
          const Spacer(flex: 1)
        ]));
  }

  void _showQuote() {
    //increment index counter by one each time
    setState(() {
      _index++;
    });
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name("A Player Character can ready a grapple attempt?", true),
    Question.name("A Rogue can get sneak attack damage against undead", true),
    Question.name("Heavy armor takes at least 10 minutes to don?", true),
    Question.name(
        "Would a ritualized spell "
        "that takes one 1 minute normally take 12 minutes?",
        false),
    Question.name("Dungeons and Dragons is based on a video game?", false),
    Question.name("The goal of the game is to locate and beat a dragon?", true),
    Question.name(
        "In the 1980's the game came under assault from fundamentalist religious groups?",
        true)
  ];

  final Color _tan = HexColor("#E0C9A6");

  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("True Player Character",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        //backgroundColor: Colors.brown,
      ),
      //backgroundColor: _tan,
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Center(
              child: Image.asset(
                "images/Frozen Wasteland.png",
                width: 400,
                height: 199,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('images/Old Paper.png'),
                        fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2.5)),
                height: 280.0,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    questionBank[_currentQuestionIndex].questionText,
                    style: const TextStyle(
                        color: Colors.black,
                        //fontFamily: 'DancingScript',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => _previousQuestion(),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 14.0,
                    )),
                ElevatedButton(
                  onPressed: () => _checkAnswer(true, context),
                  child: const Text("TRUE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade700,
                    elevation: 14.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false, context),
                  child: const Text("FALSE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade700,
                    elevation: 14.0,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => _nextQuestion(),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 14.0,
                    ))
              ],
            ),
            const Spacer()
          ])),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer
      final snackbar = SnackBar(
        content: const Text("Critical Hit!"),
        backgroundColor: Colors.green.shade700,
        duration: const Duration(milliseconds: 650),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
    } else {
      final snackbar = SnackBar(
        content: const Text("Critical Miss!"),
        backgroundColor: Colors.red.shade700,
        duration: const Duration(milliseconds: 650),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
