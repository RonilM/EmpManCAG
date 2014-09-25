<?php



class GoogleLoginController extends BaseController {

    /**
     * Show the profile for the given user.
     */

        public function AuthTokenExchange(){

$state = Input::get('state');
$data =   array('code' => Input::get('code'),
                'grant_type' => 'authorization_code',
                'redirect_uri' => Config::get('GlobalVar.GV.BaseAddress').'/GoogleLogin',
                'client_id' => Config::get('GlobalVar.GV.ClientID'),
                'client_secret' => Config::get('GlobalVar.GV.ClientSecret')
                );
    
 $fields = '';
 foreach($data as $key => $value) { 
      $fields .= $key . '=' . $value . '&'; 
   }
   rtrim($fields, '&');

   $post = curl_init();

   curl_setopt($post, CURLOPT_URL, 'https://accounts.google.com/o/oauth2/token');
   curl_setopt($post, CURLOPT_POST, count($data));
   curl_setopt($post, CURLOPT_POSTFIELDS, $fields);
   curl_setopt($post, CURLOPT_RETURNTRANSFER, 1);

   $result = curl_exec($post);

   curl_close($post);

  // return $result."";

   $jsonAccessToken = json_decode($result, false);
   $AccessToken = $jsonAccessToken->access_token;

   $UserData = file_get_contents("https://www.googleapis.com/oauth2/v2/userinfo?access_token=".$AccessToken);

   $jsonEmail = json_decode($UserData, false);
   $Email = $jsonEmail->email;
    
    //return var_dump($UserData);


    Session::put('EmpMan_Token',$AccessToken);
    Session::put('EmpMan_Email',$Email);

    //return $state;
    if($state === Config::get('GlobalVar.GV.EmployeeState')){
        return Redirect::to('LoginLogic');
    }
    elseif ($state === Config::get('GlobalVar.GV.ManagerState')) {
      return Redirect::to('ManagerLoginLogic');
    }
    elseif($state === Config::get('GlobalVar.GV.FinanceState')){
        return Redirect::to('FinanceLoginLogic');
    }



    }


}


