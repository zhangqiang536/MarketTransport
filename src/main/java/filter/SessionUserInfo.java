package filter;

import java.util.Date;
import java.util.List;

import com.wanDa.dto.UserSimpleDto;
import com.wanDa.model.WUser;

/** 
 * 用户身份权限类 
 *  
 * @author administrator
 *  
 */  
public class SessionUserInfo {  
    private WUser wUser;  
    private Date loginTime;  
    private Date lastActive;  
    private String ip;  
    private Integer type;//用户类型：0：商户联系人，1：开发商联系人,2：商户企业账号,3：开发商企业账号,4：初始联系人,5：运营人员
    
	public SessionUserInfo(String ip,WUser wUser) {  
        lastActive = loginTime = new Date();  
        this.ip = ip;  
        this.wUser = wUser;
        refreshRoles(wUser);  
    }  

	public WUser getwUser() {
		return wUser;
	}

	public void setwUser(WUser wUser) {
		this.wUser = wUser;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public void setLastActive(Date lastActive) {
		this.lastActive = lastActive;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	  
    public Date getLoginTime() {  
        return loginTime;  
    }  
  
    public Date getLastActive() {  
        return lastActive;  
    }  
  
    public String getIp() {  
        return ip;  
    }  
  
    private void refreshRoles(WUser wUser){  
/*        userSimpleDto.getRoles().clear();  
        roles = UserManageService.getInstance().getRoles();  */
    }  
  
    public void notifyActive() {  
        lastActive = new Date();  
    }  
    
    public void notifyLogin(WUser wUser) {  
/*    	if (!userDto.hasLogin())  
    		return;  
    	this.userSimpleDto = new UserSimpleDto();
    	
    	loginTime = new Date();  
    	UserManageService.getInstance().registerLogin(userDto.getUserName(), this);  
    	refreshRoles();  */
    }  
  
    public void notifyLogout() {  
/*        UserManageService.getInstance().unregisterLogin(userSimpleDto.getName());  
        userSimpleDto.notifyLogout();  
        loginTime = null;  
        refreshRoles();  */
    }  
  
/*    public boolean hasThisRole(Integer roleId) {  
        return roles.contains(roleId);  
    }  
   */
    @Override  
    public int hashCode() {  
        if (wUser.getUserName() == null)  
            return -1;  
        return wUser.getUserName().hashCode();  
    }  
  
}  
