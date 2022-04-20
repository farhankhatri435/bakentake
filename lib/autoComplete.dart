//@dart=2.9
// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors_in_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

/// An list picker like Widget with textField to show
/// AutoComplete just like Google Maps,
/// @Required : TextField
/// @Optional Data and onTap Callback
typedef onListItemTap = void Function(Prediction prediction);

class PredictionListAutoComplete extends StatefulWidget {
  final TextField textField;
  final List<Prediction> data;
  final onListItemTap itemTap;

  PredictionListAutoComplete({Key key, this.textField, this.data, this.itemTap})
      : super(key: key);

  @override
  _PredictionListAutoCompleteState createState() =>
      _PredictionListAutoCompleteState();
}

class _PredictionListAutoCompleteState
    extends State<PredictionListAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.textField,
        widget.data != null && widget.data.isNotEmpty
            ? Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.data.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return InkResponse(
                            onTap: () => widget.itemTap(widget.data[index]),
                            child: PredictionItemView(
                              prediction: widget.data[index],
                              key: null,
                            ));
                      }),
                ],
              )
            : SizedBox(
                height: 0,
                width: 0,
              ),
      ],
    );
  }
}

class PredictionItemView extends StatelessWidget {
  final Prediction prediction;

  const PredictionItemView({Key key, this.prediction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              prediction.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(
            height: 1.0,
          )
        ],
      ),
    );
  }
}
