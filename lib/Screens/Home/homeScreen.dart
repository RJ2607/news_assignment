import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assignment/Api/apiHelper.dart';
import 'package:news_assignment/Controllers/authController.dart';
import 'package:news_assignment/ProviderHelper/providerState.dart';
import 'package:news_assignment/Theme/theme.dart';
import 'package:news_assignment/Utils/apiEndPoints.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: SystemTheme.primary,
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text('Select Country'),
                        content: DropdownButton(
                            value: Provider.of<ProviderState>(context).country,
                            items: ApiEndPoints.topHeadlines.countryCode.keys
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e.toUpperCase())))
                                .toList(),
                            onChanged: (value) {
                              Provider.of<ProviderState>(context, listen: false)
                                  .setCountry(value!);
                              Navigator.pop(context);
                            }));
                  });
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/Vector.svg',
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Consumer<ProviderState>(
                  builder: (context, countryProvider, child) {
                    return Text(
                      countryProvider.country.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              authController.signOutController(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          'MyNews',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Headlines',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(child: _buildBody(context)),
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ApiHelper>(context)
          .getTopHeadlinesCountry(Provider.of<ProviderState>(context).country),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.articles!.isEmpty) {
          return const Center(
            child: Text('No Recent News'),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                final timeAgo = DateTime.now().difference(
                  DateTime.parse(snapshot.data!.articles![index].publishedAt!)
                      .toLocal(),
                );
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.articles![index].source!.name!,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              snapshot.data!.articles![index].title!,
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              timeAgo.inHours > 24
                                  ? '${timeAgo.inDays}D ago'
                                  : '${timeAgo.inHours} hours ago',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                snapshot.data!.articles![index].urlToImage ??
                                    'https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
        return const Center(
          child: Text('Error Fetching Data'),
        );
      },
    );
  }
}
