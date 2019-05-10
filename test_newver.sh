#!/bin/bash
#set -e

##################################################################################

# cli path
cli_path=/home/lyp/new_baic_chain/Baic-Chain/build/programs/baic_cli


##########################   CONFIGURATION   #####################################

#++++ sys_init ++++++++#


#++++ new_account +++++# 

G_new_account_name=""

G_owner_public_key=
G_owner_private_key=

G_active_public_key=
G_active_private_key=


#++++ new_token / issue_token  +++++#

G_issuer=""

G_issuer_private_key=""

G_token_name=""

G_token_supply=""

G_init_gas_dusd=“1.0 DUSD”

#++++  transfer    +++++#

G_from=""
G_to=""
G_amount=""
G_from_private_key=""

#++++  get_account  +++++#

G_account=""

#++++  get_code_abi +++++#
G_contract=“”

#++++ get_transaction +++#
G_trx_id=""

###########################    YOUR CHOICE    ###################################

YOUR_CHOICE=sys_init

#################################################################################

walletpwd=""

owner_pub=""
owner_private=""
active_pub=""
active_private=""


function base_new_wallet() {
	
	rm  ~/baic-wallet/*.wallet
	$cli_path/./baic_cli wallet create -n baic > wallet.txt

	chmod 777 wallet.txt

	$cli_path/./baic_cli wallet import -n baic --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

	walletpwd=`cat wallet.txt|awk 'END {print}'|sed 's/"//g'`
	echo "password-->"$walletpwd

	$cli_path/./baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
	
	echo "base_new_wallet:$1"
	if [ -n "$1" ] && [ $1 != "baic" ]; then

		user=$1
		$cli_path/./baic_cli wallet create -n $user > wallet2.txt

		chmod 777 wallet2.txt
		

		if [ ! -z $2 ] && [ ! -z $3 ]; then
			user_owner_prvkey=$2
			user_active_prvkey=$3
			echo 
			echo "wallet import private keys for $user: $user_owner_prvkey and $user_active_prvkey"
			echo
			$cli_path/./baic_cli wallet import -n $user --private-key $user_owner_prvkey
			$cli_path/./baic_cli wallet import -n $user --private-key $user_active_prvkey
		else 	
			$cli_path/./baic_cli wallet import -n $user --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
		fi
		

		walletpwd=`cat wallet2.txt|awk 'END {print}'|sed 's/"//g'`
		echo "  !!!!!!!!!!!!!!!! password-->"$walletpwd
		
		echo "$cli_path/./baic_cli wallet unlock -n $user --password $walletpwd 2>/dev/null"
		$cli_path/./baic_cli wallet unlock -n $user --password $walletpwd 2>/dev/null

	fi
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
	$cli_path/./baic_cli create account  baic baic.pool BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

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
	issuer=$1
	token_name=$2
	max_supply=$3

	$cli_path/./baic_cli wallet unlock -n $issuer --password $walletpwd 2>/dev/null
	sleep 1
	
	param='{"issuer":"'$issuer'", "maximum_supply":"'$max_supply' '$token_name'"}'
	echo "$cli_path/./baic_cli push  action baic.token  create  $param -p baic.token"
	$cli_path/./baic_cli push  action baic.token  create  "$param" -p baic.token #this must be baic.token
	
	sleep 1
	
	#./baic_cli push  action baic.token  create  '{"baic", "1000000000.000000000 BAIC"}' -p baic.token
	
	param='["'$issuer'", "'$max_supply' '$token_name'", "issue the new token"]'
	echo "$cli_path/./baic_cli push  action baic.token  issue $param -p baic.token"
	$cli_path/./baic_cli push  action baic.token  issue "$param" -p $issuer
	sleep 1
}

function system_new_accounts_with_wallet() {
	echo "input your account name"
	read account
	if [ ${#account} -lt 1 ]; then
		echo "Please input your account."
		exit
	fi
	
	echo "please input your owner pub key:"
	read owner_pub owner_private
	if [ ${#owner_pub} -lt 1 ]; then
		echo "Please input your owner public key."
		exit
	fi
	if [ ${#owner_private} -lt 1 ]; then
		echo "Please input your owner private key."
		exit
	fi

	echo "please input your active pub key:"
	read active_pub active_private
	if [ ${#active_pub} -lt 1 ]; then
		echo "Please input your active public key."
		exit
	fi
	if [ ${#active_private} -lt 1 ]; then
		echo "Please input your active private key."
		exit
	fi
	
	echo  $owner_pub
	echo  $owner_private
	echo  $active_pub
	echo  $active_private
	
	$cli_path/./baic_cli system newaccount --transfer --stake-net "0.500000010 DUSD" --stake-cpu "0.500000010 DUSD" --buy-ram "7.500000000 DUSD" baic $account $owner_pub $active_pub
}

function system_new_accounts() {
	new_user=$1
	
	stake_net_amounts="$2 $3"
	stake_cpu_amounts="$4 $5"
	buy_ram_amounts="$6 $7"

	echo $buy_ram_amounts
	
	echo "$cli_path/./baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
	
	$cli_path/./baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
}

function get_asset() {
	user_name=$1
	echo "$user_name's assert is:"
	$cli_path/./baic_cli get currency balance baic.token $user_name
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
	if [ $decimal_cnts -ne 9 ]; then
		echo "Wrong! Decimal cnt of amount must equals to 9 -> i.e 1.000000000"
		exit
	elif [ $blank_cnts -ne 1 ]; then
		echo $blank_cnts
		echo "Wrong! your amount must be format like: 1.000000000 <token name>"
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
	choice_which=$1
	from=$2
	to=$3
	amount=$4
	memo=$5
	if [ $choice_which == "use_baic.token" ]; then
		param='["'$from'", "'$to'", "'$amount'","vote"]'
		#echo "$param"
		echo "$cli_path/./baic_cli push action baic.token transfer "$param" -p $from"
		$cli_path/./baic_cli push action baic.token transfer "$param" -p $from
	elif [ choice_which == "use_original" ]; then
		echo "$cli_path/./baic_cli transfer $from $to "$amount" "$memo""
		$cli_path/./baic_cli transfer $from $to "$amount" "$memo"
	else
		echo "Wrong choice $choice_which for transfer!"
		exit
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
	case $1 in 
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
		get_account)
	;;
		get_code_abi)
	;;
		get_transaction)
	;;
		*)
	esac
else 		
	_CONF=false
	input_param=$1

fi


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
		
		if [ $_CONF==true ]; then
			token=$G_token_name
		else
			echo "input your token name(default: DUSD):"
			token="DUSD"
			read token

		fi

		if [ ${#token} -lt 1 ]; then #check length of token string
			#echo "use default DUSD as your token."
			#token="DUSD"
			echo "Please give your token name."
			exit
		else
			echo "use $token as your token."
		fi

		echo
		
		if [ $_CONF==true ]; then
			account=$G_issuer
		else
			account=""
			echo "You need publish token to whom(account name):"
			read account
		fi

		if [ ${#account} -lt 1 ]; then #check length of token string
			echo "Please give an account name."
			exit
		fi

		if [ $_CONF==true ]; then
			base_new_wallet $account $G_owner_private_key $G_active_private_key

			raise_token $account $G_token_name $G_token_supply
		else
			echo "Please give your owner private and active private in one line"
			read owner_private  active_private
			base_new_wallet $account $owner_private $active_private
			
			#a='111|222|333'
			#OIFS=$IFS; IFS="|"; set -- $result; ownerpub=$1;ownerpriv=$2;actpub=$3; actpri=$4;IFS=$OIFS 
			#echo "system_new_accounts_with_wallet: result: $result"
		        #echo "( $ownerpub  $ownerpriv  $actpub  $actpri )" 
			#exit
			echo "please give your max supply (i,e 11.000000000 <token name>)"
			read max_supply

			raise_token $account $token $max_supply
		fi

		exit
	;;
	issue_token)
	;;	
	get)
		echo "input your choice"
		echo "1. account and currency"
		echo "2. transaction"
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
				echo "Put your transaction ID:"
				read trx_id
				echo $trx_id
				$cli_path/./baic_cli get transaction $trx_id
				echo
			;;
			*) #default case
				echo "Wrong choice. Please try again."
			;;
		esac	
	;;
	newaccount)
		
		if [ ! -z $2 ] && [ $2 == "--with-wallet" ]; then

			system_new_accounts_with_wallet

			base_new_wallet $username $owner_private $active_private
			#a='111|222|333'
			#OIFS=$IFS; IFS="|"; set -- $result; ownerpub=$1;ownerpriv=$2;actpub=$3; actpri=$4;IFS=$OIFS 
			#echo "system_new_accounts_with_wallet: result: $result"
		        #echo "( $ownerpub  $ownerpriv  $actpub  $actpri )" 
			#exit
		exit
		fi


		echo "please input your new account:"
		username=""
		read username
		#echo "please input your token name(default is DUSD)"
		#token_name="DUSD"
		#read token_name
		#if [ ${#token_name} -lt 1 ]; then
		#	token_name="DUSD"
		#	echo "use DUSD as your token"
		#else
		#	echo "use $token_name as your token."
		#fi
	
		echo "input your stake-net amount, i.e 3.000000000 DUSD"
		read stake_net_amounts

		check_amount_valid $stake_net_amounts
		
		echo "input your stake-cpu amount, i.e 3.000000000 DUSD"
		read stake_cpu_amounts
		check_amount_valid $stake_cpu_amounts

		echo "input your buy-ram amount, i.e 3.000000000 DUSD"
		read buy_ram_amounts
		check_amount_valid $buy_ram_amounts

		#echo $stake_net_amount "|" $stake_cpu_amount "|"  $buy_ram_amount
		
		echo "+++SYS NEW ACCOUNT: $username ++++"
		echo

		base_new_wallet
		
			
		system_new_accounts $username $stake_net_amounts $stake_cpu_amounts $buy_ram_amounts
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
		
		echo "input your amount(i.e "2.000000000 DUSD")"
		read amount
		echo "check:$amount"
		check_amount_valid $amount	

		echo "input your memo"
		read memo
		
		choice_which="use_baic.token"
		#choice_which="use orignal"

		base_new_wallet $from
		base_new_wallet $to
		transfer_cash $choice_which $from $to "$amount" "$memo"
	;;	
	*) #default case
		print_help
		exit
	;;
	esac









