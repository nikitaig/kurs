<?php
namespace app\controllers;

use app\models\HotelRoom;
use app\models\RoomOrder;
use app\models\User;
use Yii;

class RoomOrderController extends FunctionController
{
    public $modelClass = 'app\models\HotelRoom';

    public function actionCreate($id_room)
    {
        $room = HotelRoom::find()->where(['id_room'=>$id_room])->one();
        $user = User::getByToken();
        if($room && $user->isAuthorized()){
        
        $userid = $user -> id_user;
        $data=Yii::$app->request->post();   
        $data['room_id'] = $id_room; 
        $room_order=new RoomOrder();
        $room_order->load($data, '');
        $room_order-> user_id =$userid;
        if (!$room_order->validate()) return $this -> validation($room_order);
        $room_order->save();
        return $this->send(200, null);
        }
        else{
            return $this->send(403, ['error'=>['code'=>401, 'message'=>'Unauthorized', 'errors'=>['email'=>'Вы неавторизованны']]]);
        }
    }

}