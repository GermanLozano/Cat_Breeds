
// IMPLEMENTACION DE LA CLASE PRINCIPAL DE HOME_SCREEN

import 'package:cat_app/core/theme/app_theme.dart';
import 'package:cat_app/features/cat_breeds/presentation/blocs/breed_managemen/breed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/app_bar_component.dart';
import 'components/body_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onRefresh();
    });

    _scrollController.addListener(_onLoading);
  }


  // AL CARGAR 
  void _onLoading() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      await context.read<BreedCubit>().onLoad();
    }
  }


  // AL ACTUALIZAR
  Future<void> _onRefresh() async {
    await context.read<BreedCubit>().onRefresh();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onLoading);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      color: AppTheme.orange,
      onRefresh: _onRefresh,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [

            // SE LLAMAN AL COMPONENTE 
            AppBarComponent(),

            // SE LLAMA AL COMPONENTE 
            BodyComponent(),
          ],
        ),
        // bottomNavigationBar: BottonNavigation(currentIndex: ,),
      ),
    );
  }
  
  
}
