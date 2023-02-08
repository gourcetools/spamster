# <b>SPAMSTER</b><br>
<img src="https://img.shields.io/badge/Tested%20under-Ubuntu%2022.04.1%20LTS-orange"> <img src="https://img.shields.io/badge/Tested%20under-W10%20Pro%20WSL%20Ubuntu%2022.04.1%20LTS-blue"><br>
<img src="https://img.shields.io/badge/License-MIT-orange.svg"> <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/gourcetools/spamster"> <br>
<img src="https://img.shields.io/github/issues/gourcetools/spamster"> <img alt="GitHub closed issues" src="https://img.shields.io/github/issues-closed/gourcetools/spamster">
<br>
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/gourcetools/spamster"> <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/y/gourcetools/spamster"> <br>
<img alt="GitHub repo file count" src="https://img.shields.io/github/directory-file-count/gourcetools/spamster"> <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/gourcetools/spamster">

- [x] 📡 Download relays list
- [x] 🏓 Ping relays list 
- [x] 📈 Benchmark relays
- [x] 🔑 Create accounts for each name in config/name-list.txt 
- [x] 📁 Create a nostr.json with all accounts in it. | NIP-05
- [x] Send the nostr.json to github.
- [x] ℹ️ Update all accounts informations with NIP-05 domain | KIND 0
- [x] ℹ️ Update all accounts informations with username,image,and bio | KIND 0
- [x] 🫂 Make accounts follow each others | KIND 3
- [x] 📢 Spam public feed in parallel | KIND 1 
- [x] Spam public feed using tor in parallel (one exit IP per instance) | KIND 1 

- [ ] Spam in dm
- [ ] Spam in channels
- [ ] React and reply
- [ ] React and reply with OPENAI


# <b>🍩 What is Spamster?</b><br>
<br>
<b>Spamster is a toolbox made for nostr spamming.</b><br>
Spamster is for testing relays and spam filters.<br>
<br>

# <b>⚙️ Requirements:</b><br>

- `nostr-tool` : https://github.com/0xtrr/nostr-tool
- `nostril` : https://github.com/jb55/nostril
- `clust` : https://github.com/vinliao/clust
- `nostcat` : https://github.com/blakejakopovic/nostcat

as well as: 
`sed` `jq` `truncante` `awk` `git` `curl`


... todo: complete this  <br>
<br>

# <b>✔️ How to use Spamster?</b><br>
1) 📜  Open <b>config</b> and replace </b>message-list.txt</b> with your messages - one per line.<br>
2) 🧰  Open <b>names-list.txt</b> and do the same, for names. <br>
3) ⌛  $ ./START.sh to open the menu. From here you can start messaging or generate nip05 names using:<br>
- 1 generate keys
- 2 make nostr.json
4) 😃  You should be able to <b>upload</b> nostr.json to your website now. <b>location of nostr.json is /src/json </b> everything is already broadcasted to nostr relays. </b> 

<br> <br>
<br>
🙋‍♂️ Need help? Telegram: <b>@bitpaint</b> | Twitter: <b>@bitpaintclub<br></b>




 <img src="https://user-images.githubusercontent.com/120996278/216779614-0ffc2b29-5cc0-4e4c-80a7-cd18771efa84.png" alt="Combined" width="500px">  <br>
 <img src="https://user-images.githubusercontent.com/120996278/216779746-7a46dade-7625-4d97-b61b-e0ac1473786a.png" alt="Combined" width="350px">
 <img src="https://user-images.githubusercontent.com/120996278/216779776-3a5fa1a5-421f-43a6-8359-0ef904bfd701.png" alt="Combined" width="350px"> <br>
 <img src="https://user-images.githubusercontent.com/120996278/216779835-2e9b6563-b44e-4d3e-a1d4-9399c07075f0.png" alt="Combined" width="500px"> <br> 

