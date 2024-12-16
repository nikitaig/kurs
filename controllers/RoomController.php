<?php
namespace app\controllers;

use app\models\HotelRoom;
use app\models\User;
use yii\web\UploadedFile;
use Yii;

class RoomController extends FunctionController
{
    public $modelClass = 'app\models\HotelRoom';
    public function actionCreate(){
         $user = User::getByToken();
         $post_data=\Yii::$app->request->post();
         if (!($user && $user->isAuthorized() && $user->role_id == 1)) {
            return $this->send(403, ['error' => ['message' => 'Доступ запрещен']]);
        }
             $post_data=\Yii::$app->request->post();
             $phot=new HotelRoom();
             $phot->load($post_data, '');
             $phot->photo=UploadedFile::getInstanceByName('photo');
            if (!$phot->validate()) return $this->validation($phot);
             $hash=hash('sha256', $phot->photo->baseName) . '.' . $phot -> photo->extension;
             $phot->photo->saveAs(\Yii::$app->basePath. '/web/assets/upload/' . $hash);
             $phot->photo=$hash;
             $phot->save(false);
             return $this->send(204, null);
    } 
    public function actionCount(){
        $room = new HotelRoom;
        $room= HotelRoom::findAll(['count_bed' => Yii::$app->request->get('count_bed')]);
        if($room){
            return $this->send(200, ['data' => $room]);
        }else{
            return $this->send(204, ['data' => $room]);
        }
        }
    public function actionFindone(){
        $room = new HotelRoom;
        $room= HotelRoom::findAll(['id_room' => Yii::$app->request->get('id_room')]);
        if($room){
            return $this->send(200, ['data' => $room]);
        }else{
            return $this->send(204, ['data' => $room]);
        }
        }
        public function actionEdit($id_room){
            $user = User::getByToken();
            if($user->isAuthorized() && $user->role_id == 1 ){
            $room = HotelRoom::findOne($id_room);
            $request = Yii::$app->request;
            if(!$room){
                return $this->send(204, null);
            }
            $room->load($request->bodyParams, '') ;
            if(!$room->validate()){
                return $this->send(422, ['error' => ['message' => 'Неверный ввод']]);
            }
            if(UploadedFile::getInstanceByName('photo')){
                $room->photo = UploadedFile::getInstanceByName('photo');
                $hash =hash('sha256', $room->photo->basename);
                $room->photo->saveAs(Yii::$app->basePath. '/web/assets/upload/' .$hash).
                $room->photo=$hash;
                };
            $room->save(false);
            return $this->send(200, ['data' => $room]);
            }
            else{
                return $this->send(403,['error'=>['code'=>403, 'message'=>'Forbidden', 'errors'=>['Доступ запрещен']]]);
            }
        }
        public function actionAll(){
            $room_all = HotelRoom::find()->indexBy('id_room')->all();
            return $this->send(200, ['data' => $room_all]);
        }            
}
