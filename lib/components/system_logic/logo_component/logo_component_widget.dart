import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logo_component_model.dart';
export 'logo_component_model.dart';

class LogoComponentWidget extends StatefulWidget {
  const LogoComponentWidget({
    super.key,
    this.darkModeLogo,
    this.lightModeLogo,
  });

  final String? darkModeLogo;
  final String? lightModeLogo;

  @override
  State<LogoComponentWidget> createState() => _LogoComponentWidgetState();
}

class _LogoComponentWidgetState extends State<LogoComponentWidget> {
  late LogoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).brightness == Brightness.dark
          ? 'assets/images/Oone_Logo_White.png'
          : 'assets/images/Oone.png',
      height: 45.0,
      fit: BoxFit.contain,
      alignment: Alignment(-1.0, 0.0),
    );
  }
}
