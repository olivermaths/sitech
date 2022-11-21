import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_color_pallet.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/theme/app_theme.dart';
import '../controllers/calc_controller.dart';
import '../widgets/background.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final _controller = CalcController();
  final _formKey = GlobalKey<FormState>();

  double custo = 0.0;
  double litros = 0.0;
  final TextEditingController _textEditingController = TextEditingController();
  bool litro = true;
  String unidade = "Liters";
  setUnity(index) {
    setState(() {
      index == 1 ? litro = false : litro = true;
      index == 1 ? unidade = "cubic meters" : unidade = "Liters";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Background(
        children: [
          Positioned(
              top: 180, left: 48, child: AppText.headline(data: "SiTech")),
          Positioned(
              top: 180,
              right: 58,
              child: Image.asset(
                "lib/assets/silo-icon.png",
                width: 56,
              )),
          Positioned(
            top: 388,
            left: 57,
            right: 57,
            child: SizedBox(
              width: 276,
              height: 60,
              child: TextFormField(
                controller: _textEditingController,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 20),
                decoration:
                    AppTheme.appInputDecoration(hintText: "Volume in: "),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty || int.parse(val) > 9999) {
                    return "";
                  }
                  return null;
                },
                onSaved: (val) {
                  litros = double.parse(val!);
                },
              ),
            ),
          ),
          Positioned(
            top: 388,
            left: 57,
            right: 57,
            child: SizedBox(
              width: 276,
              height: 60,
              child: TextFormField(
                controller: _textEditingController,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 20),
                decoration: AppTheme.appInputDecoration(hintText: "Volume in:"),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty || int.parse(val) > 9999) {
                    return "";
                  }
                  return null;
                },
                onSaved: (val) {
                  custo = double.parse(val!);
                },
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 126,
            right: 126,
            child: GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (litro) {
                    _controller.calc(litros, 2);
                  } else {
                    _controller.calcM(litros, 2);
                  }
                }
              },
              child: Container(
                width: 152,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: AppText.body(data: "Calculate"),
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 57,
            right: 57,
            child: Center(
              child: SizedBox(
                width: 200,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              alignment: Alignment.center,
                              child: Text(unidade,
                                  style: GoogleFonts.merriweather(
                                      fontSize: 16,
                                      letterSpacing: 2,
                                      color: AppColors.defaultWhite))),
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: AppColors.primaryColor,
                                    height: 80,
                                    child: CupertinoPicker(
                                        scrollController:
                                            FixedExtentScrollController(
                                                initialItem: 0),
                                        backgroundColor: CupertinoColors.white,
                                        itemExtent: 40,
                                        onSelectedItemChanged: (index) {
                                          setUnity(index);
                                        },
                                        children: [
                                          displayPickerText("Liters"),
                                          displayPickerText("cubic meters"),
                                        ]),
                                  );
                                });
                          }),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center displayPickerText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
