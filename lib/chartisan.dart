library chartisan;

import 'dart:convert';
import 'package:chartisan/data.dart';

/// Represents a chartisan chart instance.
class Chartisan {
  /// Stores the server data of the chart.
  ServerData _serverData = ServerData();

  /// Creates a new instance of a chartisan chart.
  Chartisan.build();

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
    List<int> values,
    Map<String, dynamic> extra,
  ) {
    // Get or create the given dataset.
    final datasetInfo = this._getOrCreateDataset(name, values, extra);
    final DatasetData dataset = datasetInfo[0];
    final bool isNew = datasetInfo[1];
    if (isNew) {
      // Append the new dataset.
      this._serverData.datasets.add(dataset);
      return this;
    }
    // Modify the existing dataset.
    dataset.name = name;
    dataset.values = values;
    dataset.extra = extra;
    return this;
  }

  /// Dataset adds a new simple dataset to the chart. If more advanced control is
  /// needed, consider using `AdvancedDataset` instead.
  Chartisan dataset(String name, List<int> values) {
    final DatasetData dataset = this._getOrCreateDataset(name, values, null)[0];
    this._serverData.datasets.add(dataset);
    return this;
  }

  /// Transforms the chart into a JSON string.
  String toJSON() => json.encode(this._serverData);

  /// Returns a dataset from the chart or creates a new one given the data.
  List<dynamic> _getOrCreateDataset(
    String name,
    List<int> values,
    Map<String, dynamic> extra,
  ) {
    for (final dataset in this._serverData.datasets) {
      if (dataset.name == name) {
        return [dataset, false];
      }
    }
    return [new DatasetData(name, values, extra), true];
  }
}
