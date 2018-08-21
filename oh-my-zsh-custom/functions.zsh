samba(){
  command_text="token=$1&team_id=T0001&team_domain=example&channel_id=C2147483705&channel_name=test&user_id=U2147483697&user_name=Rocky&command=/$2&text=$3&response_url=https://hooks.slack.com/commands/1234/5678"

  docker run --rm -e hfa_prod_user=$H_DBP_USER -e hfa_prod_password=$H_DBP_PASS -v "$PWD":/var/task lambci/lambda:python3.6 app.lambda_handler "{\"body\": \"$command_text\"}"
}
