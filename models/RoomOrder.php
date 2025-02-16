<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "room_order".
 *
 * @property int $id_rorder
 * @property int $user_id
 * @property int $room_id
 * @property string $date_broni
 * @property int $count_night
 * @property string $passport
 * @property string $phone
 * @property string $FIO
 *
 * @property HotelRoom $room
 * @property User $user
 */
class RoomOrder extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'room_order';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'room_id', 'date_broni', 'count_night', 'passport', 'phone', 'FIO'], 'required'],
            [['user_id', 'room_id', 'count_night'], 'integer'],
            [['date_broni'], 'safe'],
            [['passport', 'phone', 'FIO'], 'string', 'max' => 255],
            [['room_id'], 'exist', 'skipOnError' => true, 'targetClass' => HotelRoom::class, 'targetAttribute' => ['room_id' => 'id_room']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id_user']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_rorder' => 'Id Rorder',
            'user_id' => 'User ID',
            'room_id' => 'Room ID',
            'date_broni' => 'Date Broni',
            'count_night' => 'Count Night',
            'passport' => 'Passport',
            'phone' => 'Phone',
            'FIO' => 'Fio',
        ];
    }

    /**
     * Gets query for [[Room]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRoom()
    {
        return $this->hasOne(HotelRoom::class, ['id_room' => 'room_id']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id_user' => 'user_id']);
    }
}
