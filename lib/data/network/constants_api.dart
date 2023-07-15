import 'dart:developer';

import 'package:flutter/cupertino.dart';

///API Constants initialized here . i.e. endpoints param names
abstract class ApiConstants {
  static const String stagingRes = '222222';
  static const String prodRes = '';

  static String baseURL = EnvDev.baseUrl;
  static String apiKey = EnvDev.apiKey;
  static String deviceApiKey = EnvDev.deviceApiKey;
  static String reservationPrefix = EnvDev.resId;
  static String baseURLSendInvite = EnvDev.baseUrlSendInvite;

  static const String envProd = "production";
  static const String envStaging = "staging";
  static const String envDev = "development";

  static const String movies = "v1/ppv_movie_listing/?page=movies";
  static const String widgets = "v1/widgets";
  static const String apps = "v1/apps";
  static const String locationApps = "v2/homepage_item/location_apps";
  static const String blockedApp = "v2/blocked_apps";
  static const String app = "v1/app";
  static const String shortcuts = "v1/shortcuts";
  static const String shortcut = "v1/shortcut";
  static const String uploadIcon = 'device/v1/upload';
  static const String companies = "v1/companies";
  static const String codeCheck = "v1/location/codecheck";
  static const String locations = "v1/locations";
  static const String themes = "v1/themes";
  static const String groups = "v1/groups";
  static const String alerts = "v1/alerts";
  static const String alert = "v1/alert";
  static const String ticker = "v1/ticker";
  static const String tickers = "v1/tickers";
  static const String screens = "v1/screens";
  static const String roles = "v1/roles";
  static const String allRoles = "v1/all_roles";
  static const String addUsers = "v1/users";
  static const String updateUser = "v1/user";
  static const String inviteUser = "v1/invite_user";
  static const String emailCheck = "v1/email_check";
  static const String currentUser = "v1/user";
  static const String users = "v1/all_users";
  static const String company = "v1/company";
  static const String group = "v1/group";
  static const String changeStatusCompany = "v1/company/changestatus";
  static const String changeStatusGroup = "v1/group/changestatus";
  static const String preDeleteGroup = "v1/group/predelete";
  static const String changeStatusLocation = "v1/location/changestatus";
  static const String changeStatusAlert = "v1/alert/changestatus";
  static const String archiveAlert = "v1/alert/archive";
  static const String changeStatusTicker = "v1/ticker/changestatus";
  static const String verification = "v1/user/verification";
  static const String changeStatusUser = "v1/user/activate";
  static const String changeStatusTheme = "v1/theme/changestatus";
  static const String theme = "v1/theme";
  static const String upload = "v1/upload";
  static const String location = "v1/location";
  static const String homepageItems = "v2/homepage_items";
  static const String deleteHomepageItem = "v2/homepage_item";
  static const String roleResponsibilities = "v1/user_responsibilities";
  static const String meta = "v1/meta";
  static const String metaCompany = "v2/meta?page=company";
  static const String pageInterface = "page=interface";
  static const String mapsAutocomplete = "v1/maps_autocomplete";
  static const String placeDetails = "v1/place_details";
  static const String clearData = "v1/clearData";
  static const String locationBackground = "v1/location_background";
  static const String resetDeviceAck = "v1/resetdeviceack";
  static const String resetDevice = "v1/resetdevice";
  static const String locationTc = "v1/location_tc";
  static const String logsExport = "v1/logs/export";
  static const String logsList = "v1/logs/list";

  static const String reportLocationsV2 = "v2/meta?page=company_location";
  static const String optimizeLocationsForFilter = "v1/meta?page=location";
  static const String optimizeGroupsForFilter = "v1/meta/groups";
  static const String dashboardData = "v1/dashboard";
  static const String alertData = "v1/alert_dashboard";
  static const String alertsDbGraph = "v1/alert_dashboard_graph";
  static const String getHome = "v1/avis_mock?page=home";
  static const String KEY = 'AIzaSyBXGspNEX6jwO_sWEQWtwz6TRAx_3Q0juI';

  static const String loggedInUserResponsibilities = "v2/loggedin_user_responsibilities";
}

