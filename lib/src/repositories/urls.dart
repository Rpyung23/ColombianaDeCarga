import '../constants.dart';

final String mainUrl = "https://colombianadecarga.4plbox.com/api";
//final String mainUrl = "https://casillerodemo.4plbox.com";
final String getAllDocumentUrl = "$mainUrl/getAllWarehouse";
final String searchDocumentUrl = "$mainUrl/rastreo/getStatusReport";
final String getDocumentDetailUrl = "$mainUrl/getWarehouse";
final String getAllPrealertUrl = "$mainUrl/getAllPrealert/$agencyId";
final String savePrealertUrl = "$mainUrl/setPrealert";
final String loginUrl = "$mainUrl/auth/login";
final String updateTokenFirebaseUrl = "$mainUrl/appMovil/updateAppMovilClient";
final String registroEmailSocial = "$mainUrl/appMovil/createUser";
final String registroEmailFormulario = "$mainUrl/appMovil/createLocker";
final String loginUrlv2 = "$mainUrl/appMovil/auth/login";
final String checkUrlEmail = "$mainUrl/appMovil/verifyRegister";
final String citys = "$mainUrl/getSelectCity";
final String getProfileUser = "$mainUrl/appMovil/getDataProfileById";
final String updateProfileUserUrl = "$mainUrl/appMovil/updateProfile";
final String checkProfileCompleteUrl = "$mainUrl/appMovil/verifyDataProfile";
