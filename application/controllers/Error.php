<?php


class ErrorController extends Yaf_Controller_Abstract {

    public function errorAction(\Exception $exception) {
        $config = Yaf_Registry::get("config");
        $debug = $config->error->debug;
        $this->getView()->assign('debug', $debug);
        $this->getView()->assign('code', $exception->getCode());
        $this->getView()->assign('message', $exception->getMessage());

    }
}
