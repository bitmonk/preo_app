import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preo/common/widgets/app_spacing.dart';
import 'package:preo/features/Home/screens/dashboard/dashboard.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';

class GameCardContainer extends StatelessWidget {
  final GameEnum gameEnum;
  final String customTitle;
  final bool? showDate;

  const GameCardContainer({
    super.key,
    required this.gameEnum,
    this.customTitle = '',
    this.showDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 173.w, maxWidth: double.infinity),
      margin: EdgeInsets.all(8.0),
      // width: 173.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.neutral50,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(gameEnum.title()),
                HorizontalSpacing(17.w),
                if (customTitle.isNotEmpty) Text(customTitle),
                if (gameEnum == GameEnum.lineUp || gameEnum == GameEnum.memory)
                  Container(
                    decoration: BoxDecoration(
                      color: gameEnum == GameEnum.lineUp
                          ? AppColors.secondary50
                          : AppColors.memoryGameBg,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      child: Text(
                        '3/8 in group',
                        style: TextStyle(
                          color: gameEnum == GameEnum.lineUp
                              ? AppColors.secondary500
                              : AppColors.memoryGame,
                          fontSize: Sizes.labelSm,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            VerticalSpacing(10),
            Row(
              children: [
                SvgPicture.asset(
                  gameEnum == GameEnum.lineUp || gameEnum == GameEnum.memory
                      ? Assets.icons.group1
                      : Assets.icons.solo,
                ),
                HorizontalSpacing(6.w),
                gameEnum == GameEnum.lineUp || gameEnum == GameEnum.memory
                    ? Text(
                        'Group1',
                        style: TextStyle(
                          fontSize: Sizes.text,
                          fontWeight: Sizes.font4,
                        ),
                      )
                    : Text(
                        'Solo Play',
                        style: TextStyle(
                          fontSize: Sizes.text,
                          fontWeight: Sizes.font4,
                        ),
                      ),
              ],
            ),
            VerticalSpacing(6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('10.123'),
                if (showDate ?? false)
                  Text(
                    '8 Sept',
                    style: TextStyle(
                      fontSize: Sizes.labelSm,
                      fontWeight: Sizes.font4,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
