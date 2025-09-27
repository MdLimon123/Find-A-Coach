import 'package:find_me_a_coach/controllers/clientController/client_search_controller.dart';
import 'package:find_me_a_coach/controllers/clientController/find_coach_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key});

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {

  final  _findCoachController = Get.put(FindCoachController());


  RangeValues _currentRangeValues = const RangeValues(100, 300);
  final double _min = 50;
  final double _max = 500;


  final Map<String, bool> _checkboxValues = {
    'lgbtqFriendly': false,
    'experienceWithNeurodiversity': false,
    'offersSlidingScale': false,
    'eveningAvailability': false,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(title: 'filters'.tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "coachingMethod".tr, // Changed
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
                SizedBox(height: 12,),
                Obx(() {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildContainer(
                          text: "virtualCoaching".tr,
                          isSelected: _findCoachController.selected.value == 1,
                          onTap: () => _findCoachController.select(1),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildContainer(
                          text: "inPersonCoaching".tr,
                          isSelected: _findCoachController.selected.value == 2,
                          onTap: () => _findCoachController.select(2),
                        ),
                      ),
                    ],
                  );
                }),


            SizedBox(height: 12),

            SizedBox(height: 24),
            Text(
              "preferredLanguage".tr, // Changed
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _showLanguageSelector(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.textColor, // Assuming this is light for dark text
                  border: Border.all(color: Color(0xFF8DA9D4)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return Text(
                        _findCoachController.selectedLanguages.isEmpty
                            ? "selectLanguages".tr // Changed
                            : _findCoachController.selectedLanguages
                            .map((langKey) => langKey.tr) // Translate each selected key
                            .join(", "),
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),
                    Icon(Icons.keyboard_arrow_down, color: Color(0xFF4B5563)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "availability".tr, // Changed
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),

            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContainerTime(
                    text: "morning9to12".tr,
                    isSelected: _findCoachController.selectedSlot.value == 1,
                    onTap: () => _findCoachController.selectTime(1),
                  ),
                  const SizedBox(height: 12),
                  _buildContainerTime(
                    text: "afternoon12to4".tr,
                    isSelected: _findCoachController.selectedSlot.value == 2,
                    onTap: () => _findCoachController.selectTime(2),
                  ),
                  const SizedBox(height: 12),
                  _buildContainerTime(
                    text: "evening4to8".tr,
                    isSelected: _findCoachController.selectedSlot.value == 3,
                    onTap: () => _findCoachController.selectTime(3),
                  ),
                ],
              );
            }),

            // Changed
            SizedBox(height: 24),
            Text(
              "pricing".tr, // Changed
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4.0,
                activeTrackColor: const Color(0xff1e40af),
                inactiveTrackColor: const Color(0xffa5b4fc),
                rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                rangeThumbShape:
                const RoundRangeSliderThumbShape(enabledThumbRadius: 8.0),
                thumbColor: Colors.white,
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
                overlayColor: const Color(0xFF00428A).withAlpha(50), // Adjusted alpha
                showValueIndicator: ShowValueIndicator.always,
                rangeValueIndicatorShape: const _CustomRangeSliderValueIndicatorShape(),
                valueIndicatorColor: const Color(0xFF00428A),
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                tickMarkShape: null,
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: _min,
                max: _max,
                divisions: null, // Continuous slider
                labels: RangeLabels(
                  '\$${_currentRangeValues.start.round()}',
                  '\$${_currentRangeValues.end.round()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
            _buildPriceLabels(),
            SizedBox(height: 24),
            Text(
              "specialConsiderations".tr, // Changed
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: _checkboxValues.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(
                    key.tr, // Changed
                    style: AppStyles.h3(color: AppColors.fillTextColor),
                  ),
                  value: _checkboxValues[key],
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValues[key] = value!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Obx(
                ()=> CustomButton(
                loading: _findCoachController.isLoading.value,
                  onTap: () async{
                await _findCoachController.fetchAllCoachFilter(
                    minPrice: _currentRangeValues.start,
                    maxPrice: _currentRangeValues.end,
                    checkboxValues: _checkboxValues);
                Get.back();

              }, text: "applyFilters".tr),
            ) // Changed
          ],
        ),
      ),
    );
  }


  Widget _buildContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3368A1) : const Color(0xFFE6ECF3),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFF3368A1),
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF00428A),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildContainerTime({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3368A1) : const Color(0xFFE6ECF3),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFF3368A1), width: 0.5),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF00428A),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


  _buildPriceLabels() {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _PriceLabelText(label: '\$50'),
          _PriceLabelText(label: '\$100'),
          _PriceLabelText(label: '\$200'),
          _PriceLabelText(label: '\$300'),
          _PriceLabelText(label: '\$400'),
          _PriceLabelText(label: '\$500'),
        ],
      ),
    );
  }

  _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter modalSetState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: _findCoachController.languages.map((languageKey) { // Assuming languages are keys
                  return Obx(() { // If selectedLanguages is an RxList
                    final isSelected = _findCoachController.selectedLanguages.contains(languageKey);
                    return CheckboxListTile(
                      title: Text(
                        languageKey.tr, // Translate the language key for display
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: isSelected,
                      onChanged: (bool? value) {
                        // No need for modalSetState here if FilterController handles Obx updates
                        _findCoachController.toggleLanguage(languageKey, value ?? false);
                      },
                      activeColor: AppColors.primaryColor,
                    );
                  });
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}


class _PriceLabelText extends StatelessWidget {
  const _PriceLabelText({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}



class _CustomRangeSliderValueIndicatorShape
    extends RangeSliderValueIndicatorShape {
  const _CustomRangeSliderValueIndicatorShape();

  @override
  Size getPreferredSize(
      bool isEnabled,
      bool isDiscrete, {
        required TextPainter labelPainter,
        required double textScaleFactor,
      }) {
    final double width = labelPainter.width + 24.0;
    final double height = labelPainter.height + 12.0;
    return Size(width, height + 8.0);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool? isDiscrete,
        bool? isOnTop,
        required TextPainter labelPainter, // This painter carries the "$value" text
        double? textScaleFactor,
        required SliderThemeData sliderTheme,
        Thumb? thumb,
        double? value,
        RenderBox? parentBox,
        TextDirection? textDirection,
        Size? sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = sliderTheme.valueIndicatorColor ?? Colors.blue;
    final Size preferredSize = getPreferredSize(true, isDiscrete ?? false,
        labelPainter: labelPainter, textScaleFactor: textScaleFactor ?? 1.0);

    final double thumbRadius =
        sliderTheme.rangeThumbShape?.getPreferredSize(true, isDiscrete ?? false).height ??
            12.0;

    final Offset tooltipCenter =
    Offset(center.dx, center.dy - thumbRadius - preferredSize.height / 2);

    final Rect rect = Rect.fromCenter(
      center: tooltipCenter,
      width: preferredSize.width,
      height: preferredSize.height - 8.0,
    );
    final RRect rrect = RRect.fromRectAndRadius(rect, const Radius.circular(8.0));
    canvas.drawRRect(rrect, paint);

    final Path trianglePath = Path();
    final Offset triangleTip = Offset(center.dx, rect.bottom);
    trianglePath.moveTo(triangleTip.dx, triangleTip.dy + 8.0);
    trianglePath.lineTo(triangleTip.dx - 8.0, triangleTip.dy);
    trianglePath.lineTo(triangleTip.dx + 8.0, triangleTip.dy);
    trianglePath.close();
    canvas.drawPath(trianglePath, paint);

    labelPainter.paint(
      canvas,
      Offset(
        rect.left + (rect.width - labelPainter.width) / 2,
        rect.top + (rect.height - labelPainter.height) / 2,
      ),
    );
  }
}

