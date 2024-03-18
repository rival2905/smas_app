import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smas_app/Pages/HomePage/recent_post_widgets.dart';

import 'package:smas_app/Pages/components/drawer_screen.dart';
import 'package:smas_app/Controller/homepage_controller.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    HomePageController homePageController = Get.put(HomePageController());
    var controller = Get.put(HomePageController());
    print(homePageController.getPostHome());
    return SafeArea(
      child: Scaffold(
        
        endDrawer: const DrawerScreen(),
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/wraper.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Halo, Dedi Kusnandar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Join us to stay fit now via the mobile app',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, right: 20),
                    //   child: Container(
                    //     padding: const EdgeInsets.all(10),
                    //     decoration: const BoxDecoration(
                    //       color: Color(0xff444487),
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     ),
                    //     child: const Row(
                    //       children: [
                    //         Image(
                    //           image: AssetImage('assets/images/lokasi.png')),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Flexible(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Your Location:',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 'Jl. Raya Cibeureum No.52, Campaka, Kec. Andir,\nKota Bandung, Jawa Barat 40535',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          color: Color.fromARGB(255, 255, 255, 255)
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  const Text(
                                    "Recent",
                                    style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                    ),
                                  ),
                                 
                                  TextButton(
                                    child: Text("See all",
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        decoration: TextDecoration.underline,
                                        decorationStyle: TextDecorationStyle.wavy,
                                        decorationColor: Color(0xffDD9426),
                                        color: Color(0xffDD9426)
                                      ),
                                    ),
                                    onPressed: () {
                                      // Navigate to sign-up screen
                                    
                                      
                                    },
                                  ),
                                ],
                              ),
                            ),
    
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height/5,
                    //   child: GridView.count(
                    //     crossAxisSpacing: 0,
                    //     mainAxisSpacing: 0,
                    //     crossAxisCount: 2,
                    //     padding: const EdgeInsets.only(left: 20,right: 20),
                    //     children: <Widget>[
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //             image: AssetImage('assets/images/Logo_no_text.png'), // Ganti dengan path gambar Anda
                    //             fit: BoxFit.cover,
                    //             colorFilter: ColorFilter.mode(
                    //               Colors.black.withOpacity(0.5), // Ubah warna gradient di sini
                    //               BlendMode.hardLight,
                    //             ),
                    //           ),
                    //         ),
                    //         child: const Column(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                              
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Kwarcab Kabupaten Bogor Minta Anggota Pramuka...",
                    //               maxLines: 4,
                    //               style: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //             SizedBox(height: 8),
                    //             Text(
                    //               "12 April 2021",
                    //               style: TextStyle(
                    //                 fontSize: 12,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             SizedBox(height: 10),

                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //             image: AssetImage('assets/images/Logo_no_text.png'), // Ganti dengan path gambar Anda
                    //             fit: BoxFit.cover,
                    //             colorFilter: ColorFilter.mode(
                    //               Colors.black.withOpacity(0.5), // Ubah warna gradient di sini
                    //               BlendMode.hardLight,
                    //             ),
                    //           ),
                    //         ),
                    //         child: const Column(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Kwarcab Kabupaten Bogor Minta Anggota Pramuka...",
                    //               maxLines: 4,
                    //               style: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //             SizedBox(height: 8),
                    //             Text(
                    //               "12 April 2021",
                    //               style: TextStyle(
                    //                 fontSize: 12,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             SizedBox(height: 10),

                    //           ],
                    //         ),
                    //       ),
                            
                          
                    //     ],
                    //   ),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child:  Obx(() => GridView.count(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        children: homePageController.postListHomePage
                        .map(
                          (e) => RecentPostWidgets(
                            post: e,
                          ),
                        ).toList(),
                      ))
                    )
                    



                  ],
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Builder(builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu,
                          color: Colors.white, size: 30),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    );
                  }),
                ),
                // Positioned(
                //   top: 10,
                //   right: 35,
                //   child: Builder(builder: (context) {
                //     return IconButton(
                //       onPressed: () {
                //         homePageController.getPostHome();
                //       },
                //       icon: const Icon(
                //         Icons.search,
                //         color: Colors.white,
                //       ),
                //     );
                //   }),
                // ),
                
                Positioned(
                  top: 140,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xffDD9426),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/lokasi.png')),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Location:',
                                style: TextStyle(
                                  color: Colors.white,
                                   fontSize: 14,
                                 ),
                              ),
                              Text(
                                'Jl. Raya Cibeureum No.52, Campaka, Kec. Andir,\nKota Bandung, Jawa Barat 40535',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSportIcon(IconData iconData, String label) {
    return Column(
      children: [
        Icon(iconData, color: Colors.white, size: 32),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  
}