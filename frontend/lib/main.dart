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
                    height: MediaQuery.of(context).size.height - 100,
                    aspectRatio: 16 / 10,
                  ),
                  items: snapshot.data?.movies.map((movie) {
                    var actors = [];
                    for (var actor in movie.actors) {
                      actors.add(actor.name);
                    }

                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          color: Theme.of(context).cardColor,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth < 600) {
                                return Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.network(
                                        movie.posterUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          const Spacer(),
                                          Text(
                                            movie.name,
                                            style: GoogleFonts.raleway(
                                              fontSize: 36,
                                            ),
                                          ),
                                          Text(
                                            movie.releaseYear.toString(),
                                            style: GoogleFonts.raleway(
                                              fontSize: 24,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Directed by",
                                            style: GoogleFonts.raleway(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            movie.director.name,
                                            style: GoogleFonts.raleway(
                                              fontSize: 24,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Starring",
                                            style: GoogleFonts.raleway(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            actors.join(", ").toString(),
                                            style: GoogleFonts.raleway(
                                              fontSize: 24,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.network(
                                          movie.posterUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 100, 20, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              movie.name,
                                              style: GoogleFonts.raleway(
                                                fontSize: 48,
                                              ),
                                            ),
                                            Text(
                                              movie.releaseYear.toString(),
                                              style: GoogleFonts.raleway(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "Directed by",
                                              style: GoogleFonts.raleway(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              movie.director.name,
                                              style: GoogleFonts.raleway(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "Starring",
                                              style: GoogleFonts.raleway(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              actors.join(", ").toString(),
                                              style: GoogleFonts.raleway(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
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
