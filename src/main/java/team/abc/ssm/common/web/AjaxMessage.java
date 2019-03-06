package team.abc.ssm.common.web;

public class AjaxMessage {

    private String code;
    private Object data;
    private String message;

    public AjaxMessage Set(MsgType msgType, Object data, String message){
        this.code = msgType.toString().toLowerCase();
        this.data = data;
        this.message = message;
        return this;
    }

    public AjaxMessage Set(MsgType msgType, Object data){
        this.code = msgType.toString().toLowerCase();
        this.data = data;
        this.message = "";
        return this;
    }

    public AjaxMessage Set(MsgType msgType){
        this.code = msgType.toString().toLowerCase();
        this.data = "";
        this.message = "";
        return this;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
