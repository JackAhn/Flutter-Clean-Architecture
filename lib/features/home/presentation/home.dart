import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../utils/context_extensions.dart';

import '../../../common/app_bar_gone.dart';
import '../../../common/bottom_nav_bar/bottom_nav_bar.dart';
import '../../counter/presentation/views/counter_widget.dart';
import '../domain/count_result.dart';
import 'header.dart';
import 'social_tile_widget.dart';
import 'theme_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: context.colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Header(text: 'intro'),
          const Divider(),
          const ThemeWidget(),
          const LanguageTile(),
          const UnionTestTile(),
          const CounterWidget(),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(5); // Change the height to control the gap size
            },
            itemBuilder: (BuildContext context, int index) {
              // Switch case to return different widgets for each index
              switch (index) {
                case 0:
                  return SocialTile(
                    leadingIcon: Icon(Ionicons.logo_github,
                        color: context.colorScheme.primary),
                    title: 'Github',
                    url: Uri.parse('https://github.com/erengun'),
                  );
                case 1:
                  return SocialTile(
                    leadingIcon: Icon(Ionicons.logo_linkedin,
                        color: context.colorScheme.primary),
                    title: 'Linkedin',
                    url: Uri.parse('https://www.linkedin.com/in/erengun'),
                  );
                case 2:
                  return SocialTile(
                    leadingIcon: Icon(Ionicons.logo_medium,
                        color: context.colorScheme.primary),
                    title: 'Medium',
                    url: Uri.parse('https://erengun.medium.com/'),
                  );
                case 3:
                  return SocialTile(
                    leadingIcon: Icon(Ionicons.globe_outline,
                        color: context.colorScheme.primary),
                    title: 'Website',
                    url: Uri.parse('https://erengun.dev'),
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      onChanged: (bool newValue) {
        /// Example: Change locale
        /// The initial locale is automatically determined by the library.
        /// Changing the locale like this will persist the selected locale.
        context.setLocale(newValue ? const Locale('tr') : const Locale('en'));
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      value: context.locale == const Locale('tr'),
      title: Text(
        tr('toggle_language'),
        style:
            Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2),
      ),
    );
  }
}

// Freezed Union Type Test Tile
class UnionTestTile extends StatelessWidget {
  const UnionTestTile({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return ListTile(
      title: const Text('테스트'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: TextField(
            controller: controller,
          )),
          Flexible(flex: 2,  child: ElevatedButton(onPressed: (){
            final result = int.tryParse(controller.text) != null ?
            Result.success(int.parse(controller.text))
                : const Result.failure('숫자가 아닙니다.');
            result.when(
                success: (value) {
                  print('$value를 입력함');
                },
                failure: (fail) {
                  print(fail);
                });
          }, child: Text('완료')))
        ],
      ),
    );
  }
}
