import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'CubitQRCode/QRCodeCubit.dart';
import 'CubitQRCode/QRCodeStates.dart';


class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (BuildContext context) => QRCodeCubit(),
      child: BlocConsumer<QRCodeCubit , QRCodeStates>(
        builder: (context , state) {return Scaffold(
          appBar: AppBar(
            title: Text('My QR Code'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:Text("Scan QR Code" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
              ),
              SizedBox(height: 5,),
              Center(
                child:Text("Patient details", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14)),
              ),
              SizedBox(height: 50,),
              Center(
                child: QrImageView(
                  data: QRCodeCubit.get(context).qrData,
                  size: 200.0,

                ),
              ),
              // Center(
              //   child: SizedBox(
              //     height: 200.0,
              //     width: 200.0,
              //     child: FittedBox(
              //         child: SvgPicture.string(QRCodeCubit.get(context).svg),
              //         fit: BoxFit.contain ),
              //   ),
              // ),
              SizedBox(height: 10,),

            ],
          ),
        );
        },
        listener: (context , state) {},
      ),
    );
  }
}
