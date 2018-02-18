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
use Zend\View\Model\ViewModel;

class IndexController extends MasterController
{
    public function indexAction()
    {
        $view = new ViewModel();

        $productCategoryModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductCategoryModel');
        $productCategories = $productCategoryModel->fetchWhere('product_category_status = 1 AND product_category_picture !=""', 6);

        $dataProductcategories = [];
        foreach($productCategories as $v) {
            $dataProductcategories[$v['product_category_id']] = $v;
        }

        $productModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductModel');
        $products = $productModel->fetchWhere('product_status = 1', 3);

        $view->productCategories = $dataProductcategories;
        $view->products = $products;

        return $view;
    }

}
