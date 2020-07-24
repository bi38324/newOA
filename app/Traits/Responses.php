<?php

namespace App\Traits;

use Dingo\Api\Routing\Helpers;
use Illuminate\Pagination\AbstractPaginator;
use Route;

trait Responses
{
    use Helpers;

    protected function success($data = [], $message = '成功', $type = '', $view = '')
    {
        return $this->response('200', $data, $message, $type, $view);
    }

    protected function error($code = 400, $message = '',  $data = [], $type = '', $view = '')
    {

        if (($message instanceof \Exception)) {
            $exception = $message;
            if (env("APP_DEBUG")) {
                $message = "文件：" . $exception->getFile();
                $message .= "，行数：" . $exception->getLine();
                $message .= "，信息：" . $exception->getMessage();
            }
            //else {
            //    $code    = $code??(!is_string($exception->getCode()) ? 0: $exception->getCode());
            //    $message = empty($exception->getMessage()) ? '未知异常' : __($exception->getMessage());
            //}
        }
        return $this->response($code, $data, $message, $type, $view);
    }

    protected function response($code = 'unknown', $data = [], $message = '', $type = '', $view = '')
    {
        $result = [
            'code'    => $code,
            'message' => empty($message) ? trans('api.' . $code) : $message,
        ];

        $result['result'] = $this->toResponse($data);

        $type = empty($type) ? request('t', 'json') : $type;

        if ($type == 'json') {

            return $this->returnJson($result);

        } elseif ($type == 'jsonp') {

            return $this->returnJsonp($result);

        } else {
            return $this->returnView($result, $view);
        }
    }

    protected function returnJson($result)
    {
        return response()->json($result)->setEncodingOptions(JSON_UNESCAPED_UNICODE);
    }

    protected function returnJsonp($result)
    {
        return response()->json($result)->setEncodingOptions(JSON_UNESCAPED_UNICODE)
            ->withCallback(request('callback', 'callback_' . str_random(40)));
    }

    protected function returnView($result, $view)
    {
        return response()->view($this->getView($view), $result);
    }

    protected function getView($view = '')
    {
        if (!empty($view)) {

            return $view;

        } elseif (!empty(Route::currentRouteName())) {

            return Route::currentRouteName();

        } else {

            $action             = Route::currentRouteAction();
            list($class, $file) = explode('@', $action);
            $controller         = substr($class, strrpos($class, '\\') + 1);
            $dirName            = substr($controller, 0, strlen($controller) - 10);
            return $this->getSubDomain() . '.' . strtolower($dirName) . '.' . $file;

        }
    }

    protected function toResponse($data)
    {
        $result = [];
        if (is_object($data) &&
            !empty($data->resource)
            && $data->resource instanceof AbstractPaginator) {
            $result['lists']      = $data;
            $result['pagination'] = [
                'total'    => $data->resource->total(),
                'per_page' => $data->resource->perPage(),
                'page'     => $data->resource->currentPage(),
                'next'     => $data->resource->hasMorePages(),
            ];

        } else {
            $result = $data;
        }

        $ret = str_replace('null', '""', json_encode($result));
        return json_decode($ret);
    }
}
