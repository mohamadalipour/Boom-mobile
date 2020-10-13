

abstract class JsonParser<T> {
  T fromJson(Map<String, dynamic> json);
}

 class BaseModelList<T extends JsonParser>{
  List<T> data;
  BaseModelList.fromListResponse(List<dynamic> res,T instance){
    if(res!=null && res.isNotEmpty) {
      data=[];
      res.forEach((e) {
        data.add(instance.fromJson(e));
      }
      );
    }
    else
      data=[];
  }
}