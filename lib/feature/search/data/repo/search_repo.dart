import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:ecommerce_app/feature/search/data/data_source/search_remote.dart';

class SearchRepo {
  SearchRepo({SearchRemote? remote}) : _remote = remote ?? SearchRemote();

  final SearchRemote _remote;

  Future<List<ProductModel>> search(String term) async {
    try {
      return await _remote.search(term);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
