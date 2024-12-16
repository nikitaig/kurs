<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "inventory".
 *
 * @property int $id_inventory
 * @property string $name_inventory
 * @property string $size
 * @property int $count
 * @property int $price
 * @property string $discription
 * @property string $photo
 *
 * @property InventoryOrder[] $inventoryOrders
 */
class Inventory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'inventory';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name_inventory', 'size', 'count', 'price', 'discription', 'photo'], 'required'],
            [['count', 'price'], 'integer'],
            ['photo', 'file', 'extensions' => 'png, jpg, jpeg'],
            [['name_inventory', 'size', 'discription'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_inventory' => 'Id Inventory',
            'name_inventory' => 'Name Inventory',
            'size' => 'Size',
            'count' => 'Count',
            'price' => 'Price',
            'discription' => 'Discription',
            'photo' => 'Photo',
        ];
    }

    /**
     * Gets query for [[InventoryOrders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInventoryOrders()
    {
        return $this->hasMany(InventoryOrder::class, ['inventory_id' => 'id_inventory']);
    }
}
