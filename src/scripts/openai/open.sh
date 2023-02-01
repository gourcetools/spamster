APIKEY="KEY"
echo " "
echo " ================== 	"
echo " 👋 HEY ITS ME,  	"
echo " 🧠 BIG BRAIN BOT	"
echo " ================== 	"
echo " What can I do? 		"

read PROMPT

curl -s https://api.openai.com/v1/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $APIKEY" \
-d "{\"model\": \"text-davinci-003\", \"prompt\": \"$PROMPT\", \"temperature\": 1, \"max_tokens\": 1000}" \
| jq -r '.choices[0].text' | tr -d '\n' > reply.txt

cat "./reply.txt"
echo " "
