import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assignment/Controllers/authController.dart';
import 'package:news_assignment/Providers/newState.dart';
import 'package:provider/provider.dart';

import '../../Theme/theme.dart';

class NewScreen extends StatelessWidget {
  NewScreen({super.key});

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    NewState newState = Provider.of<NewState>(context);
    final timeAgo = DateTime.now().difference(
      DateTime.parse(newState.articles.publishedAt!).toLocal(),
    );

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: SystemTheme.primary,
        actions: [
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(newState.articles.urlToImage ??
                                'https://via.placeholder.com/150'),
                            fit: BoxFit.cover),
                        // color: SystemTheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        child: Text(
                          newState.articles.source!.name!,
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.white),
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  newState.articles.title!,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // color: SystemTheme.primary,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'By ${newState.articles.author}',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: SystemTheme.primary,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      timeAgo.inHours > 24
                          ? '${timeAgo.inDays}D ago'
                          : '${timeAgo.inHours} hours ago',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: SystemTheme.primary,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  newState.articles.content == null
                      ? 'no content'
                      : newState.articles.content!.split('[').first,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Read More at :' + newState.articles.url!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
          )),
    );
  }
}
