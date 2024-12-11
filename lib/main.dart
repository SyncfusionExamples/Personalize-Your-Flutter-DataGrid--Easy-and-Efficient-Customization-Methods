import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() {
  runApp(const OrderApp());
}

/// The application that contains datagrid on it.
class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order DataGrid Demo',
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const OrderHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class OrderHomePage extends StatefulWidget {
  /// Creates the home page.
  const OrderHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrderHomePageState createState() => _OrderHomePageState();
}

class _OrderHomePageState extends State<OrderHomePage> {
  late OrderDataSource _orderDataSource;
  List<Order> _orders = <Order>[];

  @override
  void initState() {
    super.initState();
    _orders = _fetchOrders();
    _orderDataSource = OrderDataSource(orders: _orders);
    // _orderDataSource
    //     .addColumnGroup(ColumnGroup(name: 'Product', sortGroupRows: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Order Details')),
      ),
      body: SfDataGridTheme(
        data: const SfDataGridThemeData(
            // headerColor: Colors.red
            // selectionColor: Colors.lightGreen,
            // currentCellStyle:
            //     DataGridCurrentCellStyle(borderColor: Colors.red, borderWidth: 5),
            ),
        child: SfDataGrid(
            source: _orderDataSource,
            // allowExpandCollapseGroup: true,
            headerGridLinesVisibility: GridLinesVisibility.both,
            gridLinesVisibility: GridLinesVisibility.both,
            columnWidthMode: ColumnWidthMode.fill,
            // selectionMode: SelectionMode.single,
            // navigationMode: GridNavigationMode.cell,
            // stackedHeaderRows: <StackedHeaderRow>[
            //   StackedHeaderRow(cells: [
            //     StackedHeaderCell(
            //         columnNames: ['OrderID', 'CustomerID'],
            //         child: Container(
            //             color: Colors.red,
            //             child: const Center(
            //                 child: Text(
            //               'Customer Details',
            //               style: TextStyle(color: Colors.white),
            //             )))),
            //     StackedHeaderCell(
            //         columnNames: [
            //           'Product',
            //           'Price',
            //         ],
            //         child: Container(
            //             color: Colors.red,
            //             child: const Center(
            //                 child: Text(
            //               'Product Details',
            //               style: TextStyle(color: Colors.white),
            //             )))),
            //     StackedHeaderCell(
            //         columnNames: ['City', 'ShippementPrice', 'TotalPrice'],
            //         child: Container(
            //             color: Colors.red,
            //             child: const Center(
            //                 child: Text(
            //               'Shippement Details',
            //               style: TextStyle(color: Colors.white),
            //             ))))
            //   ])
            // ],
            // tableSummaryRows: [
            //   GridTableSummaryRow(
            //       showSummaryInRow: true,
            //       color: Colors.indigo,
            //       title: 'Total Order Count: {Count}',
            //       columns: [
            //         const GridSummaryColumn(
            //             name: 'Count',
            //             columnName: 'OrderID',
            //             summaryType: GridSummaryType.count)
            //       ],
            //       position: GridTableSummaryRowPosition.bottom)
            // ],
            columns: <GridColumn>[
              GridColumn(
                columnName: 'OrderID',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Order ID',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'CustomerID',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Customer ID',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'Product',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Product',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'Price',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Price',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'City',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'City',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'ShippementPrice',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Shippement Price',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GridColumn(
                columnName: 'TotalPrice',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Total Price',
                    overflow: TextOverflow.ellipsis,
                    //  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  List<Order> _fetchOrders() {
    List<Order> orderData = [];
    final Random random = Random();

    // Cities list
    List<String> city = [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix',
      'San Francisco',
      'Dallas',
      'Miami',
      'Atlanta',
      'Seattle'
    ];

    // Mapping of products to their market prices.
    Map<String, double> productPrices = {
      'Laptop': 1200.0,
      'Smartphone': 800.0,
      'Tablet': 500.0,
      'Headphones': 150.0,
      'Smartwatch': 200.0,
      'Desktop PC': 1000.0,
      'Gaming Console': 400.0,
      'Fitness Tracker': 100.0,
      'Router': 75.0,
      'Smart TV': 900.0,
      'Drone': 600.0,
      'VR Headset': 350.0,
      'Graphics Card': 800.0,
      'Power Bank': 50.0,
      'Projector': 450.0,
      'Microphone': 80.0,
      'Webcam': 60.0,
      'E-reader': 120.0,
    };

    List<String> products = productPrices.keys.toList();

    // Build exactly 100 records.
    for (int i = 0; i < 50; i++) {
      // Get product name.
      String product = products[i % products.length];

      // Get the price of the product from the productPrices map.
      double price = productPrices[product]!;

      // Generate random shipment price.
      double shipmentPrice = random.nextInt(100) + random.nextDouble();

      // Create an Order object with product and price details.
      orderData.add(Order(
        orderId: 1000 + i,
        customerId: 1700 + i,
        product: product,
        orderPrice: price,
        city: city[i % city.length],
        shippementPrice: shipmentPrice,
        totalPrice: price + shipmentPrice,
      ));
    }
    return orderData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the order which will be rendered in datagrid.
class Order {
  /// Creates the order class with required details.
  Order({
    required this.orderId,
    required this.customerId,
    required this.product,
    required this.orderPrice,
    required this.city,
    required this.shippementPrice,
    required this.totalPrice,
  });

  /// Id of an order.
  final int orderId;

  /// Customer Id of an order.
  final int customerId;

  /// Product name.
  final String product;

  /// City of an order.
  final String city;

  /// Price of an order.
  final double orderPrice;

  /// Shippement price.
  final double shippementPrice;

  /// Total price (order price + shipment price).
  final double totalPrice;
}

/// Set order's data collection to data grid source.
class OrderDataSource extends DataGridSource {
  /// Creates the order data source class with required details.
  OrderDataSource({required List<Order> orders}) {
    dataGridRows = orders
        .map<DataGridRow>((order) => DataGridRow(cells: <DataGridCell>[
              DataGridCell<int>(columnName: 'OrderID', value: order.orderId),
              DataGridCell<int>(
                  columnName: 'CustomerID', value: order.customerId),
              DataGridCell<String>(columnName: 'Product', value: order.product),
              DataGridCell<double>(
                  columnName: 'Price', value: order.orderPrice),
              DataGridCell<String>(columnName: 'City', value: order.city),
              DataGridCell<double>(
                  columnName: 'ShippementPrice', value: order.shippementPrice),
              DataGridCell<double>(
                  columnName: 'TotalPrice', value: order.totalPrice),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: Colors.pink[100],
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(
              (e.columnName == 'Price' ||
                      e.columnName == 'ShippementPrice' ||
                      e.columnName == 'TotalPrice')
                  ? NumberFormat.currency(
                      locale: 'en_US',
                      symbol: '\$',
                      decimalDigits: 2,
                    ).format(e.value)
                  : e.value.toString(),
              style: TextStyle(color: Colors.blue[900])),
        );
      }).toList(),
    );
  }

  // @override
  // Widget? buildTableSummaryCellWidget(
  //     GridTableSummaryRow summaryRow,
  //     GridSummaryColumn? summaryColumn,
  //     RowColumnIndex rowColumnIndex,
  //     String summaryValue) {
  //   return Container(
  //     padding: const EdgeInsets.all(15.0),
  //     child: Text(
  //       summaryValue,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //   );
  // }

  // @override
  // Widget? buildGroupCaptionCellWidget(
  //     RowColumnIndex rowColumnIndex, String summaryValue) {
  //   return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  //       child: Text(
  //         summaryValue,
  //         style: TextStyle(color: Colors.blue[900]),
  //       ));
  // }
}
