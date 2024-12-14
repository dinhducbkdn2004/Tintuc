package utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {
  public static String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt(12));
  }

  public static boolean checkPassword(String plaintext, String hashed) {
    return BCrypt.checkpw(plaintext, hashed);
  }
}