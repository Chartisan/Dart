library chartisan;

import 'dart:convert';
import 'package:chartisan/data.dart';

/// Represents a chartisan chart instance.
class Chartisan {
  /// Stores the server data of the chart.
  final ServerData _serverData;

  /// Creates a new instance of a chartisan chart.
  Chartisan(this._serverData);

  /// Creates a new instance of a chartisan chart.
  static Chartisan build() => Chartisan(ServerData());

  /// Sets the chart labels.
  Chartisan labels(List<String> labels) {
    this._serverData.chart.labels = labels;
    return this;
  }

  /// Adds extra information to the chart.
  Chartisan extra(Map<String, dynamic> value) {
    this._serverData.chart.extra = value;
    return this;
  }

  /// AdvancedDataset appends a new dataset to the chart or modifies an existing one.
  /// If the ID has already been used, the dataset will be replaced with this one.
  Chartisan advancedDataset(
    String name,
    List<double> values,
    Map<String, dynamic> extra,
  ) {
    final dataset = this._getDataset(name);
    if (dataset != null) {
      dataset.name = name;
      dataset.values = values;
      dataset.extra = extra;
    } else {
      this._serverData.datasets.add(DatasetData(name, values, extra));
    }
    return this;
  }

  /// Dataset adds a new simple dataset to the chart. If more advanced control is
  /// needed, consider using `AdvancedDataset` instead.
  Chartisan dataset(String name, List<double> values) =>
      this.advancedDataset(name, values, null);

  /// Transforms the chart into a JSON string.
  String toJSON() => json.encode(this._serverData);

  /// Transforms it to an object.
  ServerData toObject() => this._serverData;

  /// Returns a dataset from the chart or creates a new one given the data.
  DatasetData _getDataset(String name) {
    for (final dataset in this._serverData.datasets) {
      if (dataset.name == name) {
        return dataset;
      }
    }
    return null;
  }
}
