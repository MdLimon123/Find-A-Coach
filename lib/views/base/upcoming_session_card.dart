import 'package:find_me_a_coach/models/clientModel/upcoming_session_home_model.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingSessionCard extends StatelessWidget {
  final UpcomingSession session;
  const UpcomingSessionCard({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final imageBaseUrl = ApiConstant.imageBaseUrl;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [

              CustomNetworkImage(
                  imageUrl: '$imageBaseUrl${session.coachImage}',
                  boxShape: BoxShape.circle,
                  height: 50,
                  width: 72),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(session.coachName, style: AppStyles.h3(color: AppColors.textColor)),
                  Text(session.coachingAreaName,
                      style: AppStyles.h5(color: AppColors.textColor, fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF002F62),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.white, size: 18),
                const SizedBox(width: 6),
                Text(DateFormat('EEEE, MMM d').format(session.sessionDate!),
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                SizedBox(width: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(height: 24, child: VerticalDivider(color: Colors.white, thickness: 1, width: 1)),
                ),
                SizedBox(width: 30),
                const Icon(Icons.access_time, color: Colors.white, size: 18),
                const SizedBox(width: 10),
                Text(DateFormat.jm().format(session.sessionDateTime!),
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Icon(Icons.computer, color: Colors.white, size: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
