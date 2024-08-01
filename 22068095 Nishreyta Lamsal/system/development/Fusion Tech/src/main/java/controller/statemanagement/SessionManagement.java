package controller.statemanagement;

public class SessionManagement {

	public Boolean checkUser(String userSession){
    	if(userSession != null && !userSession.isEmpty()) return true;
    	else return false;
    }
}
