import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Bloc/HomeCubit.dart';
import 'package:shop_app/Bloc/HomeStates.dart';
import '../../Components/components.dart';
import '../../Components/const.dart';


class PatientDetails extends StatelessWidget {
  PatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.orangeAccent,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Patient details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Read & Edit",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ConditionalBuilder(
            condition: state is Data_PatientFromID_SuccessState,
            builder: (BuildContext context) {
              return Container(
                child: Column(
                  children:
                  [
                    Divider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: UI_PatientDetials(patientDataModel!, context),
                    ),
                  ],
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
      },
      listener: (context, state) {},
    );
  }


}
