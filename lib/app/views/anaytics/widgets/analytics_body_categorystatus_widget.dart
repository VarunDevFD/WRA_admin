import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/analytics.dart';
import 'package:wdr/app/views/anaytics/widgets/category_indicator_widget.dart';

// Controller for managing CategoryStats state
class CategoryStatsController extends GetxController {
  var touchedIndex = (-1).obs;

  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }
}

class CategoryStats extends StatelessWidget {
  final AnalyticsController analyticsController =
      Get.find<AnalyticsController>();
  final CategoryStatsController controller = Get.put(CategoryStatsController());

  CategoryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[50]!,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category Performance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Top',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 180, 60),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: Obx(() => PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.updateTouchedIndex(-1);
                                return;
                              }
                              controller.updateTouchedIndex(pieTouchResponse
                                  .touchedSection!.touchedSectionIndex);
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      )),
                ),
              ),
              SizedBox(width: 16),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Indicator(
                    color: Color(0xFF2196F3),
                    text: 'Cameras',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color(0xFFFFC300),
                    text: 'Decorations',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color(0xFF6E1BFF),
                    text: 'Dresses',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color(0xFF3BFF49),
                    text: 'FootWears',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color.fromARGB(255, 59, 95, 255),
                    text: 'Jewellery',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color.fromARGB(255, 59, 239, 255),
                    text: 'Sounds',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color.fromARGB(255, 255, 59, 163),
                    text: 'Vehicles',
                    isSquare: true,
                  ),
                  SizedBox(height: 4),
                  Indicator(
                    color: Color.fromARGB(255, 134, 59, 255),
                    text: 'Venues',
                    isSquare: true,
                  ),
                  SizedBox(height: 18),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(8, (i) {
      final isTouched = i == controller.touchedIndex.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xFF2196F3),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xFFFFC300),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xFF6E1BFF),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Color(0xFF3BFF49),
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Color.fromARGB(255, 59, 95, 255),
            value: 45,
            title: '45%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Color.fromARGB(255, 59, 239, 255),
            value: 52,
            title: '52%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 59, 163),
            value: 36,
            title: '36%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 7:
          return PieChartSectionData(
            color: Color.fromARGB(255, 134, 59, 255),
            value: 70,
            title: '70%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}
