dir;
Add-Type -AssemblyName PresentationCore,PresentationFramework
$msgBody = “All of your important documents have been encrypted. Pay the ransom… or else!!!”
[System.Windows.MessageBox]::Show($msgBody)
