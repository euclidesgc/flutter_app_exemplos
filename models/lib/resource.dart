class Resource<T> {
  ResourceStateEnum stateEnum;
  String message;
  T data;

  Resource({this.stateEnum, this.message, this.data});

  getStatusEnum() {
    return stateEnum;
  }

  setStatusEnum(status) {
    stateEnum = status;
  }

  getMessage() {
    return message;
  }

  setMessage(msg) {
    message = msg;
  }

  getData() {
    return data;
  }

  setData(data) {
    this.data = data;
  }
}

enum ResourceStateEnum {  SUCCESS, ERROR,  NONE}
