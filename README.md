# WORK IN PROGRESS.
tested with Ubuntu 22.04.1 LTS <br>
tested with Windows 10 Pro by using WSL Ubuntu 22.04.1 LTS <br>
tested with Windows 10 Pro : multi-sending wont work because it use gnome terminal emulator. use WSL under Windows10 if you want multi-sending. <br>
you can find bins you may need here: (use ubuntu folder and copy bins to wsl bin folder) windows bin are for testing.

#Spamster                         
<br>
<img src="https://img.shields.io/badge/License-MIT-orange.svg"> <br> <br>
<img src="https://user-images.githubusercontent.com/120996278/213299682-2d88452d-76d2-4ce0-8e34-c060c0e89612.png"><br>


https://github.com/gourcetools/nostr-exe/  <br>

# <b>🍩 What is Spamster?</b><br>
<br>
<b>Spamster is a toolbox made for nostr spamming.</b><br>
It's main purpose it to download <b>multiple</b> relays list, create nip-05 pubkeys, combine them into one big file called `nostr.json` and of course use thoses accounts to send messages over nostr. <br>
It's specially usefull for testing relays and spam filters.<br>
<br>

# <b>⚙️ Requirements:</b><br>
nostr-tool  nostril truncante
- `nostr stuff` ... todo: complete this  <br>
<br>

# <b>✔️ How to use Spamster?</b><br>
1) 📜  Open <b>config</b> and replace </b>message-list.txt</b> with your messages - one per line.<br>
2) 🧰  Open <b>names-list.txt</b> and do the same, for names. <br>
3) ⌛  $ ./START.sh to open the menu. From here you can start messaging or generate nip05 names using:<br>
- 1 generate keys
- 2 make nostr.json
4) 😃  You should be able to <b>upload</b> nostr.json to your website now. <b>location of nostr.json is /src/json </b> everything is already broadcaster to nostr relays. </b> WARNING: THIS IS ACTUALLY HARDCODED WITH GOURCETOOLS.GITHUB.IO AS DOMAIN. FIX SOON
<br>

<br> <br>
<br>
🙋‍♂️ Need help? Telegram: <b>@bitpaint</b> | Twitter: <b>@bitpaintclub<br></b>
