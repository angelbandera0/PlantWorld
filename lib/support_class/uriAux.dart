
class UriAux{
  List<String> fragmentUrl(String url)=>(Uri.dataFromString(url).pathSegments);

  Map<String, String> parametersUrl(String url)=>(Uri.dataFromString(url).queryParameters);
}