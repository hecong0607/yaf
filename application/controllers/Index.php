<?php
class IndexController extends Yaf_Controller_Abstract {
    public function indexAction() {
		$model = new Model();

//		$st = $model->connection->query("select * from cms_admin limit 5");
//
//		$rs = $st->fetchAll(PDO::FETCH_OBJ);
//
//		var_dump($rs);die;
		$this->getView()->assign("content", "Hello World");


    }
    public function testAction() {

		var_dump('test123561206');die;

    }
}
