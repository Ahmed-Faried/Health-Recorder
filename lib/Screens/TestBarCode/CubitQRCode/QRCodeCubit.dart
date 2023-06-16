
import 'dart:io';

// import 'package:barcode/barcode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/const.dart';
import 'package:shop_app/moudel/LoginModel/PatientDataMoudleing.dart';

import 'QRCodeStates.dart';

class QRCodeCubit extends Cubit<QRCodeStates> {
  QRCodeCubit() : super(InitialQRCodeStates());

  static QRCodeCubit get(context) {
    return BlocProvider.of(context);
  }


  late Map<String, dynamic> data = {
    '\n,email': '${patientDataModel?.data?.pationt?.email }\n',
    "name": "${patientDataModel?.data?.pationt?.fristName } ${patientDataModel?.data?.pationt?.lastName}\n",
    "age":  "${patientDataModel?.data?.pationt?.age}\n",
    "phone": "${patientDataModel?.data?.pationt?.phoneNumber}\n" ,
    "BloodType": "${patientDataModel?.data?.pationt?.bloodType}\n",
    "friend's phone":"${patientDataModel?.data?.pationt?.id}\n",

  };

   late String qrData = data.toString();









  //
  // var qrCode = Barcode.qrCode();
  // late  String svgString = qrCode.toSvg(
  //     'Hello, world!',
  //
  //     height: 200.0
  // );


  // Create a DataMatrix barcode


  // final me = MeCard.contact(
  //        name: "${patientDataModel?.data?.pationt?.fristName } ${patientDataModel?.data?.pationt?.lastName}",
  //        address:  "${patientDataModel?.data?.pationt?.age}",
  //        memo: "2254",
  //        tel: "${patientDataModel?.data?.pationt?.phoneNumber}" ,
  //        reading: "Blood Type ${patientDataModel?.data?.pationt?.bloodType}",
  //
  // );

  // Create a DataMatrix barcode
  // var dm = Barcode.qrCode();

// Generate a SVG with "Hello World!"

// Save the image
//    File('barcode.svg').writeAsString(svg);
// Generate a SVG with a barcode that configures the wifi access
//   late String svg = dm.toSvg(me.toString(), width: 200, height: 200);

// Save the image

//   await File('wifi.svg').writeAsString(svg);

  // void buildBarcode(
  //     Barcode bc,
  //     String data, {
  //       String? filename,
  //       double? width,
  //       double? height,
  //       double? fontHeight,
  //     }) {
  //   /// Create the Barcode
  //   final svg = bc.toSvg(
  //     data,
  //     width: width ?? 200,
  //     height: height ?? 80,
  //     fontHeight: fontHeight,
  //   );
  //
  //   // Save the image
  //   filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
  //   File('$filename.svg').writeAsStringSync(svg);
  // }
















}