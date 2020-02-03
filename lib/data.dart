library chartisan;

/// Reprensets the ChartData structure.
class ChartData {
  /// Stores the chart labels.
  List<String> labels = [];

  /// Stores the extra information of the chart.
  Map<String, dynamic> extra = null;

  /// Transforms the ChartData into a JSON.
  Map<String, dynamic> toJson() => {
        'labels': this.labels,
        'extra': this.extra,
      };
}

/// Represents the DatasetData of the chart.
class DatasetData {
  /// Stores the dataset name (the label).
  String name;

  /// Stores the dataset values.
  List<int> values;

  /// Stores the dataset extra information.
  Map<String, dynamic> extra;

  /// Creates a new dataset data.
  DatasetData(this.name, this.values, this.extra);

  /// Transforms the dataset to JSON.
  Map<String, dynamic> toJson() => {
        'name': this.name,
        'values': this.values,
        'extra': this.extra,
      };
}

/// Represents the server data of the chart.
class ServerData {
  /// Store the chart information.
  ChartData chart = ChartData();

  /// Stores the chart's datasets.
  List<DatasetData> datasets = [];

  /// Transforms the server data into JSON.
  Map<String, dynamic> toJson() => {
        'chart': this.chart,
        'datasets': this.datasets,
      };
}
