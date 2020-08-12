import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textFormFieldDecoration = InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintStyle: GoogleFonts.ptSans(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF7F797D),
                                  ),
                                  errorStyle: GoogleFonts.ptSans(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                );