abstract class APIParams {
  static const String background = "background";
  static const String lockScreen = "lock_screen";
  static const String alertId = "alert_id";
  static const String tickerId = "ticker_id";
  static const String userToken = "userToken";
  static const String companyId = "company_id";
  static const String locationId = "location_id";
  static const String widgets = "widgets";
  static const String shortcuts = "shortcuts";
  static const String shortcutId = "shortcut_id";
  static const String homepageItemId = "homepage_item_id";
  static const String apps = "apps";
  static const String appId = "app_id";
  static const String themeId = "theme_id";
  static const String groupId = "group_id";
  static const String userId = "user_id";
  static const String deviceId = "device_id";
  static const String email = "email";
  static const String code = "code";
  static const String emailId = "email_id";
  static const String baseUrl = "base_url";
  static const String isVerified = "is_verified";
  static const String password = "password";
  static const String company = "company";
  static const String group = "group";
  static const String role = "role";
  static const String theme = "theme";
  static const String branding = "branding";
  static const String name = "name";
  static const String tickerCount = "ticker_count";
  static const String location = "location";
  static const String users = "users";
  static const String id = "id";
  static const String origin = 'origin';
  static const String brand = 'brand';
  static const String destination = 'destination';
  static const String tripType = 'trip_type';
  static const String endDate = 'end_date';
  static const String rentalStatus = 'rental_status';
  static const String checkedInLocation = 'checked_in_location';
  static const String manufacturer = 'manufacturer';
  static const String locationName = 'location_name';
  static const String model = 'model';
  static const String osVersion = 'os_version';
  static const String roomNumber = 'room_number';
  static const String roleType = "role_type";
  static const String isActive = "is_active";
  static const String isCompanyBlocked = "is_company_blocked";
  static const String package = "package";
  static const String componentName = "component_name";
  static const String isDeleted = "is_deleted";
  static const String title = "title";
  static const String description = "description";
  static const String subtitle = "subtitle";
  static const String allDay = "all_day";
  static const String startDate = "start_date";
  static const String locations = "locations";
  static const String groups = "groups";
  static const String screens = "screens";
  static const String createdAt = "created_at";
  static const String createdBy = "created_by";
  static const String type = "type";
  static const String isOnetime = "is_onetime";
  static const String start = "start";
  static const String interfaceName = "interface_name";
  static const String address = "address";
  static const String city = "city";
  static const String state = "state";
  static const String zip = "zip";
  static const String firstName = "first_name";
  static const String lastName = "last_name";
  static const String phone = "phone";
  static const String schedule = "schedule";
  static const String status = "status";
}

/// Environment configurations :: For different kind of environment keys and urls
abstract class EnvProd {
  static const String baseUrl = 'https://launchpad-api.edisoninteractive.com/admin/';
  static const String resId = '333333';
  static const String apiKey = 'AIzaSyBtVSy8vsdX9EPgjP5rX7oJ-7a00m3a_xU';
  static const String deviceApiKey = 'AIzaSyCJv0AbsDCIWUcYyus-Uj4p9jZ7cH34q5w';
  static const String baseUrlSendInvite = 'https://lp-mec-prod.firebaseapp.com/';
}

abstract class EnvDev {
  static const String baseUrl =
      'https://launchpad-dev-api.edisoninteractive.com/admin/';
  static const String resId = '111111';
  static const String apiKey = 'AIzaSyAXuffowTt4XsV3CS7oSpNgRJj8TFV--K4';
  static const String deviceApiKey = 'AIzaSyBW8z-pN1xXUhACvaKfbayCyRqPuJInH30';
  static const String baseUrlSendInvite = 'https://dev-mec-launchpad.firebaseapp.com';
}

abstract class EnvStaging {
  static const String baseUrl =
      'https://launchpad-staging-api.edisoninteractive.com/admin/';
  static const String resId = '222222';
  static const String apiKey = 'AIzaSyBdRD1TKisw_BDYwJMc_JCri7mUfzyew8o';
  static const String deviceApiKey = 'AIzaSyBG6jOyy2kk_pipHOtNgIl3xB9g6-WxDec';
  static const String baseUrlSendInvite = 'https://staging-mec-launchpad.firebaseapp.com';
}

class ConfigEnv {
  BuildContext context;
  String env = const String.fromEnvironment('environment');

  ConfigEnv(this.context);

  /// this method will pull the selected setup accordingly and change the API constants for the environment based keys and urls
  void configEnv() async {
    log('This is ' + env + ' Environment');
    if (env == ApiConstants.envProd) {
      ApiConstants.baseURL = EnvProd.baseUrl;
      ApiConstants.reservationPrefix = EnvProd.resId;
      ApiConstants.apiKey = EnvProd.apiKey;
      ApiConstants.deviceApiKey = EnvProd.deviceApiKey;
      ApiConstants.baseURLSendInvite = EnvProd.baseUrlSendInvite;
    } else if (env == ApiConstants.envStaging) {
      ApiConstants.baseURL = EnvStaging.baseUrl;
      ApiConstants.reservationPrefix = EnvStaging.resId;
      ApiConstants.apiKey = EnvStaging.apiKey;
      ApiConstants.deviceApiKey = EnvStaging.deviceApiKey;
      ApiConstants.baseURLSendInvite = EnvStaging.baseUrlSendInvite;
    } else {
      ApiConstants.baseURL = EnvDev.baseUrl;
      ApiConstants.reservationPrefix = EnvDev.resId;
      ApiConstants.apiKey = EnvDev.apiKey;
      ApiConstants.deviceApiKey = EnvDev.deviceApiKey;
      ApiConstants.baseURLSendInvite = EnvDev.baseUrlSendInvite;
    }
  }
}
