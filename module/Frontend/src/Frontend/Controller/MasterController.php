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

        /*
        * View layout
        */
        $viewModel = $e->getApplication()->getMvcEvent()->getViewModel();
        $viewModel->navigations = $navigations;

        return parent::onDispatch($e);
    }

    public function init()
    {

    }
}
