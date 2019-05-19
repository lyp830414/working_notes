#!/bin/bash
#set -e

##################################################################################

g_arr=()
#--wallet-url http://10.101.2.69:8900, only for account bpay

G_config='{
	"G_base_info": {
		"cli_path":"/root/lyp_baic_chain/Baic-Chain/build/programs/baic_cli",
		"data_path":"/root/lyp_baic_chain/Baic-Chain/build/programs/nodeos/lypdata",
		"wallet_url":"http://127.0.0.1:20188", 
		"baic_cli":"baic_cli --wallet-url http://127.0.0.1:20188 --url http://127.0.0.1:20188"
	},
	"G_account_info": {
				"baic":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.token":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.dusd":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.msig":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.sudo":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.high":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.pool":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.vpay":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.stake":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.saving":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.ram":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.ramfee":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.names":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.bpay":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"baic.names":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"testa":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"testb":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					},
				"testc":{
						"owner_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"owner_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"act_pri_key":"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
						"act_pub_key":"BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
						"stake_net":"0.500000000 DUSD",
						"stake_cpu":"0.500000000 DUSD",
						"stake_ram":"7.500000000 DUSD"
					}
					
	},
	"G_transfer_info": {	
				"trans_a": {
						"from": "baic",
						"to":"testa",
						"contract":"baic.token",
						"amount":"1.000000000 DUSD"
					},
				"trans_b": {
						"from": "testa",
						"to":"testb",
						"contract":"testa",
						"amount":"1.000000000 TESTA"
					},
				"trans_c":{
						"from": "testb",
						"to":"testc",
						"contract":"testa",
						"amount":"1.000000000 TESTA"
					},
				"trans_d":{
						"from": "testa",
						"to":"testc",
						"contract":"testa",
						"amount":"1.000000000 TESTA"
					}
					
	},
	"G_publish_token_info": {
			"HEMP":{
				"issuer":"baic",
				"buyer":"hemp",
				"contract":"hemp",
				"contract_wasm":"/root/baic.token.wasm",
				"contract_abi":"/root/baic.token.abi",
				"need_buy_ram":{
					"need_or_not":true,
					"amount":"280.000000000 DUSD"
				},
				"need_earn_dusd":{
					"need_or_not":true,
					"amount":"3.000000000 DUSD"
				},
				"amount": "2000000.0000 HEMP"
			}
	}
}'

