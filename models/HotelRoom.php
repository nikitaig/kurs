<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "hotel_room".
 *
 * @property int $id_room
 * @property string $number
 * @property int $count_bed
 * @property string $type
 * @property string $discription
 * @property int $price
 * @property string $photo
 *
 * @property RoomOrder[] $roomOrders
 */
class HotelRoom extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'hotel_room';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['number', 'count_bed', 'type', 'discription', 'price', 'photo'], 'required'],
            [['count_bed', 'price'], 'integer'],
            [['type', 'status'], 'string'],
            ['photo', 'file', 'extensions' => 'png, jpg, jpeg'],
            [['number', 'discription'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_room' => 'Id Room',
            'number' => 'Number',
            'count_bed' => 'Count Bed',
            'type' => 'Type',
            'discription' => 'Discription',
            'price' => 'Price',
            'photo' => 'Photo',
            'status' => 'Status',
        ];
    }

    /**
     * Gets query for [[RoomOrders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRoomOrders()
    {
        return $this->hasMany(RoomOrder::class, ['room_id' => 'id_room']);
    }
}
