import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'policy_terms_model.dart';
export 'policy_terms_model.dart';

class PolicyTermsWidget extends StatefulWidget {
  const PolicyTermsWidget({super.key});

  static String routeName = 'Policy_Terms';
  static String routePath = '/policyTerms';

  @override
  State<PolicyTermsWidget> createState() => _PolicyTermsWidgetState();
}

class _PolicyTermsWidgetState extends State<PolicyTermsWidget> {
  late PolicyTermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolicyTermsModel());

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
                      'Terms of Service',
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
                                  '📜 Acceptance & Scope\n• By using the 5Star Wireless app, website, or buying in-store, you agree to these terms and our posted policies.\n\n🛒 Products, Pricing & Payments\n• Listings may change; limited quantities; errors may be corrected.\n• Prices in USD; methods: major cards, PayPal, Klarna, Affirm, Afterpay, Sezzle.\n• Lease-to-own options: 5Star Leasing, Progressive, Acima, Payvantage.\n\n🎁 Gift Cards & Store Credit\n• In-store only; not cash-redeemable (unless required by law); not for prepaid airtime.\n\n💸 Returns & Refunds\n• Follow our Refund Policy for eligibility, timelines, and restocking fees.\n\n📦 Shipping & Delivery\n• See Shipping Policy for timelines and responsibility after delivery.\n\n🛠️ Warranties & Repairs\n• Certified Pre-Owned: 30-day malfunction warranty (repair/replace/store credit).\n• Repairs: 30-day parts & labor; damage/misuse voids warranty; iPhone Face ID/Touch ID/True Tone may be affected.\n\n🔐 Fraud Prevention Tag\n• Devices include a temporary security tag. Early removal: see Store Policy or email security@5star-wireless.com\n.\n\n📲 Activations & Services\n• Plan activations/SIMs are final once processed; no refunds. Confirm compatibility before activation.\n\n📡 Network & Coverage\n• Performance/coverage is governed by the carrier; 5Star isn’t liable for throttling or outages.\n\n🛑 Cancellations\n• Orders can be canceled only before fulfillment.\n\n💬 Reviews & Communications\n• Reviews may be used for marketing (first name/city unless you request anonymity).\n• Calls may be recorded for quality, training, and fraud prevention.\n\n🚫 Prohibited Uses\n• No unlawful use, device tampering, tag bypass, or chargeback abuse.\n\n™️ Trademarks & Affiliations\n• Third-party brands are trademarks of their owners; no affiliation implied.\n\n📦 Lost/Stolen Packages\n• If a carrier marks “delivered,” claims must be filed with the carrier.\n\n🔏 Privacy & Data\n• See Privacy Policy for what we collect, how we use it, and your rights. We retain records as required by law.\n\n⚖️ Governing Law & Disputes\n• Florida law; binding arbitration or small claims in Leon County, FL; no class actions or jury trials.\n\n🔄 Changes to These Terms\n• We may update these terms; continued use means acceptance.\n\n📞 Contact\n• 5Star Wireless — 3539 Apalachee Pkwy, Suite 7, Tallahassee, FL 32311\n• contact@5star-wireless.com\n• (850) 317-6633\n• Unlock Support: security@5star-wireless.com',
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
                  if (!FFAppState().bottomSeen)
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
                          FFAppState().visitedTerms = true;
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
