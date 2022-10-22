import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/app_route.dart';
import '../../../widget/base_button.dart';
import 'footer_section.dart';

class UnknowScreen extends StatelessWidget {
  const UnknowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Page Not Found",
      color: Colors.black,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '404',
                          style: GoogleFonts.montserrat(
                            fontSize: 48,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Halaman tidak ditemukan',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BaseButton(
                          text: 'Back to Home',
                          onClick: () =>
                              context.replaceRoute(const HomeRoute()),
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: FooterSection())
                ],
              ),
            ),
          ),
        ),
    );
  }
}
