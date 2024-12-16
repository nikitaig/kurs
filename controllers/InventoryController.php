<?php
namespace app\controllers;

use app\models\Inventory;
use app\models\User;
use yii\web\UploadedFile;
use Yii;

class InventoryController extends FunctionController
{
    public $modelClass = 'app\models\Inventory';

    public function actionCreate(){
         $user = User::getByToken();
         $post_data=\Yii::$app->request->post();
         if (!($user && $user->isAuthorized() && $user->role_id == 1)) {
            return $this->send(403, ['error' => ['message' => 'Доступ запрещен']]);
        }
             $post_data=\Yii::$app->request->post();
             $photoo=new Inventory();
             $photoo->load($post_data, '');
             $photoo->photo=UploadedFile::getInstanceByName('photo');
            if (!$photoo->validate()) return $this->validation($photoo);
             $hash=hash('sha256', $photoo->photo->baseName) . '.' . $photoo -> photo->extension;
             $photoo->photo->saveAs(\Yii::$app->basePath. '/web/assets/upload/' . $hash);
             $photoo->photo=$hash;
             $photoo->save(false);
             return $this->send(204, null);
             } 



/*
    public function actionCount(){
        $room = new HotelRoom;
        $room= HotelRoom::findAll(['count_bed' => Yii::$app->request->get('count_bed')]);
       // $room= HotelRoom::findAll(['type' => Yii::$app->request->get('type')]);
        //$room= HotelRoom::findAll(['number' => Yii::$app->request->get('number')]);
        return $this->send(200, ['data' => $room]);
        }

    public function actionFindone(){
        $room = new HotelRoom;
        $room= HotelRoom::findAll(['id_room' => Yii::$app->request->get('id_room')]);
       // $room= HotelRoom::findAll(['type' => Yii::$app->request->get('type')]);
        //$room= HotelRoom::findAll(['number' => Yii::$app->request->get('number')]);
        return $this->send(200, ['data' => $room]);
        }
  */          
}
