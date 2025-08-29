import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'policy_store_model.dart';
export 'policy_store_model.dart';

class PolicyStoreWidget extends StatefulWidget {
  const PolicyStoreWidget({super.key});

  static String routeName = 'Policy_Store';
  static String routePath = '/policyStore';

  @override
  State<PolicyStoreWidget> createState() => _PolicyStoreWidgetState();
}

class _PolicyStoreWidgetState extends State<PolicyStoreWidget> {
  late PolicyStoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolicyStoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF00BDFE),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.stars,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '5Star Wireless',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Store Policy',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 25.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '🔁 Returns & Exchanges\n• Malfunctioning devices: 14 days → store credit or exchange only\n• Buyer’s remorse: 48 hrs → 25% restocking fee\n• No refunds on prepaid plans/SIMs/AS-IS items\n• See Refund Policy for full rules\n\n💳 Refunds\n• To original payment method\n• Standard 9–15 biz days; expedited 5–7 biz days (if eligible)\n• Cash refunds by company check (CashApp/Zelle if approved)\n\n🚚 Shipping & Pickup\n• Standard from \$19.95, express \$49.95, free over \$399.99\n• Local pickup available (Tallahassee)\n• See Shipping Policy for terms\n\n🛠️ Warranty & Repairs\nCertified Pre-Owned: 30-day internal defect warranty (repair/replace/credit)\nRepairs: 30-day parts & labor; misuse/damage not covered; iPhones may lose Face ID/Touch ID/True Tone; pick up within 30 days\n\n🧪 Quality Assurance\n• Every device is professionally unboxed, IMEI-verified, cleaned, and tested (open-box presentation)\n\n🎁 Gift Cards / Store Credit\n• In-store only • Not valid for prepaid airtime • No cash value\n\n💳 Pricing & Payment Options\n• USD; major cards, PayPal, Klarna, Affirm, Afterpay, Sezzle\n• Lease-to-own: 5Star Leasing, Progressive, Acima, Payvantage\n\n📶 Compatibility\n• Customer must verify carrier compatibility; not responsible for carrier blocks, throttling, or SIM locks\n\n🔐 Temporary Fraud Prevention Tag\n• Protects against fraud/resale; normal use allowed\n• Restricts factory reset (and Wi-Fi toggle on iPhone while active)\n• Expires automatically: 120 days (card) / 24–48 hrs (cash)\n• Early removal: security@5star-wireless.com\n (name, order/receipt, IMEI, reason)\n• Do not tamper; violation may void warranty or lock device\n\n🗓️ Hours & Closures\n• Mon–Fri 11 AM – 7 PM • Sat/Sun Closed • Major US holidays closed\n\n📸 Listings\n• Photos are illustrative; minor cosmetic variations may occur\n\n⏱️ Support\n• Typical response 1–2 biz days; tag/unlock requests up to 3 biz days\n\n🧾 Docs & Return Shipping\n• Requirements and label deductions in Refund Policy\n\n🧮 Sales Tax\n• Collected where required; may expand with economic-nexus thresholds\n\n⚖️ Disputes\n• See Terms of Service for arbitration/jurisdiction\n\n🌍 International Orders\n• Not currently offered\n\n📞 Contact\n• 3539 Apalachee Pkwy, Suite 7, Tallahassee, FL 32311\n• (850) 317-6633 • contact@5star-wireless.com\n\nBy purchasing from 5Star Wireless, you agree to this Store Policy and our Terms of Service.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: Color(0xFF3A3939),
                  ),
                  if (FFAppState().bottomSeen)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().bottomSeen = true;
                        safeSetState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Reached bottom ✅',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFA5A3A3),
                        ),
                        child: Text(
                          'Tap to confirm',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  if (FFAppState().bottomSeen == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().visitedStore = true;
                          safeSetState(() {});
                          context.safePop();
                        },
                        text: 'Done',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
