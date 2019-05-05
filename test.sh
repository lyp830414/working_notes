#!/bin/bash
#set -e

cli_path=/home/lyp/new_baic_chain/Baic-Chain/build/programs/baic_cli
walletpwd=""

function base_new_wallet() {

	rm  ~/baic-wallet/baic.wallet
	$cli_path/./baic_cli wallet create -n baic > wallet.txt

	chmod 777 wallet.txt

	$cli_path/./baic_cli wallet import -n baic --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

	walletpwd=`cat wallet.txt|awk 'END {print}'|sed 's/"//g'`
	echo "password-->"$walletpwd

	$cli_path/./baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
}

function base_create_sys_accounts() {

	$cli_path/./baic_cli create account baic baic.dusd BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.bpay BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic  baic.msig BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.names BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	 $cli_path/./baic_cli create account  baic baic.ram BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.ramfee BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.saving BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.stake BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.token BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.vpay BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.sudo BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./baic_cli create account  baic baic.high BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

}

function base_set_sys_contracts() {
       
	$cli_path/./baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
	$cli_path/./baic_cli set contract baic.token ~/ ~/baic.token.wasm ~/baic.token.abi  -p  baic.token
	$cli_path/./baic_cli set contract baic.dusd ~/ ~/baic.dusd.wasm ~/baic.dusd.abi  -p  baic.dusd
	$cli_path/./baic_cli set contract baic.msig ~/ ~/baic.msig.wasm ~/baic.msig.abi  -p  baic.msig
	$cli_path/./baic_cli set contract baic.sudo ~/ ~/baic.sudo.wasm ~/baic.sudo.abi  -p  baic.sudo
	$cli_path/./baic_cli set contract baic.high ~/ ~/baic.token.high.wasm ~/baic.token.high.abi  -p  baic.high
	$cli_path/./baic_cli set contract baic ~/ ~/baic.system.wasm ~/baic.system.abi  -p  baic -x 1000
}

function init_base() {
	echo '==========base new wallet =================='
	base_new_wallet
	echo '==========base_create_sys_accounts=========='
	base_create_sys_accounts
	echo '==========base_set_sys_contracts============'
	base_set_sys_contracts
}



function raise_token() {
	token_name=$1
	
	$cli_path/./baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
	sleep 1
	
	param='{"issuer":"baic", "maximum_supply":"1000000000.000000000 '$token_name'"}'
	$cli_path/./baic_cli push  action baic.token  create  "$param" -p baic.token
	
	sleep 1
	
	#./baic_cli push  action baic.token  create  '{"baic", "1000000000.000000000 BAIC"}' -p baic.token
	
	param='["baic", "1000000000.000000000 '$token_name'", "test msg"]'
	$cli_path/./baic_cli push  action baic.token  issue "$param" -p baic
	sleep 1
}

function system_new_accounts() {
	new_user=$1
	token_name=$2
	echo "$cli_path/./baic_cli system newaccount --transfer --stake-net "100.000000000 $token_name" --stake-cpu "100.000000000 $token_name" --buy-ram "100.000000000 $token_name" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
	$cli_path/./baic_cli system newaccount --transfer --stake-net "100.000000000 $token_name" --stake-cpu "100.000000000 $token_name" --buy-ram "100.000000000 $token_name" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
}

function get_asset() {
	user_name=$1
	echo "$user_name's assert is:"
	$cli_path/./baic_cli get currency balance baic.token $user_name
}

function print_help() {

	echo "parameters:"
	echo "init | get | publish | newaccount"
}

function transfer_cash() {
	from=$1
	to=$2
	amount=$3
	memo=$4
	echo "$cli_path/./baic_cli transfer $from $to "$amount" "$memo""
	$cli_path/./baic_cli transfer $from $to "$amount" "$memo"
}

if [ $# -lt 1 ]; then
	echo "Wrong input! Please try again."
	echo
	print_help
	echo
	exit
fi


input_param=$1

case $input_param in
	init)
		echo "+++INIT BASE++++"
		init_base
		exit
	;;
	publish)
		echo
		echo "++PUBLISH YOUR TOKEN++++"
		echo
		echo "input your token name(default: DUSD):"
		token="DUSD"
		read token
		if [ ${#token} -lt 1 ]; then #check length of token string
			echo "use default DUSD as your token."
			token="DUSD"
		else
			echo "use $token as your token."
		fi

		echo
		base_new_wallet
		raise_token $token
		
		exit
	;;	
	get)
		echo "input your choice"
		echo "1. account and currency"
		echo "2. (others)"
		Arg=""
		read Arg
		case $Arg in
			1)
				echo "Input user name:"
				username=""
				read username
				echo
				$cli_path/./baic_cli get account $username
				echo "asset of $username:"
				$cli_path/./baic_cli get currency balance baic.token $username
				echo
			;;
			2)
				echo ""
			;;
			*) #default case
				echo "Wrong choice. Please try again."
			;;
		esac	
	;;
	newaccount)
		echo "please input your new account:"
		username=""
		read username
		echo "please input your token name(default is DUSD)"
		token_name="DUSD"
		read token_name
		if [ ${#token_name} -lt 1 ]; then
			token_name="DUSD"
			echo "use DUSD as your token"
		else
			echo "use $token_name as your token."
		fi

		echo "+++SYS NEW ACCOUNT: $username ++++"
		echo
		base_new_wallet
		system_new_accounts $username $token_name
		exit
	;;
	transfer)
		from="baic"
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
		echo "input your amount(i.e "2 DUSD")"
		read amount
		echo "input your memo"
		read memo
		transfer_cash $from $to "$amount" "$memo"
	;;	
	*) #default case
		print_help
		exit
	;;
	esac









