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

class ProductController extends MasterController
{
    public function categoryAction()
    {
        $view = new ViewModel();

        $data   = $this->params()->fromRoute();
        $productCategoryId = $data['id'];

        $productCategoryModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductCategoryModel');
        $productModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductModel');
        $escaper = new \Zend\Escaper\Escaper('utf-8');

        $page = $this->params()->fromQuery('page', 1);
        $products = $productModel->fetchPage($page, 10, 'product_category_id = ' . $productCategoryId);

        $productCategory = $productCategoryModel->fetchPrimary($productCategoryId);

        $crum = '<ul class="crumb">
                    <li><a href="/">Trang chủ</a></li>
                    <li class="sep">/</li>
                    <li>' . $escaper->escapeHtml($productCategory['product_category_name']) . '</li>
                </ul>';

        $view->setVariables([
            'products'          => $products,
            'productCategory'   => $productCategory,
            'name'              => $data['name'],
            'id'                => $data['id'],
            'crum'              => $crum,
        ]);

        return $view;
    }

}
