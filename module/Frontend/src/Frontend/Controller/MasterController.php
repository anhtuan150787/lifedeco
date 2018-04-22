<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Frontend\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\MvcEvent;

class MasterController extends AbstractActionController
{
    public function onDispatch(MvcEvent $e)
    {
        /*
         * Set layout
         */
        $this->layout('layout/frontend');


        $navigationModel = $e->getApplication()->getServiceManager()->get('FrontendModelGateway')->getModel('NavigationModel');
        $navigations = $navigationModel->getNavigations(5);

        $postModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PostModel');
        $productModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductModel');

        $postModel->saveWhere(['post_status' => 1], 'post_push_time <="' . date('Y-m-d H:i:s', time()) . '"');
        $productModel->saveWhere(['product_status' => 1], 'product_push_time <="' . date('Y-m-d H:i:s', time()) . '"');

        $posts = $postModel->fetchWhere(' post_type = 1 ', 5);

//        $websiteGeneralModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('WebsiteGeneralModel');
//        $websiteGeneral = $websiteGeneralModel->fetchPrimary(1);

        /*
        * View layout
        */
        $viewModel = $e->getApplication()->getMvcEvent()->getViewModel();
        $viewModel->navigations = $navigations;
        $viewModel->posts = $posts;
//        $viewModel->websiteGeneral = $websiteGeneral;

        $c = $e->getTarget();
        $match = $e->getRouteMatch();
        $controllerArr = explode('\\', $match->getParam('controller'));
        $controller = strtolower($controllerArr[2]);
        $module = strtolower($controllerArr[0]);

        $viewModel->controller = $controller;

        return parent::onDispatch($e);
    }

    public function init()
    {

    }
}
