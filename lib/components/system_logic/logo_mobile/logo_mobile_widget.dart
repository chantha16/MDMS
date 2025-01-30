import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logo_mobile_model.dart';
export 'logo_mobile_model.dart';

class LogoMobileWidget extends StatefulWidget {
  const LogoMobileWidget({
    super.key,
    this.darkModeLogo,
    this.lightModeLogo,
  });

  final String? darkModeLogo;
  final String? lightModeLogo;

  @override
  State<LogoMobileWidget> createState() => _LogoMobileWidgetState();
}

class _LogoMobileWidgetState extends State<LogoMobileWidget> {
  late LogoMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? 'assets/images/icon_-_Copy.png'
                : 'assets/images/icon.png',
            width: 80.0,
            height: 80.0,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
