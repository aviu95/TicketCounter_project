package en_decrypt;

public class SimpleSecurity 
{

	public String en_de_crypt(String pass)
	{
		String enc = "";
		char change;		
		for (int i = 0; i < pass.length(); i++) {
			change = pass.charAt(i);
			change = (char) (1 + (int) change);
			enc = enc + change;
		}
		return enc.trim();		
	}

}
