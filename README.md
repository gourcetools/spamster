# <b>SPAMSTER</b><br>
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)<br>





<img src="https://img.shields.io/badge/Tested%20under-Ubuntu%2022.04.1%20LTS-orange"><br>
<img src="https://img.shields.io/badge/Tested%20under-W10%20Pro%20WSL%20Ubuntu%2022.04.1%20LTS-blue">
<br><br>
<img src="https://img.shields.io/badge/License-MIT-orange.svg"><br>


# Done:
- [x] 🧅 Use tor for spamming 
- [x] 📡 Download relays list
- [x] 🏓 Ping relays list 
- [x] 📈 Benchmark relays
- [x] 🔑 Create accounts for each name in config/name-list.txt 
- [x] 📁 Create a `nostr.json` with all names and pubkeys. | `NIP-05`
- [x] 📨 Send the `nostr.json` to `youraccount.github.io/.well-known/nostr.json`
- [x] ℹ️ Update all accounts informations with `name@domain.tld` | `KIND: 0`
- [x] ℹ️ Update all accounts informations with username,fixed image of a cat and fixed bio. | `KIND: 0`
- [x] 🫂 Make all accounts follow each others | `KIND: 3`
- [x] 📢 Spam public feed in parallel | `KIND: 1`
- [x] 🧅 Spam public feed using tor in parallel (one exit IP per instance) | `KIND: 1 `
- [x] ⬆️  Save configuration 
- [x] ⬇️  Load configuration
- [x] 🗑 Reset

# Todo:
- [ ] Spam in dm
- [ ] Spam in channels
- [ ] Spam `custom KIND`
- [ ] Spam public channels creation 
- [ ] Spam recommand relay 
- [ ] Multi-Spam
- [ ] React and reply
- [ ] Reply
- [ ] Create random names lists with first and last name
- [ ] Create random bio for each name with OPENAI
- [ ] React and reply with OPENAI
- [ ] Use tor to get relays list
- [ ] Use tor to ping relays list
- [ ] Use tor to benchmark relays list
- [ ] Use tor to broadcast profile info  | `KIND: 0`
- [ ] Use tor to broadcast follow list  | `KIND: 3`
- [ ] Change benchmark for something more agressive.
- [ ] Engagement farm with OPENAI




# Problems:

- Tor dont stop on close. So you have to stop all tors manually.
- As far as i understand, this whole repo could be almost one script with functions, but because i'm really bad at this: its' not.


# <b>🍩 What is Spamster?</b><br>
<br>
<b>Spamster is a bash toolbox made for nostr spamming.</b><br>
Spamster is for testing relays and spam filters.<br>
<br>

# <b>⚙️ Requirements:</b><br>

- `nostr-tool` : https://github.com/0xtrr/nostr-tool
- `nostril` : https://github.com/jb55/nostril
- `clust` : https://github.com/vinliao/clust
- `nostcat` : https://github.com/blakejakopovic/nostcat

as well as: 
`sed` `jq` `truncante` `awk` `git` `curl`


<br>

# <b>✔️ How to use Spamster?</b><br>

- `git clone https://github.com/gourcetools/spamster`
- `cd ./spamster`
- `cd ./config`
- Edit `message-list.txt` with your messages - one per line.
- Edit `names-list.txt` and do the same. 
- For relay if you want to set a custom relay edit `relays-list.txt` 
- `cd ..`
- `./SPAMSTER.sh` to open the menu. 

# For a quick try:<br>
- Download relay list (D) (skip this if you set a custom relay before)
- Generate keys (K)
- Start spamming




 <img src="https://user-images.githubusercontent.com/120996278/217899237-62d0bf25-8417-44c8-9730-7f452d2d7a0b.png" alt="Combined" width="500px">  <br>
 <img src="https://user-images.githubusercontent.com/120996278/217901199-305644a8-7c8f-4358-9388-614668983900.png" alt="Combined" height="70px">
 <img src="https://user-images.githubusercontent.com/120996278/217901110-887bfb88-a1ad-4ab7-8e3c-23424afb1eb3.png" alt="Combined" height="70px"> <br>
 <img src="https://user-images.githubusercontent.com/120996278/217404959-b4d81910-6f8b-404c-a0e2-f5519bdcc391.png" alt="Combined" width="500px"> <br> 







<br> <br>
<br>
# 🙋‍♂️ Need help? <br> 
 <b>Telegram:</b> https://t.me/bitpaint<br>
<b>Twitter:</b> https://twitter.com/bitpaintclub<br>
<b>Nostr:</b><br>
npub1qqqqqhxytpngrtvw0a9h2sm0k7gykr35lurjhv6qdhdeqgnd064swghgx4<br>
gourcetools@gourcetools.github.io



