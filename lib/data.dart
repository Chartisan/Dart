library chartisan;

class ChartData {
  List<String> labels = [];
  Map<String, dynamic> extra = {};
  Map<String, dynamic> toJson() => {
        'labels': this.labels,
        'extra': this.extra,
      };
}

class DatasetData {
  int id;
  String name;
  List<int> values;
  Map<String, dynamic> extra;
  DatasetData(this.name, this.values, this.id, this.extra);
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'values': this.values,
        'extra': this.extra,
      };
}

class ServerData {
  ChartData chart = ChartData();
  List<DatasetData> datasets = [];
  Map<String, dynamic> toJson() => {
        'chart': this.chart,
        'datasets': this.datasets,
      };
}
