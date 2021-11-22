import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/presentation/pages/landing_page/landing_page.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return const LandingPage();
  }
}