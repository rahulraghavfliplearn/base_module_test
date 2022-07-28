import 'package:base_module/base_ui/base_constants.dart';
import 'package:base_module/base_ui/base_mixin.dart';
import 'package:base_module/base_ui/connectivity_provider.dart';
import 'package:base_module/color.dart';
import 'package:base_module/reusable_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_screen.dart';

abstract class BaseInterface with BaseMixin{

 void tapToRefresh();

}