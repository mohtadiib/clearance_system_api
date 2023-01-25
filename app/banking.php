<?php

function check_user($conn ,$user){
    $msg = ['msg'=> false ,'err' => 'can\'t find user .. '];       
    // check if user exist ..

    $query = "SELECT * FROM users WHERE id = $user or phone = $user Limit 1";
    $user_result = query($conn, $query, true);

    if(isset($user_result) && !empty($user_result)){
    // check if wallet exist ..
    
    $user_id = $user_result['id'];
    $user_name = $user_result['name'];
    $query = "SELECT * FROM wallet WHERE user = $user_id Limit 1";
    $wallet = query($conn,$query, true);
    if($wallet){
        $msg = ['user'=> $user_result,'wallet'=> $wallet ,'msg' => true];
    }else{
        $msg = ['msg'=> false ,'err' => "can\'t find wallet for user $user_name" ];       
        }
    }
    // return wallet ..
    return $msg;
}

function deposit($conn,$user,$cash , $source = NULL, $reason= NULL){
    $msg = ['msg'=> false ,'err' => 'can\'t put the deposit .. '];
    // check if user exist
    $result = check_user($conn,$user);
    $wallet = $result['wallet'];

    if($wallet){
        $balance = $wallet['amount'];
        $wallet_id =  $wallet['id'];
        $msg = ['msg'=> false ,'err' => 'transaction error ..'];
    
            // add transaction 
            if(transaction($conn,$wallet_id, $cash ,$source ,$reason , 1)){
                $amount = $balance + $cash;
                // fill/update wallet .. with cash
                $query = "UPDATE wallet SET amount = $amount WHERE id = $wallet_id";

                if(query($conn,$query)){
                    $msg = ['msg'=> true ,'done' => 'added '.$cash.'SDG to your wallet'];
                }
            }
    }
    // add cash to 
    return $msg;
}

    function withdraw($conn,$user ,$cash, $source = NULL, $reason= NULL){
        $msg = ['msg'=> false ,'err' => 'can\'t withdraw money .. '];
        // check if user exist
        $result = check_user($conn ,$user);
        $wallet = $result['wallet'];
        //check wallet ..
        if($wallet){
            $balance = $wallet['amount'];
            $wallet_id =  $wallet['id'];
            $msg = ['msg'=> false ,'err' => "your balance is $balance .. "];
            if($balance >= $cash){
                $amount = $balance - $cash;
                 // add transaction 
                if(transaction($conn,$wallet_id, $cash ,$source ,$reason , 2)){
                     // fill/update wallet .. with cash
                    $query = "UPDATE wallet SET amount = $amount WHERE id = $wallet_id";
                    if(query($conn,$query)){
                        $msg = ['msg'=> true ,'done' => 'deduct '.$cash.' SDG from your wallet'];
                    }
                }            
            }
            
        }
        //withdraw from account ..
        return $msg;
    }

    function transaction($conn,$wallet, $amount, $source = NULL, $reason= NULL, $type = 1){

        $msg = false;
        // add transaction to table wallet_t
        $query = "INSERT INTO wallet_t (wallet, amount, source, reason, type) VALUES ($wallet, $amount, $source, $reason, $type)";
        $result = query($conn,$query);
        if($result){
            // insert transaction .. 
            $msg = true;
        }
        return $msg;
    }

    function query($conn , $sql, $select = false){

        $qry = mysqli_query($conn,$sql);
        if($select){
            $res = mysqli_fetch_assoc($qry);
            return $res;
        }
        return $qry;

    }

    function role_back($conn,$trans_id)
    {
        $msg = ['msg'=> false ,'err' => 'Transaction roledBack failed !'];
        $query = "SELECT * FROM `wallet_t` WHERE id = $trans_id AND `deleted` IS NULL Limit 1";
        $transaction = query($conn,$query, true); 
        if($transaction){
            $wallet_id =  $transaction['wallet'];
            $trans_id =  $transaction['id'];
            $cash =  $transaction['amount'];

            $query = "SELECT * FROM wallet WHERE id = $wallet_id Limit 1";
            $wallet = query($conn,$query, true);
            $balance = $wallet['amount'];

            if($transaction['type'] == 'in'){

                if($balance < $cash){
                    $msg = ['msg'=> false ,'err' => 'Transaction roledBack failed, your balance is low !'];
                    return $msg;
                }

                $amount = $balance - $cash;
                // fill/update wallet .. with cash
                $query = "UPDATE wallet SET amount = $amount WHERE id = $wallet_id";
                
            }elseif($transaction['type'] == 'out'){
                $amount = $balance + $cash;
                // fill/update wallet .. with cash
                $query = "UPDATE wallet SET amount = $amount WHERE id = $wallet_id";
            }else{
                return $msg;
            }

            if(query($conn,$query)){
                $query = "UPDATE `wallet_t` SET `deleted` = 1 WHERE `id` = $trans_id";
                query($conn,$query);
                $msg = ['msg'=> true ,'done' => 'Transaction roledBack'];               
            }
        }

        return $msg;
    }

?>