package loginSignupForgotControler;

public class ServiceValidate {

	public boolean emailvalidate(String email)
	{
		String emailregex = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]+)$";
		Boolean bo = email.matches(emailregex);
		return bo;
	}
	public boolean userValidate(String name)
	{
		for (int i = 0; i < name.length(); i++) {
			System.out.println(i + " " + name.charAt(i));
			if (!(Character.isLetter(name.charAt(i)) || Character
					.isDigit(name.charAt(i)))) {
				System.out.println("enter");
				return false;
			}
		}
		
		return true;
	}
	
}
