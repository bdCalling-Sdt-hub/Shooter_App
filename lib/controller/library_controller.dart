import 'package:get/get.dart';
import 'package:shooter_app/model/document_model.dart';
import 'package:shooter_app/model/photo_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

class LibraryController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPhoto();
    getDocument();
  }


  RxList<PhotoModel> photoLists = <PhotoModel>[].obs;
  RxBool photoLoading = false.obs;

  getPhoto()async{
    photoLoading(true);
    var response = await ApiClient.getData(ApiConstant.getPhoto);
    print("=======>>photo ${response.body}");
    if(response.statusCode == 200){
      photoLists.value = List<PhotoModel>.from(response.body['data']['attributes'].map((e)=> PhotoModel.fromJson(e)));

      photoLoading(false);
    }
  }



  ///========================get document====================>

  RxList<DocumentModel> documentLists = <DocumentModel>[].obs;
  RxBool documentLoading = false.obs;

  getDocument()async{
    documentLoading(true);
    var response = await ApiClient.getData(ApiConstant.getDocuments);

    print("=======>>document ${response.body}");
    if(response.statusCode == 200){
      documentLists.value = List<DocumentModel>.from(response.body['data']['attributes'].map((e)=> DocumentModel.fromJson(e)));

      documentLoading(false);
    }
  }
}