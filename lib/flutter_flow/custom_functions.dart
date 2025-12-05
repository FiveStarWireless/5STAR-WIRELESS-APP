import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

Color variantColorFromName(String? name) {
// defend against null
  final n = (name ?? '').toLowerCase().trim();

  // very light colors
  if (n.contains('white') || n.contains('starlight') || n.contains('cream')) {
    return const Color(0xFFFFFFFF);
  }

  // black / very dark
  if (n.contains('black') || n.contains('graphite') || n.contains('obsidian')) {
    return const Color(0xFF000000);
  }

  // grays / titanium / silver-ish
  if (n.contains('titanium') ||
      n.contains('gray') ||
      n.contains('grey') ||
      n.contains('silver') ||
      n.contains('shadow')) {
    return const Color(0xFF8E8E93);
  }

  // blues
  if (n.contains('blue') ||
      n.contains('ultramarine') ||
      n.contains('pacific')) {
    return const Color(0xFF007AFF);
  }

  // teal / aqua
  if (n.contains('teal') || n.contains('aqua') || n.contains('turquoise')) {
    return const Color(0xFF30B0C7);
  }

  // greens
  if (n.contains('green') || n.contains('forest') || n.contains('mint')) {
    return const Color(0xFF34C759);
  }

  // gold / yellow
  if (n.contains('gold') ||
      n.contains('yellow') ||
      n.contains('lemon') ||
      n.contains('champagne')) {
    return const Color(0xFFFFCC00);
  }

  // orange
  if (n.contains('orange') || n.contains('coral')) {
    return const Color(0xFFFF9500);
  }

  // red
  if (n.contains('red')) {
    return const Color(0xFFFF3B30);
  }

  // pink / rose
  if (n.contains('pink') || n.contains('rose') || n.contains('blush')) {
    return const Color(0xFFFF2D55);
  }

  // purple / violet
  if (n.contains('purple') ||
      n.contains('violet') ||
      n.contains('lavender') ||
      n.contains('lilac')) {
    return const Color(0xFFAF52DE);
  }

  // brown / beige / desert-ish
  if (n.contains('brown') ||
      n.contains('beige') ||
      n.contains('sand') ||
      n.contains('desert')) {
    return const Color(0xFF8B572A);
  }

  // fallback neutral
  return const Color(0xFFCCCCCC);
}

List<String> uniqueVariantOptions(
  List<dynamic> edges,
  int optionIndex,
) {
  // If there are no edges, return an empty list instead of null
  if (edges == null) {
    return <String>[];
  }

  final Set<String> seen = <String>{};
  final List<String> result = <String>[];

  for (final edge in edges) {
    if (edge is Map<String, dynamic>) {
      final node = edge['node'];
      if (node is Map<String, dynamic>) {
        final selectedOptions = node['selectedOptions'];
        if (selectedOptions is List) {
          // Make sure the index exists in selectedOptions
          if (optionIndex >= 0 && optionIndex < selectedOptions.length) {
            final opt = selectedOptions[optionIndex];
            if (opt is Map<String, dynamic>) {
              final value = opt['value'];
              if (value is String) {
                final String trimmed = value.trim();
                if (trimmed.isNotEmpty && !seen.contains(trimmed)) {
                  seen.add(trimmed);
                  result.add(trimmed);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

dynamic findVariantForStorage(
  List<dynamic>? edges,
  String storage,
) {
  if (edges == null) return null;

  final target = storage.trim().toLowerCase();

  for (final edge in edges) {
    if (edge is Map && edge['node'] is Map) {
      final node = edge['node'] as Map;
      final selectedOptions = node['selectedOptions'];

      if (selectedOptions is List) {
        for (final opt in selectedOptions) {
          if (opt is Map && opt['value'] is String) {
            final value = (opt['value'] as String).trim().toLowerCase();
            if (value == target) {
              // Return the variant node (has price, id, etc.)
              return Map<String, dynamic>.from(node);
            }
          }
        }
      }
    }
  }

  return null;
}
