<?php
namespace App\Http\Services;

use App\Http\Model\CustomerContact;
use DB;
use Hash;

class WxUserService extends BaseService
{
    public function __construct()
    {
        $this->model = new CustomerContact();
    }

    public function syncYouzanBuyer($buyerInfo){

        $wxUser = [];
        // 仅同步微信登录信息
        if(!empty($buyerInfo['outer_user_id'])){
            $wxUser = $this->getInfoByFiled($buyerInfo['outer_user_id'],'open_id');

            if(empty($wxUser)){
                $data = [
                    'open_id'      => $buyerInfo['outer_user_id'],
                    'phone'        => $buyerInfo['buyer_phone'],
                    'nickName'     => $buyerInfo['fans_nickname'],
                    'headImgUrl'   => '',
                    'union_id'     => '',
                    'from_channel' => 'youzan',
                ];
                $wxUser = $this->model->create($data);
            }
        }
        return $wxUser;
    }

    public function getUserPhone($user){

        $staff = $this->getInfoByFiled($user['UserId'], 'userid');
        $phone = $staff->phone;
        return $phone;
    }

    public function saveWechatInfo($wxData = []){

        $data['open_id']    = $wxData['openid'];
        $data['nickName']   = $wxData['nickname'];
        $data['sex']        = $wxData['sex'];
        $data['province']   = $wxData['province'];
        $data['city']       = $wxData['city'];
        $data['country']    = $wxData['country'];
        $data['headImgUrl'] = $wxData['headimgurl'];
        $data['union_id']   = $wxData['unionid'];

        // 判断用户union_id是否存在
        $user = null;
        if(!empty($data['union_id'])){
            $user = $this->getInfoByFiled($data['union_id'], 'union_id');
        }

        if(empty($user)){
            // 不存在，再判断open_id存不存在
            $user = $this->getInfoByFiled($data['open_id'], 'open_id');
        }

        // 是不是老用户
        if(!empty($user)){
            $user->save($data);
        }
        return $user;
    }

    public function saveMiniProgram($miniData){

        $data['open_id']    = $miniData['openId'];
        $data['nickName']   = $miniData['nickName'];
        $data['sex']        = $miniData['gender'];
        $data['province']   = $miniData['province'];
        $data['city']       = $miniData['city'];
        $data['country']    = $miniData['country'];
        $data['headImgUrl'] = $miniData['avatarUrl'];
        $data['union_id']   = $miniData['unionId'];

        $users              = $this->getInfoByFiled($data['union_id'], 'union_id');
        if (!empty($users)) {
            $users->save($data);
        }
        return $users;
    }

    // 游客绑定手机后正式用户
    public function saveUserFromVisitor($visitor, $phoneInfo = [], $wxUser = null){

        return DB::transaction(function () use ($visitor, $phoneInfo, $wxUser) {

            $data                = [];
            $data['open_id']     = $visitor->open_id;
            $data['nickName']    = $visitor->nickName;
            $data['sex']         = $visitor->sex;
            $data['headImgUrl']  = $visitor->headImgUrl;
            $data['province']    = $visitor->province;
            $data['city']        = $visitor->city;
            $data['country']     = $visitor->country;
            $data['true_name']   = $visitor->true_name;
            $data['school_name'] = $visitor->school_name;
            $data['union_id']    = $visitor->union_id;

            if(!empty($phoneInfo)){
                $data = array_merge($data, $phoneInfo);
            }

            $visitor->is_bind_phone = 1;
            $visitor->save();

            if(empty($wxUser)){
                return $this->model->create($data);
            }else{
                // 如果已经有手机号，未微信登录，绑定微信信息到该手机号
                $wxUser->fill($data)->save();
                return $wxUser;
            }
        });

    }

    public function create($phone, $pwd, $realName= '', $channel = 'm'){

        $data = [
            'open_id'      => null,
            'phone'        => $phone,
            'tag'          => 1,
            'from_channel' => $channel,
            'nickName'     => $phone,
            'headImgUrl'   => '',
            'true_name'     => $realName
        ];
//        $users  = new YhrUser();
//        $userid = $users->getUser($phone);
//
//        if ($userid) {
//            $data['tag']        = 1;
//            $data['y_users_id'] = $userid;
//        }
        return $this->model->create($data);
    }
}
