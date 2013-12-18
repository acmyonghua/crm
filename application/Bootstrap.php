<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected function _initView() {
        try {
            $view = Zend_Layout::startMvc()->getView();
            $view->headTitle('CRM')->setSeparator(' : ');
            $view->doctype('HTML5');
            $view->headMeta()
            ->setCharset('utf-8');

            return $view;
        } catch (Exception $e) {
            echo $e->getMessage();
            exit;
        }
    }

}

