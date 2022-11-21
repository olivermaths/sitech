import 'dart:math' as math;

import 'package:cilinder_app/modules/number_trivia/presentation/screens/display_result_screen.dart';
import 'package:get/get.dart';

class CalcController {
  double cubicRoot(double x) {
    double y = math.pow(x, 1 / 3).toDouble();
    return y;
  }

  double calcHeight(double raio, double liters) {
    return ((liters / ((math.pi) * math.pow(raio, 2))) - ((2 / 3) * raio));
  }

  double custoTotal(double raio, double altura, double custo) {
    return (2 * math.pi * raio * altura) +
        (custo * 2 * math.pi * math.pow(raio, 2).toDouble());
  }

  void calc(double input, double custo) {
    double liters = input / 1000;

    double denominador = 4 * math.pi * (custo - (2 / 3));

    double numerador = 2 * liters;

    double divicao = numerador / denominador;

    double raio = cubicRoot(divicao);
    double height = calcHeight(raio, liters);
    double ct = custoTotal(raio, height, custo);
    Get.to(() => DisplayResultScreen(raio: raio, height: height, custo: ct));
  }

  void calcM(double liters, double custo) {
    double denominador = 4 * math.pi * (custo - (2 / 3));

    double numerador = 2 * liters;

    double divicao = numerador / denominador;

    double raio = cubicRoot(divicao);
    double height = calcHeight(raio, liters);
    double ct = custoTotal(raio, height, custo);

    Get.to(() => DisplayResultScreen(raio: raio, height: height, custo: ct));
  }
}