function get_json_info() {
	keyword=$1
	#echo "echo G_onfig|jq .$keyword"
	value=`echo "$G_config"|jq '.'$keyword''`
	#echo "key: $keyword"
	#echo "value: $value"
	
	value=${value//\"/}
	echo $value
}

#value=`echo ""|jq '.acc'`
#value=`echo ""|jq '."ac.c"'`

##########################   CONFIGURATION  END #####################################

#++++ sys_init ++++++++#
#++++ new_account +++++#
#++++ new_token   +++++#
#++++ issue_token +++++#
#++++ transfer    +++++#
#++++ get_account +++++#
#++++ get_transaction +++#
#++++ get_code_abi ++++#

# passed both in manual & conf

###########################    YOUR CHOICE    ###################################

#g_arr[${#g_arr[*]}]="sys_init"

g_arr[${#g_arr[*]}]="new_token TESTA"

#g_arr[${#g_arr[*]}]="new_account testb"
#g_arr[${#g_arr[*]}]="new_account testc"

#g_arr[${#g_arr[*]}]=new_token "HEMP"
#g_arr[${#g_arr[*]}]=transfer "trans_a"

#g_arr[${#g_arr[*]}]=new_token

#g_arr[${#g_arr[*]}]=transfer
#g_arr[${#g_arr[*]}]=get_account
#g_arr[${#g_arr[*]}]=get_transaction
#g_arr[${#g_arr[*]}]=get_code_abi

#g_arr[${#arr[*]}]=
#g_arr[${#arr[*]}]=
#g_arr[${#arr[*]}]=
#g_arr[${#arr[*]}]=

#################################################################################

walletpwd=""

owner_pub=""
owner_private=""
active_pub=""
active_private=""

wallet_path=`get_json_info "G_base_info.data_path"`
cli_path=`get_json_info "G_base_info.cli_path"`
baic_cli=`get_json_info "G_base_info.baic_cli"`



get_char()
{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
}

function base_new_wallet() {
	
	#rm -rf ~/baic-wallet/*.wallet

	user=$1
	echo "========================================"
	echo `./baic_cli wallet list|wc -l`
	echo "========================================"
	
	if [ -z $wallet_path ]; then
		echo "Please set your 'data_path' value where store your wallet file!"
		exit
	fi	
	
	echo "rm -rf $wallet_path/*.wallet"
	rm -rf $wallet_path/*.wallet

	#walletpwd=$G_wallet_password
	
	#if [ `$cli_path/./$baic_cli wallet list|wc -l` -le 2 ]; then
		echo "$cli_path/./$baic_cli wallet create > /tmp/wallet2.txt"
		$cli_path/./$baic_cli wallet create > /tmp/wallet2.txt
		walletpwd=`cat /tmp/wallet2.txt|awk 'END {print}'|sed 's/"//g'`
		#chmod 777 /tmp/wallet2.txt
	#elif [ -z $G_wallet_password ]; then
	#	if [ -s /tmp/wallet2.txt ]; then
	#		walletpwd=`cat /tmp/wallet2.txt|awk 'END {print}'|sed 's/"//g'`
	#	else
	#		echo
	#		echo "$cli_path/./$baic_cli wallet list"
	#		$cli_path/./$baic_cli wallet list
	#		echo "You must set your wallet password in 'G_wallet_password' value!"
	#		echo
	#		exit
	#	fi
	#fi
	
	echo "  !!!!!!!!!!!!!!!! password-->"$walletpwd

	
	user_owner_prvkey=$2
	user_active_prvkey=$3
	echo 
	echo "aaa:"
	echo "wallet import private keys for $user: $user_owner_prvkey and $user_active_prvkey"
	$cli_path/./$baic_cli wallet import --private-key $user_owner_prvkey 2>/dev/null
	echo "bbb"
	echo "!!!!"
	echo "$cli_path/./$baic_cli wallet import --private-key $user_active_prvkey"
	$cli_path/./$baic_cli wallet import --private-key $user_active_prvkey 2>/dev/null
	echo "cccc"
	echo "$cli_path/./$baic_cli wallet unlock --password $walletpwd 2>/dev/null"
	$cli_path/./$baic_cli wallet unlock --password $walletpwd 2>/dev/null

	echo "++++++++++++++++  WALLET  DONE ++++++++++++++++++"
	echo
}

function base_create_sys_accounts() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

	owner_key=`get_json_info "G_account_info.\"baic.dusd\".owner_pub_key"`
	act_key=`get_json_info "G_account_info.\"baic.dusd\".act_pub_key"`
	$cli_path/./$baic_cli create account baic baic.dusd $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.bpay\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.bpay\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.bpay $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.msig\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.msig\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic  baic.msig $owner_key $act_key

	owner_key=`get_json_info  "G_account_info.\"baic.names\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.names\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.names $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.ram\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.ram\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.ram $owner_key $act_key
	

	owner_key=`get_json_info  "G_account_info.\"baic.ramfee\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.ramfee\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.ramfee $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.saving\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.saving\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.saving $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.stake\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.stake\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.stake $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.token\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.token\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.token $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.vpay\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.vpay\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.vpay $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.sudo\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.sudo\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.sudo $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.high\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.high\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.high $owner_key $act_key
	
	owner_key=`get_json_info  "G_account_info.\"baic.pool\".owner_pub_key"`
	act_key=`get_json_info  "G_account_info.\"baic.pool\".act_pub_key"`
	$cli_path/./$baic_cli create account  baic baic.pool $owner_key $act_key
}

function base_set_sys_contracts() {
       	
	if [ -s baic.token.wasm ] || [ -s baic.dusd.wasm ] || [ -s baic.msig.wasm ] || [ -s baic.sudo.wasm ] || [ -s baic.token.high.wasm ] || [ -s baic.system.wasm ] \
	|| [ -s baic.token.abi ] || [ -s baic.dusd.abi ] || [ -s baic.msig.abi ] || [ -s baic.sudo.abi ] || [ -s baic.token.high.abi ] || [ -s baic.system.abi ]; then
		echo "Error! please check your system wasm and abi, they must be in current directory!"
	fi
	
	$cli_path/./$baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
	$cli_path/./$baic_cli set contract baic.token . ./baic.token.wasm ./baic.token.abi  -p  baic.token
	$cli_path/./$baic_cli set contract baic.dusd . ./baic.dusd.wasm ./baic.dusd.abi  -p  baic.dusd
	$cli_path/./$baic_cli set contract baic.msig . ./baic.msig.wasm ./baic.msig.abi  -p  baic.msig
	$cli_path/./$baic_cli set contract baic.sudo . ./baic.sudo.wasm ./baic.sudo.abi  -p  baic.sudo
	$cli_path/./$baic_cli set contract baic.high . ./baic.token.high.wasm ./baic.token.high.abi  -p  baic.high
	$cli_path/./$baic_cli set contract baic . ./baic.system.wasm ./baic.system.abi  -p  baic -x 1000
}

function init_base() {
	echo '==========base new wallet =================='
	owner_pri_key=`get_json_info "G_account_info.baic.owner_pri_key"`
	act_pri_key=`get_json_info "G_account_info.baic.act_pri_key"`
	base_new_wallet "baic" $owner_pri_key $act_pri_key
	sleep 1
	echo '==========base_create_sys_accounts=========='
	sleep 1
	base_create_sys_accounts
	echo '==========base_set_sys_contracts============'
	sleep 2
	base_set_sys_contracts
}

function raise_token() {
	issuer=$1
	max_supply=$2
	token_contract=$3

	echo "token_contract: $token_contract"

	
	param='{"issuer":"'$issuer'", "maximum_supply":"'$max_supply'"}'
	echo "$cli_path/./$baic_cli push action \'$token_contract\'  create  \"$param\" -p $token_contract"
	$cli_path/./$baic_cli push action $token_contract  create  "$param" -p $token_contract #this must be baic.token
	
	sleep 1
	
	param='["'$issuer'", "'$max_supply'", "issue the new token"]'
	echo "$cli_path/./$baic_cli push action $token_contract  issue \"$param\" -p $issuer"
	$cli_path/./$baic_cli push action $token_contract issue "$param" -p $issuer
	sleep 1
}

function issue_token() {
	issuer=$1
	max_supply=$2
	token_contract=$3

	
	param='["'$issuer'", "'$max_supply'", "issue the new token"]'
	echo "$cli_path/./$baic_cli push  action $token_contract  issue $param -p $issuer"
	$cli_path/./$baic_cli push  action $token_contract issue "$param" -p $issuer
	sleep 1
}

function system_new_accounts_with_wallet() {
	if [ $_CONF == "true" ]; then
		account=$G_new_account_name[$G_new_account_name_cnt]
		owner_pub=$G_owner_public_key
		owner_private=$G_owner_private_key
		active_pub=$G_active_public_key
		active_private=$G_active_private_key
		stake_cpu_dusd=$G_stake_cpu_dusd
		stake_net_dusd=$G_stake_net_dusd
		stake_ram_dusd=$G_stake_ram_dusd
		signer=$G_signer
		signer_owner_private=$G_signer_owner_private
		signer_active_private=$G_signer_active_private
	else	
		echo "input your account name"
		read account
		if [ ${#account} -lt 1 ]; then
			echo "Please input your account."
			exit
		fi
		
		echo "please input your signer name and signer owner private key and signer active private key (split with space):"
		read signer signer_owner_private signer_active_private
		if [ -z $signer ] || [ ${#signer_owner_private} -lt 1 ] || [ ${#signer_active_private} -lt 1 ]; then
			echo "Please input your signer name and signer owner private key and signer active private key!"
			exit
		fi

		echo "please input your new account public key and active public key (split with space):"
		read owner_pub active_pub
		if [ ${#owner_pub} -lt 1 ] || [ ${#active_pub} -lt 1 ]; then
			echo "Please input your owner public and active public key!"
			exit
		fi

		echo "input your stake net DUSD (recommend to be 0.500000000 DUSD):"
		read stake_net_dusd
		echo "input your stake cpu DUSD (recommend to be 0.500000000 DUSD):"
		read stake_cpu_dusd
		echo "input your stake ram DUSD (recommend to be 7.500000000 DUSD):"
		read stake_ram_dusd
		
	fi
	
	base_new_wallet $account $signer_owner_private $signer_active_private
	
	echo "$cli_path/./$baic_cli system newaccount --transfer --stake-net \"$stake_net_dusd\" --stake-cpu \"$stake_cpu_dusd\" --buy-ram \"$stake_ram_dusd\" $signer $account $owner_pub $active_pub"
	$cli_path/./$baic_cli system newaccount --transfer --stake-net "$stake_net_dusd" --stake-cpu "$stake_cpu_dusd" --buy-ram "$stake_ram_dusd" $signer $account $owner_pub $active_pub
	
	base_new_wallet $account $signer_owner_private $signer_active_private
	
	G_new_account_name = `expr $G_new_account_name + 1`
}

function system_new_accounts() {
	new_user=$1
	
	stake_net_amounts="$2 $3"
	stake_cpu_amounts="$4 $5"
	buy_ram_amounts="$6 $7"

	echo $buy_ram_amounts
	
	echo "$cli_path/./$baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user $owner_key $pri_key"
	
	$cli_path/./$baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user $owner_key $pri_key
}

function get_asset() {
	user_name=$1
	echo "$user_name's assert is:"
	$cli_path/./$baic_cli get currency balance baic.token $user_name
}

function check_amount_valid() {

	amount=`eval echo $@`

	echo "check_amount_valid: amount:$amount"
	if [ ${#amount} -lt 1 ]; then
		echo "Wrong amount. Please try again."
		exit
	fi
	
	cnt=0
	#cnt=`echo $amount| awk '$s+=gsub(/\./,"")'`
	cnt=`echo $amount | awk -F'.' '{print NF-1}'`

	if [ ${#cnt} -lt 1 ] || [ $cnt -ne 1 ]; then
		#echo ${#cnt} $cnt
		echo "Input wrong. Please ensure the amount format is like 1.000000000 DUSD"
		exit
	fi

	#idx_start=`awk 'BEGIN {print index("'$amount'", ".")}'`
	#idx_end=`awk 'BEGIN {print index("'$amount'", " ")}'`
	#len=`expr idx_end - idx_start`
	#echo ${amount:$idx : $len}
	#exit

	
	#calculate for zero count
	#zero_cnt=`echo $amount|awk  '{s+=gsub(/0/,"&")}END{print s}'`
	
	#calculate for decimal digit numbers
	decimal_cnts=`echo $amount|awk 'BEGIN{FS="[. ]"} {print length($2)}'`
	
	#calcuate for blank count
	blank_cnts=`eval echo $amount|awk  '{s+=gsub(/ /,"&")}END{print s}'`
	
	#echo $zero_cnt $blank_cnt
	#if [ $decimal_cnts -ne 9 ]; then
	#	echo "Wrong! Decimal cnt of amount must equals to 9 -> i.e 1.000000000"
	#	exit
	#elif [ $blank_cnts -ne 1 ]; then
	if [ $blank_cnts -ne 1 ]; then
		echo $blank_cnts
		echo "Wrong! your amount must be format like: 1.***..  <token name>"
		exit
	fi

	#calculate for values before token name
	#idx_start=`echo $amount|awk  '{s+=gsub(/\./,"&")}END{print s}'`
	#echo $idx_start
	#awk_param='BEGIN {print index("'$amount'", " ")}'
	#idx_end=`echo $amount|awk  "$awk_param"`
	#len=`expr $idx_end - $idx_start`
	#echo ${amount:$idx : $len}
	#exit


	#idx_start=`awk 'BEGIN {print index("'$amount'", ".")}'`
	#echo $idx_start
	#idx_end=`echo $amount|awk 'BEGIN {print index("'$amount'", ".")}'`
	#echo $idx_end
	#cnt_zero=echo ${amount:$idx_start}|awk  '{s+=gsub(/0/,"&")}END{print s}'
	#echo $amount|awk  '{s+=gsub(/ /,"&")}END{print s}'
	#exit
	#len=`expr $idx_end - $idx_start`
	#echo ${amount:$idx : $len}
	#exit

}


function print_help() {

	echo "parameters:"
	echo "init | get | publish | newaccount | transfer"
}

function transfer_cash() {
	transfer_contract=$1
	from=$2
	to=$3
	amount=$4
	memo=$5
	if [ $transfer_contract != "baic" ]; then
		param='["'$from'", "'$to'", "'$amount'","'$memo'"]'
		#echo "$param"
		echo "$cli_path/./$baic_cli push action $transfer_contract transfer "$param" -p $from"
		$cli_path/./$baic_cli push action $transfer_contract transfer "$param" -p $from
	else
		echo "$cli_path/./$baic_cli transfer $from $to "$amount" "$memo""
		$cli_path/./$baic_cli transfer $from $to "$amount" "$memo"
	fi
}

if [ $# -lt 1 ]; then
	echo "Wrong input! Please try again."
	echo
	print_help
	echo
	exit
fi


if [ -z $1 ]; then
	print_help
	exit

elif [ $1 == "--conf" ]; then
	_CONF=true
	_arr=$g_arr
else 		
	_CONF=false
	_arr=$*
fi

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
if [ $_CONF == "false" ]; then
	g_arr=()
	g_arr[${#g_arr[@]}]=$1
fi

for _params in "${g_arr[@]}"
do
	_param=`echo $_params|awk -F ' ' '{print $1}' `
	_argv=`echo $_params|awk -F ' ' '{print $2}' `
	echo "PARAM >>>>>>> $_param, >>>>>>_argvs: $_argv"
	if [ $_CONF == "true" ]; then
		case $_param in 
			sys_init)
				input_param=init
		;;
			new_account)
				input_param=newaccount
		;;
			new_token)
				input_param=publish
		;;
			issue_token)
				input_param=issue_token
		;;
			transfer)
				input_param=transfer
		;;
			get_account|get_code_abi|get_transaction)
				input_param=get
				_get_choice=$_param
		;;
			*)
		;;
		esac
	else
		input_param=$_param
	fi
	echo "input_param: $inpu_param"
	case $input_param in
		init)
			echo "+++INIT BASE++++"
			init_base
		;;
		publish)
			echo
			echo "++PUBLISH YOUR TOKEN++++"
			echo
			if [ $_CONF == "true" ]; then
				
				account=$G_issuer
				if [ ${#account} -lt 1 ]; then #check length of token string
					echo "Please give an account name."
					exit
				fi
				
				base_new_wallet $account $G_issue_owner_private_key $G_issue_active_private_key
				
				if [ $G_set_contract == "true" ] && [ $G_buy_account != baic ] && [ "$G_buy_account != baicpay" ] && [ $G_buy_account != "baic.token" ]; then
					if [ ! -z $G_buy_ram ]; then
						$cli_path/./$baic_cli system buyram baic $G_buy_account $G_buy_ram
					fi
					
					if [ ! -z $G_buy_dusd ]; then
						$cli_path/./$baic_cli transfer baic $G_buy_account $G_buy_dusd
					fi		
				fi

				$cli_path/./$baic_cli set contract $account $G_contract_path $G_contract_wasm $G_contract_abi

			else
				account=""
				echo "You need publish token to whom(account name):"
				read account
				if [ ${#account} -lt 1 ]; then #check length of token string
					echo "Please give an account name."
					exit
				fi
				
				echo "do you want to buy ram and dusd in case you have no ram to set contract? ('y' | 'n')"
				read yes_or_no
				
				if [ $yes_or_no != "y" ] && [ $yes_or_no != "n" ]; then
					echo "wrong input. try 'y' or 'n'"
					exit
				fi

				echo "input your contract path where store the wasm and abi files: "
				read contract_path
				
				echo "input your wasm file name"
				read wasm_name
				echo "input your abi file name"
				read abi_name

				wasm_path=$contract_path/$wasm_name
				abi_path=$contract_path/$abi_name
				

				if [ $yes_or_no == "y" ]; then
					echo "input your buy ram value:"
					read buy_ram
					echo "inpit yor buy dusd value:"
					read buy_dusd
					
					base_new_wallet "baic" $G_baic_owner_private_key $G_baic_active_private_key
					
					$cli_path/./$baic_cli system buyram baic $account "$buy_ram"
					$cli_path/./$baic_cli transfer baic $account "$buy_dusd"
				fi
				
				echo "Please give your owner private and active private in one line"
				read owner_private  active_private
				base_new_wallet $account $owner_private $active_private
				
				echo " $cli_path/./$baic_cli set contract $account $contract_path $G_contract_wasm $G_contract_abi"
				$cli_path/./$baic_cli set contract $account $contract_path $wasm_path $abi_path
			fi


			if [ $_CONF == "true" ]; then
				#base_new_wallet $account $G_issue_owner_private_key $G_issue_active_private_key

				raise_token $account "$G_token_supply" $G_token_contract
			else
				#echo "Please give your owner private and active private in one line"
				#read owner_private  active_private
				base_new_wallet $account $owner_private $active_private
				
				echo "please give your max supply (i,e 11.000000000 <token name>)"
				read max_supply
				
				echo "please input your token contract name: i.e baic.token, dma.music, cmux..."
				read token_contract
				
				echo "token_contract: $token_contract"
				raise_token $account $token "$max_supply" $token_contract 
			fi
		;;
		issue_token)
			echo
			echo "++ISSUE YOUR TOKEN++++"
			echo
			
			if [ $_CONF == "true" ]; then
				account=$G_issuer
			else
				echo "You need publish token to whom(account name):"
				read account
			fi

			if [ ${#account} -lt 1 ]; then #check length of token string
				echo "Please give an account name."
				exit
			fi

			if [ $_CONF == "true" ]; then
				base_new_wallet $account $G_issue_owner_private_key $G_issue_active_private_key

				issue_token $account $G_token_supply $G_token_contract
			else
				echo "Please give your owner private and active private in one line"
				read owner_private  active_private
				base_new_wallet $account $owner_private $active_private
				
				echo "please give your max supply (i,e 11.000000000 <token name>)"
				read max_supply
				
				echo "please input your token contract name: i.e baic.token, dma.music, cmux..."
				read token_contract

				issue_token $account $max_supply $token_contract 
			fi
		;;	
		get)

			if [ $_CONF == "true" ]; then
				username=$G_account
				contractname=$G_contract
				trx_id=$G_trx_id
				choice=$_get_choice
				save_code=$G_save_code
				save_abi=$G_save_abi
			else
				echo "input your choice"
				echo "1. account and currency"
				echo "2. transaction"
				echo "3. code and abi"
				Arg=""
				read Arg
				case $Arg in
					1 | 3)
						choice=get_account
						echo "Input user name:"
						username=""
						read username
						echo
						echo "Input your token contract name:"
						read contractname
					;;
					2)
						choice=get_transaction
						echo "Put your transaction ID:"
						read trx_id
						echo $trx_id
						echo
					;;
					3)
						choice=get_code_abi
						echo "Put your contract name:"
						read contractname
						echo $contractname
						echo
						echo "Put your save/to wasm and abi file name (split with blank)"
						read save_code save_abi
					;;
					*) #default case
						echo "Wrong choice. Please try again."
					;;
				esac
			fi	
			
			if [ $choice == "get_account" ]; then
				$cli_path/./$baic_cli get account $username
				echo "asset of $username:"
				$cli_path/./$baic_cli get currency balance $contractname $username
				echo
			elif [ $choice == "get_code_abi" ]; then
				echo "+++++ CODE +++++++"
				$cli_path/./$baic_cli get code $contractname -c $save_code -a $save_abi --wasm
				echo
				echo "+++++ ABI ++++++++"
				$cli_path/./$baic_cli get abi $contractname
				echo
			elif [ $choice == "get_transaction" ]; then
				$cli_path/./$baic_cli get transaction $trx_id
			
			fi
		;;
		newaccount)
			
			system_new_accounts_with_wallet
			
		;;
		transfer)
			if [ $_CONF == "true" ]; then
				from=$G_from
				to=$G_to
				amount=$G_amount
				memo=$G_memo
				from_owner_private_key=$G_from_owner_private_key
				from_active_private_key=$G_from_active_private_key
				transfer_contract=$G_transfer_contract
			else 
				from=""
				to=""
				amount=""
				memo=""
				echo "input your from user"
				read from
				if [ ${#from} -lt 1 ]; then
					echo "Wrong! Please input your from user."
					exit
				fi
				echo "input your to (receiver) user"
				read to
				if [ ${#to} -lt 1 ]; then
					echo "Wrong! Please input your receiver user."
					exit
				fi
				echo "input your from user owner private key and active private key (split with space)"
				read from_owner_private_key from_active_private_key
				
				echo "input your amount(i.e "2.000000000 DUSD")"
				read amount
				echo "check:$amount"
				check_amount_valid $amount	

				echo "input your memo"
				read memo
				
				echo "imput your transfer contract name:"
				read transfer_contract
				#transfer_contract="baic" //decimal * 18
				#transfer_contract="baic.token" //decimal * 9
			fi

			base_new_wallet $from $from_owner_private_key $from_active_private_key
			#base_new_wallet $to_owner_private_key $to_active_private_key
			transfer_cash $transfer_contract $from $to "$amount" "$memo"
		;;	
		*) #default case
			echo "DEFAULT!"
			print_help
			exit
		;;
		esac

		echo
		echo -e "\033[32m==================================================================================== \033[0m"
		echo -e "\033[32m=====================       Press any key to continue!      ======================== \033[0m"
		echo -e "\033[32m==================================================================================== \033[0m"
		echo
		char=`get_char`
done





