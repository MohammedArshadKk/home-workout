import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_profilefunction.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.1),
      child: ValueListenableBuilder(
        valueListenable: profileModelistNotifire,
        builder: (BuildContext ctx, List<ProfileModel> profileList, Widget? child) {
          if (profileList.isEmpty) {
            return Center(
              child: InkWell(
                onTap: () => _showBottomSheet(context ,screenHeight,screenWidth),
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white,
                  ),
                  child:  Center(
                    child: Icon(
                      Icons.person_add,
                      size: screenHeight * 0.1,
                    ),
                  ),
                ),
              ),
            );
          }

          final data = profileList.isNotEmpty ? profileList[0] : null;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _showBottomSheet(context, screenHeight , screenWidth),
                    child: Container(
                      height: screenHeight * 0.2,
                      width: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          data?.profile ?? '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context ,double screenHeight , double screenWidth ) {
    final List<String> images = [
      'assets/profile1.jpg',
      'assets/profile2.jpg',
      'assets/profile3.jpg',
      'assets/profile4.jpg',
      'assets/profile5.jpg',
      'assets/profile6.png',
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: screenHeight * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.1),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: const Text(
                    "SELECT PROFILE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: InkWell(
                          onTap: () {
                            final profile = ProfileModel(profile: images[index]);
                            addprofile(profile);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: screenWidth * 0.2,
                            width: screenWidth * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Image.asset(
                              images[index].isNotEmpty
                                  ? images[index]
                                  : 'assets/profile3.jpg',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
