import 'package:flutter/material.dart';
import 'package:piggybank/helpers/datetime-utility-functions.dart';
import 'package:piggybank/models/record.dart';
import './i18n/statistics-page.i18n.dart';

class OverviewCard extends StatelessWidget {

  final List<Record> records;

  double maxRecord;
  double minRecord;
  int numberOfRecords;
  double sumValues;
  double averageValue;
  double median;

  final headerStyle = const TextStyle(fontSize: 13.0);
  final valueStyle = const TextStyle(fontSize: 18.0);
  final dateStyle = const TextStyle(fontSize: 24.0);

  OverviewCard(this.records) {
    this.records.sort((a, b) => a.value.abs().compareTo(b.value.abs()));
    sumValues = this.records.fold(0, (acc, e) => acc + e.value);
    minRecord = this.records.first.value.abs();
    maxRecord = this.records.last.value.abs();
    numberOfRecords = this.records.length;
    median = this.records[(numberOfRecords / 2).round() - 1].value.abs();
    averageValue = (sumValues /  numberOfRecords);
  }

  Widget _buildFirstRow () {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Records".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  numberOfRecords.toString(),
                  style: valueStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(endIndent: 10, indent: 10),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sum".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  sumValues.abs().toStringAsFixed(2),
                  style: valueStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(endIndent: 10, indent: 10),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Min".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  minRecord.abs().toStringAsFixed(2),
                  style: valueStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondRow () {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Max".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  maxRecord.abs().toStringAsFixed(2),
                  style: valueStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(endIndent: 10, indent: 10),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Average".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  averageValue.abs().toStringAsFixed(2),
                  style: valueStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(endIndent: 10, indent: 10),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Median".i18n,
                  style: headerStyle,
                ),
                SizedBox(height: 5), // spacing
                Text(
                  median.toStringAsFixed(2),
                  style: valueStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child:  _buildFirstRow(),
              ),
              Divider(endIndent: 10, indent: 10),
              Container(
                padding: EdgeInsets.all(10),
                child:  _buildSecondRow(),
              ),
            ],
          )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: _buildCard(),
    );
  }
}