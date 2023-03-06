import 'package:arosaje/viewmodels/mission_list_view_model.dart';
import 'package:flutter/material.dart';

class MissionList extends StatefulWidget {
  final MissionListViewModel _viewModel;

  const MissionList(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Mes Missions"));
  }
}
