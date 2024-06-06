package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ApplicationAware, SessionAware, RequestAware{
//	private final static Logger Log = Logger.getInstance(BaseAction.class)
	
	protected Map session;
	protected Map request;
	protected Map application;
	
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public Map getRequest() {
		return request;
	}
	public void setRequest(Map request) {
		this.request = request;
	}
	public Map getApplication() {
		return application;
	}
	public void setApplication(Map application) {
		this.application = application;
	}
	
	public HttpServletRequest getRequestServ() {
		return ServletActionContext.getRequest();
	}
	
	public HttpServletResponse getResponseServ() {
		return ServletActionContext.getResponse();
	}
	
	public HttpSession getSessionServ(Boolean type) {
		HttpSession session = null;
		if(type == null) {
			session = getRequestServ().getSession();
		}else {
			session = getRequestServ().getSession(type);			
		}
		return session;
	}
}
