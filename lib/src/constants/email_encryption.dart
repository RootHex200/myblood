class EmailEncryption {
 

  encryptedEmail(String email) {
    int atIndex = email.indexOf("@");
    String localPart = email.substring(0, atIndex);
    String domainPart = email.substring(atIndex);
    String firstThree = localPart.substring(0, 3);
    String maskedLocalPart = firstThree +
        "*" * (localPart.length - 5) +
        localPart.substring(localPart.length - 2);
    String maskedEmail = maskedLocalPart + domainPart;
    return maskedEmail;
  }
}
