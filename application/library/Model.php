<?php

class Model
{
	//配置
	public $connection ;        //数据库连接资源

	//初始化配置
	public function __construct() {
		$connection = \Yaf_Registry::get('connection');
		if (empty($db)) {
			$config = \Yaf_Registry::get("config");
			$dbConfig = $config->database->main->toArray();
			$connection = $this->initPdo($dbConfig);
			\Yaf_Registry::set('connection', $connection);
		}
		$this->connection = $connection;
	}


	/**
	 * 使用pdo连接
	 * @param $config
	 * @return \PDO
	 */
	private function initPdo($config) {
		$dbConfig = array(
			'host'      => $config['host'],       //'127.0.0.1',//数据库连接ip,默认本机
			'port'      => $config['port'],       //端口号,默认3306
			'username'  => $config['username'],   //用户名,默认root
			'password'  => $config['password'],   //密码,默认空
			'dbname'    => $config['dbname'],     //数据库名字
			'charset'   => $config['charset']     //字符集,默认utf8
		);
		$dsn = 'mysql:host=' . $dbConfig['host'] . ';port=' . $dbConfig['port'] . ';dbname=' . $dbConfig['dbname'];
		$pdo = new \PDO($dsn, $dbConfig['username'], $dbConfig['password'], array(\PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . $dbConfig['charset']));
		return $pdo;
	}


}