import 'dart:io';

import 'package:bybit/Models/test.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DerivativesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<Candle> candles = [];
  late TabController tabController;

  WebViewController? controller;
  var url =
      "https://s.tradingview.com/widgetembed/?frameElementId=tradingview_cf88c&symbol=BINANCE%3ASLPUSDT&interval=1D&hidelegend=1&hidesidetoolbar=0&symboledit=0&saveimage=1&toolbarbg=131722&studies=%5B%5D&theme=dark&style=1&showpopupbutton=1&studies_overrides=%7B%7D&overrides=%7B%22paneProperties.background%22%3A%22%23131722%22%2C%22scalesProperties.backgroundColor%22%3A%22%23131722%22%2C%22paneProperties.vertGridProperties.color%22%3A%22%231c1c31%22%2C%22paneProperties.horzGridProperties.color%22%3A%22%231c1c31%22%2C%22paneProperties.crossHairProperties.color%22%3A%22%231c1c31%22%2C%22scalesProperties.textColor%22%3A%22%238B8D98%22%2C%22scalesProperties.lineColor%22%3A%22%231c1c31%22%2C%22mainSeriesProperties.candleStyle.wickUpColor%22%3A%22%23229E6B%22%2C%22mainSeriesProperties.candleStyle.wickDownColor%22%3A%22%23EE2844%22%2C%22mainSeriesProperties.candleStyle.upColor%22%3A%22%23229E6B%22%2C%22mainSeriesProperties.candleStyle.downColor%22%3A%22%23EE2844%22%2C%22mainSeriesProperties.candleStyle.borderUpColor%22%3A%22%23229E6B%22%2C%22mainSeriesProperties.candleStyle.borderDownColor%22%3A%22%23EE2844%22%2C%22paneProperties.legendProperties.showLegend%22%3Afalse%2C%22paneProperties.legendProperties.showStudyValues%22%3Afalse%2C%22symbolWatermarkProperties.color%22%3A%22rgba(0%2C%200%2C%200%2C%200.00)%22%7D&enabled_features=%5B%22show_logo_on_all_charts%22%2C%22move_logo_to_main_pane%22%2C%22timeframes_toolbar%22%2C%22volume_force_overlay%22%2C%22caption_buttons_text_if_possible%22%2C%22header_settings%22%2C%22left_toolbar%22%2C%22header_compare%22%2C%22compare_symbol%22%2C%22header_screenshot%22%2C%22header_widget_dom_node%22%2C%22header_interval_dialog_button%22%2C%22show_interval_dialog_on_key_press%22%5D&disabled_features=%5B%22use_localstorage_for_settings%22%2C%22hide_left_toolbar_by_default%22%2C%22header_symbol_search%22%2C%22header_saveload%22%2C%22header_undo_redo%22%5D&showpopupbutton=1&locale=en&utm_source=zoodchange.com&utm_medium=widget&utm_campaign=chart&utm_term=BINANCE%3ASLPUSDT";


  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    fetchCandles().then((value) {
      print(value.length);
      candles = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<List<Candle>> fetchCandles() async {
    return (Ali.list as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }
}
