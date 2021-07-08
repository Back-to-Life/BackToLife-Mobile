import '../../../../core/base/view/base_view.dart';
import 'package:flutter/material.dart';

import 'learning_blue_view_model.dart';

class LearningBlue extends StatelessWidget {
  const LearningBlue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LearningBlueViewModel>(
        viewModel: LearningBlueViewModel(),
        onModelReady: (LearningBlueViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => Scaffold(
              body: Center(
                child: Text('data'),
              ),
            ));
  }
}
