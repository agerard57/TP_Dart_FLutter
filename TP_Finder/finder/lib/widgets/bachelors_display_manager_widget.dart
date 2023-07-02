import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/bachelor_model.dart';
import '../models/bachelors_display_model.dart';
import 'bachelors_display_grid_widget.dart';
import 'bachelors_display_list_widget.dart';
import 'empty_message_widget.dart';

class BachelorDisplayManager extends StatefulWidget {
  final BachelorsDisplayMode mode;
  final List<Bachelor> bachelorList;
  final List<Bachelor> favoriteBachelors;
  final bool enableSwipeToDeleteListElement;

  const BachelorDisplayManager({
    required this.mode,
    required this.bachelorList,
    required this.favoriteBachelors,
    this.enableSwipeToDeleteListElement = false,
  });

  @override
  _BachelorDisplayManagerState createState() => _BachelorDisplayManagerState();
}

class _BachelorDisplayManagerState extends State<BachelorDisplayManager> {
  late BachelorsDisplayMode currentMode;

  @override
  void initState() {
    super.initState();
    currentMode = widget.mode != BachelorsDisplayMode.ALL
        ? widget.mode
        : BachelorsDisplayMode.LIST;
  }

  void toggleDisplayMode() {
    setState(() {
      if (currentMode == BachelorsDisplayMode.LIST) {
        currentMode = BachelorsDisplayMode.GRID;
      } else {
        currentMode = BachelorsDisplayMode.LIST;
      }
    });
  }

  Widget _buildDisplayButton() {
    return widget.mode == BachelorsDisplayMode.ALL
        ? Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: toggleDisplayMode,
              icon: Icon(
                currentMode == BachelorsDisplayMode.LIST
                    ? Icons.grid_view
                    : Icons.view_list,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return widget.bachelorList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDisplayButton(),
              SizedBox(height: 16.0),
              if (currentMode == BachelorsDisplayMode.LIST)
                Expanded(
                  child: BachelorDisplayList(
                    bachelorList: widget.bachelorList,
                    favoriteBachelors: widget.favoriteBachelors,
                    enableSwipeToDeleteListElement:
                        widget.enableSwipeToDeleteListElement,
                  ),
                ),
              if (currentMode == BachelorsDisplayMode.GRID)
                Expanded(
                  child: BachelorDisplayGrid(
                    bachelorList: widget.bachelorList,
                    favoriteBachelors: widget.favoriteBachelors,
                  ),
                ),
            ],
          )
        : EmptyMessage(
            context,
            AppLocalizations.of(context)!.pageNoResults,
          );
  }
}
