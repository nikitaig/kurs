<?php

namespace app\models;

use Yii;

use yii\web\IdentityInterface;
/**
 * This is the model class for table "user_".
 *
 * @property int $id_user
 * @property string $FIO
 * @property string $username
 * @property string $password
 * @property string|null $passport
 * @property string $phone
 * @property string $email
 * @property int $role
 *
 * @property InventoryOrder[] $inventoryOrders
 * @property RoomOrder[] $roomOrders
 */
class User extends \yii\db\ActiveRecord implements IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
//            [['FIO', 'username', 'password', 'phone', 'email', 'password_repetition'], 'required'],
            [['FIO', 'username', 'password', 'phone', 'email'], 'required','on' => self::SCENARIO_DEFAULT],
            ['username', 'match', 'pattern' => '/^[a-z]+$/iu', 'message'=>'Только латиница'],
            ['email', 'email','on' => self::SCENARIO_UPDATE_EMAIL],
            [['phone'], 'required','on' => self::SCENARIO_UPDATE],
            ['password', 'match', 'pattern' => '/^(?=.*[A-Z])(?=.*[\d])(?=.*[a-z])(?=.*[\W])[a-zA-Z\d\W]{6,20}/iu', 'message'=>'Латиница, 6+ символов, 1 заглавная буква, 1 цифра, 1 спец. символ'],
            //['password_repetition', 'compare', 'compareAttribute' => 'password', 'message'=>'Пароли должны совпадать'],
            [['role_id'], 'integer'],

            ['FIO', 'match', 'pattern' => '/^([а-яА-ЯёЁa-zA-Z]+[ ]+)([а-яА-ЯёЁa-zA-Z]+)([ ]+[а-яА-ЯёЁa-zA-Z]+)?$/u', 'message'=>'Кирилица, 3 слова'],
            ['email', 'email', 'message'=>'Некорректный ввод'],
            

            [['FIO', 'username', 'password', 'passport', 'phone', 'email'], 'string', 'max' => 255],
            [['username', 'passport', 'phone'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_user' => 'Id User',
            'FIO' => 'Fio',
            'username' => 'Username',
            'password' => 'Password',
            'passport' => 'Passport',
            'phone' => 'Phone',
            'email' => 'Email',
            'role' => 'Role',
        ];
    }

    /**
     * Gets query for [[InventoryOrders]].
     *
     * @return \yii\db\ActiveQuery
     */
    
    /* public function getInventoryOrders()
    {
        return $this->hasMany(InventoryOrder::class, ['user_id' => 'id_user']);
    }*/

    /**
     * Gets query for [[RoomOrders]].
     *
     * @return \yii\db\ActiveQuery
     */

     /*
    public function getRoomOrders()
    {
        return $this->hasMany(RoomOrder::class, ['user_id' => 'id_user']);
    }*/

//_________________

    public static function findIdentity($id)
    {
    }
    public static function findIdentityByAccessToken($token, $type = null)
    {
    return static::findOne(['token' => $token]);
    }
    public function getId()
    {
    return $this->id;
    }
    public function getAuthKey()
    {
    }
    public function validateAuthKey($authKey)
    {
    }

    


    public function isAdmin() {
        $roles = new Role;
        $admin_role = $roles::findOne(['name' => 'admin']);
        return $this->role_id === $admin_role['id_role'];
    }

    public function isAuthorized() {
        $token = str_replace('Bearer ', '', Yii::$app->request->headers->get('Authorization'));
        if (!$token || $token != $this->token) {
            return false;
        }
        return true;
    }
    public static function getByToken() {
        return self::findOne(['token' => str_replace('Bearer ', '', Yii::$app->request->headers->get('Authorization'))]);
    }




    public function fields()
    {
    $fields = parent::fields();
    
    // удаляем небезопасные поля
    unset($fields['password'], $fields['token']);
/*
    $fields['ordersCount'] = function ($model) {
    return $model->getOrders()->count();
    };
    */
    return $fields;
    }



    const SCENARIO_UPDATE = 'update';
    const SCENARIO_UPDATE_EMAIL = 'update_email';
    const SCENARIO_DEFAULT = 'default';
    public function scenarios(){
    return [
        self::SCENARIO_UPDATE => ['phone'],
        self::SCENARIO_UPDATE_EMAIL => ['email'],
        self::SCENARIO_DEFAULT => ['FIO','email','phone','password','username'],
    ];
    }
}
