
class Connection{
  String connectivityResultNetwork;
  bool isOnline;
  Connection(){
    this.connectivityResultNetwork="none";
    this.isOnline=false;
  }
  Connection.withNetwork(this.connectivityResultNetwork,this.isOnline);

}