#!/bin/bash
#set -e

##################################################################################

g_arr=()

G_new_account_name=()
G_new_account_name_cnt=0

G_owner_public_key=()
G_owner_public_key_cnt=0

G_owner_private_key=()
G_owner_private_key_cnt=0

G_active_public_key=()
G_active_public_key_cnt=0

G_active_private_key=()
G_active_private_key_cnt=0

G_transfer_contract=()
G_transfer_contract_cnt=0

G_from=()
G_from_cnt=0

G_to=()
G_to_cnt=0

G_amount=()
G_amount_cnt=0

G_from_owner_private_key=()
G_from_owner_private_key_cnt=0

G_from_active_private_key=()
G_from_active_private_key_cnt=0

G_issuer=()
G_issuer_cnt=0

G_buy_account=()
G_buy_account_cnt=0

G_token_contract=()
G_token_contract_cnt=0

G_issue_owner_private_key=()
G_issue_owner_private_key_cnt=0

G_issue_active_private_key=()
G_issue_active_private_key_cnt=0

G_token_supply=()
G_token_supply_cnt=0


# cli path
cli_path=/home/lyp/new_baic_chain/Baic-Chain/build/programs/baic_cli
wallet_url=http://127.0.0.1:20188 #--wallet-url http://10.101.2.69:8900, only for account baicpay
url=http://127.0.0.1:20188
baic_cli="baic_cli --wallet-url $wallet_url --url $url"

##########################   CONFIGURATION   #####################################

G_baic_owner_public_key=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_baic_owner_private_key=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_baic_active_public_key=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_baic_active_private_key=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_wallet_path=/home/lyp/code_baic_chain/Baic-Chain/build/programs/nodeos/lypdata

#++++ sys_init ++++++++#

# passed test both in manual & conf

#++++ new_account +++++#

# passed both in manual & conf
##
G_new_account_name[${#G_new_account_name[*]}]=testa
G_owner_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_owner_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_active_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_active_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

##
G_new_account_name[${#G_new_account_name[*]}]=testb
G_owner_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_owner_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_active_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_active_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

##
G_new_account_name[${#G_new_account_name[*]}]=testc
G_owner_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_owner_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_active_public_key[${#G_new_account_name[*]}]=BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
G_active_private_key[${#G_new_account_name[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


G_signer=baic
G_signer_owner_private=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_signer_active_private=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


G_stake_net_dusd="0.500000000 DUSD"
G_stake_cpu_dusd="0.500000000 DUSD"
G_stake_ram_dusd="7.500000000 DUSD"

#++++ new_token / issue_token  +++++#

# passed both in manual & conf

##
G_issuer[${#G_issuer[*]}]=baic
G_set_contract[${#G_issuer[*]}]=false #for system accounts, put false.
G_buy_account[${#G_issuer[*]}]=baic
G_token_contract[${#G_issuer[*]}]=baic.token

G_issue_owner_private_key[${#G_issuer[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_issue_active_private_key[${#G_issuer[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

G_token_supply[${#G_issuer[*]}]="9999.999999999 DUSD"

##
G_issuer[${#G_issuer[*]}]=testa
G_set_contract[${#G_issuer[*]}]=true
G_buy_account[${#G_issuer[*]}]=testb
G_token_contract[${#G_issuer[*]}]=testa

G_issue_owner_private_key[${#G_issuer[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_issue_active_private_key[${#G_issuer[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

G_token_supply[${#G_issuer[*]}]="9999.999999999 TESTA"

G_contract_path="/home/lyp"
G_contract_wasm="/home/lyp/baic.token.wasm"
G_contract_abi="/home/lyp/baic.token.abi"
G_buy_ram="280.000000000 DUSD"
G_buy_dusd="3.000000000 DUSD"

#++++  transfer    +++++#

# passed both in manual & conf

##
G_transfer_contract[${#G_transfer_contract[*]}]="baic.token"
G_from[${#G_transfer_contract[*]}]="baic"
G_to[${#G_transfer_contract[*]}]="testa"
G_amount[${#G_transfer_contract[*]}]="10.00000000 DUSD"
G_from_owner_private_key[${#G_transfer_contract[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_from_active_private_key[${#G_transfer_contract[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

##
G_transfer_contract[${#G_transfer_contract[*]}]="testa"
G_from[${#G_transfer_contract[*]}]="testa"
G_to[${#G_transfer_contract[*]}]="testb"
G_amount[${#G_transfer_contract[*]}]="1.00000000 TESTA"
G_from_owner_private_key[${#G_transfer_contract[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
G_from_active_private_key[${#G_transfer_contract[*]}]=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

#++++  get_account  +++++#
#++++ get_transaction +++#
#++++  get_code_abi +++++#

 # passed both in manual & conf

G_account="testccf"
G_contract="testbbb"
G_trx_id=17c896f854516347c07db0dc624e4da043c8343feb4b782b11f0c3b77f0a4987
G_save_code="code.wasm"
G_save_abi="code.abi"

###########################    YOUR CHOICE    ###################################

g_arr[${#g_arr[*]}]=sys_init

g_arr[${#g_arr[*]}]=new_token
g_arr[${#g_arr[*]}]=transfer

g_arr[${#g_arr[*]}]=new_token

g_arr[${#g_arr[*]}]=new_account
g_arr[${#g_arr[*]}]=new_account
g_arr[${#g_arr[*]}]=new_account

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
	
	if [ -z $G_wallet_path ]; then
		echo "Please set your 'G_wallet_path' value where store your wallet file!"
		exit
	fi	
	
	rm -rf $G_wallet_path/*.wallet

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

	$cli_path/./$baic_cli create account baic baic.dusd BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.bpay BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic  baic.msig BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.names BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	 $cli_path/./$baic_cli create account  baic baic.ram BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.ramfee BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.saving BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.stake BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.token BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.vpay BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.sudo BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.high BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
	$cli_path/./$baic_cli create account  baic baic.pool BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

}

function base_set_sys_contracts() {
       
	$cli_path/./$baic_cli wallet unlock -n baic --password $walletpwd 2>/dev/null
	$cli_path/./$baic_cli set contract baic.token ~/ ~/baic.token.wasm ~/baic.token.abi  -p  baic.token
	$cli_path/./$baic_cli set contract baic.dusd ~/ ~/baic.dusd.wasm ~/baic.dusd.abi  -p  baic.dusd
	$cli_path/./$baic_cli set contract baic.msig ~/ ~/baic.msig.wasm ~/baic.msig.abi  -p  baic.msig
	$cli_path/./$baic_cli set contract baic.sudo ~/ ~/baic.sudo.wasm ~/baic.sudo.abi  -p  baic.sudo
	$cli_path/./$baic_cli set contract baic.high ~/ ~/baic.token.high.wasm ~/baic.token.high.abi  -p  baic.high
	$cli_path/./$baic_cli set contract baic ~/ ~/baic.system.wasm ~/baic.system.abi  -p  baic -x 1000
}

function init_base() {
	echo '==========base new wallet =================='
	base_new_wallet "baic" $G_baic_owner_private_key $G_baic_active_private_key
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
	
	echo "$cli_path/./$baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
	
	$cli_path/./$baic_cli system newaccount --transfer --stake-net "$stake_net_amounts" --stake-cpu "$stake_cpu_amounts" --buy-ram "$buy_ram_amounts" baic $new_user BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV BAIC6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
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

for _param in ${g_arr[@]}
do
	echo "PARAM >>>>>>> $_param"
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








