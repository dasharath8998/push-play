import 'package:flutter/material.dart';
import 'package:pushplay/data/network/api_helper.dart';
import 'package:pushplay/model/common_model.dart';

/// All the webservice calls are listed and implemented here so we don't need to find the perticuler dart file and can just check this file only
/// Some common setups made here to handling them based on call type and response customizations
/// for get requests , we need to observe the string concat on url [endpoint?limit=$LIMIT] and so on
class WebServices {
  BuildContext mContext;
  final ApiBaseHelper _helper = ApiBaseHelper();

  WebServices(this.mContext);

  CommonModel? commonParse(dynamic response) {
    try {
      var apiResponse = CommonModel.fromJson(response);
      // if (apiResponse.status) {
      return apiResponse;
      // } else {
      //   return null;
      // }
    } catch (e) {
      print('error on parsing common');
      return null;
    }
  }

  /// Getting the list of the companies. Based on the requirements we can pass the params
  /// i.e. here the limit is 10 by default but if you want all or n number data you can change
  // Future<dynamic> getCompanyList(BuildContext context,
  //     {String limit = '10',
  //     required int pageNo,
  //     String search = '',
  //     String searchColumns = '',
  //     String? companyId,
  //     String from = '',
  //     String to = '',
  //     bool? isActive,
  //     bool isSearchPage = false,
  //     String sort = APIParams.createdAt,
  //     String sortOrder = '0'}) async {
  //   try {
  //     String url = ApiConstants.companies +
  //         '?limit=$limit&page_no=$pageNo&search=$search&sort_by=$sort&${APIParams.companyId}=${companyId ?? ''}&is_active=$isActive&sort_order=$sortOrder&search_columns=$searchColumns&from=$from&to=$to&columns=${isSearchPage ? UtilsFunction.companyList.join(',') : ''}';
  //     var response = await _helper.get(context, url);
  //     CommonModel? result = commonParse(response);
  //
  //     if (result?.status ?? false) {
  //       return CompanyListModel.fromJson(response['data']);
  //     } else {
  //       return result;
  //     }
  //   } catch (e) {
  //     log('WebService ===> Exception :: $e');
  //   }
  //   return null;
  // }

  ///Method used to create the ticker , new ticker model should be passed
  // Future<dynamic> createTicker(TickerModel ticker) async {
  //   try {
  //     final response =
  //         await _helper.post(mContext, ApiConstants.ticker, jsonEncode(ticker.toJson()));
  //     CommonModel? result = commonParse(response);
  //
  //     return result;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /// Add, update the shortcut for anthem homepage
  // Future<dynamic> getShortcuts(String locationID) async {
  //   try {
  //     String url = '?${APIParams.locationId}=$locationID';
  //     final response = await _helper.get(mContext,
  //         ApiConstants.homepageItems + url);
  //     CommonModel? result = commonParse(response);
  //     if (result?.status ?? false) {
  //       return HomeWidgetListModel.fromJson(response);
  //     } else {
  //       return result;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /// Method used to Get the logged In responsibilities of current user
  // Future<dynamic> getLoggedInUserResponsibilities() async {
  //   try {
  //     final response = await _helper.get(
  //         mContext, ApiConstants.loggedInUserResponsibilities);
  //     CommonModel? result = commonParse(response);
  //     if (result?.status ?? false) {
  //       return LoggedInUserResponsibilitiesModel.fromJson(response);
  //     } else {
  //       return result;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
