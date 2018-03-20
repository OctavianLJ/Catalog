package jdbc.access;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckCharacters {

	public boolean checkForSpecialCharacter(String s) {

		Pattern allowedCharacters = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = allowedCharacters.matcher(s);
		boolean isSpecialCharacter = m.find();
		return isSpecialCharacter;
	}

	public boolean passwordIsValid(String newPassword, String confirmedNewPassword, List<String> error) {
		boolean isValid = false;
		Pattern specialChars = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Pattern upperCaseChars = Pattern.compile("[A-Z ]");
		Pattern lowerCaseChars = Pattern.compile("[a-z ]");
		Pattern digitCaseChars = Pattern.compile("[0-9 ]");

		if (newPassword.length() < 8) {
			error.add("The password must have at least 8 or more characters!");
		} else if (!specialChars.matcher(newPassword).find()) {
			error.add("The password must contain at least one special character!");
		} else if (!upperCaseChars.matcher(newPassword).find()) {
			error.add("The password must contain at least one upper-case character!");
		} else if (!lowerCaseChars.matcher(newPassword).find()) {
			error.add("The password must contain at least one lower-case character!");
		} else if (!digitCaseChars.matcher(newPassword).find()) {
			error.add("The password must contain at least one digit character!");
		} else if (!newPassword.equals(confirmedNewPassword)){
			error.add("The new password does not match the confirmed new password!");
		} else {	
			isValid = true;
		}
		return isValid;
	}

}
