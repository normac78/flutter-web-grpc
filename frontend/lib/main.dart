import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theater_app/grpc.dart';
import 'package:theater_app/src/generated/movies.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

TheaterClient theaterStub = initTheaterClient();

void main() {
  runApp(const TheaterApp());
}

class TheaterHome extends StatelessWidget {
  TheaterHome({Key? key}) : super(key: key);
  final movieRequest = theaterStub.listMovies(
    ListMoviesRequest(
      ids: [
        Int64(0),
        Int64(1),
        Int64(2),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: movieRequest,
        builder:
            (BuildContext context, AsyncSnapshot<ListMoviesResponse> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 700.0,
                    aspectRatio: 16 / 10,
                  ),
                  items: snapshot.data?.movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          color: Theme.of(context).cardColor,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          movie.posterUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.name,
                                            style: GoogleFonts.oswald(
                                              fontSize: 48,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Starring',
                                                style: GoogleFonts.oswald(
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                movie.actors
                                                    .map((actor) {
                                                      return actor.name;
                                                    })
                                                    .toList()
                                                    .toString(),
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                'Director',
                                                style: GoogleFonts.oswald(
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                movie.director.name,
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                'Released',
                                                style: GoogleFonts.oswald(
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                movie.releaseYear.toString(),
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child:
                    Text('Error connecting to gRPC server: ${snapshot.error}'),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class TheaterApp extends StatelessWidget {
  const TheaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TheaterHome(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }
}
