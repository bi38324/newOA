<?php

namespace App\Libs;


use Illuminate\Support\Facades\Storage;

class Upload
{
    public function upload($file, $allowedFileExtension = ['jpg', 'jpeg', 'png', 'doc', 'docx', 'pdf'], $customFileName = '')
    {
        if (!empty($file)) {
            $extension = $file->getClientOriginalExtension();
            $filename  = $file->getClientOriginalName();
            $check     = in_array($extension, $allowedFileExtension);
            if (!empty($customFileName)) {
                $filename = $customFileName;
            }

            // 可上传文件扩展验证
            if ($check) {

                $FilePath = $file->getRealPath(); //获取文件临时存放位置
                Storage::disk('admin')->put($filename, file_get_contents($FilePath)); //存储文件

                $url = $filename; //文件路径
                return $url;
            }
        }
        return false;
    }
}
