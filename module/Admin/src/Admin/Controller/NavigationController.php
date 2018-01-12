<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class NavigationController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'navigation';
        $this->moduleName   = 'Liên kết';
        $this->modelName    = 'NavigationModel';
        $this->formName     = '\Admin\Form\NavigationForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
        $this->navigationTypes = [
            1 => 'Nội dung trang',
            2 => 'Bài viết',
            3 => 'Danh mục bài viết',
            4 => 'Liên kết ngoài',
            5 => 'Danh mục dự án',
            6 => 'Dự án',
        ];
    }

    public function indexAction()
    {
        $this->init();

        $groupNavigationId  = $this->params()->fromQuery('group_navigation_id');
        $id       = $this->params()->fromQuery('id', null);

        //Group navigation
        $groupNavigationModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupNavigationModel');
        $groupNavigation = $groupNavigationModel->fetchPrimary($groupNavigationId);

        //Navigation parent
        $navigationParent = $this->model->getNavigations($groupNavigationId);

        //Post category
        $postCategoryModel = $this->getServiceLocator()->get('ModelGateway')->getModel('PostCategoryModel');
        $postCategory = $postCategoryModel->getPostCategories();

        //Page
        $postModel = $this->getServiceLocator()->get('ModelGateway')->getModel('PostModel');
        $page = $postModel->fetchWhere(' post_type = 2 ');

        //Post
        $post = $postModel->fetchWhere(' post_type = 1');

        //Product category
        $productCategoryModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductCategoryModel');
        $productCategory = $productCategoryModel->getProductCategories();

        //Product
        $productModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductModel');
        $product = $productModel->fetchAll();

        if ($id != null) {
            $record = $this->model->fetchPrimary($id);
            $this->data['record'] = $record;
        }

        $this->data['postCategory']     = $postCategory;
        $this->data['page']             = $page;
        $this->data['post']             = $post;
        $this->data['navigationParent'] = $navigationParent;
        $this->data['navigation']       = $navigationParent;
        $this->data['navigationTypes']  = $this->navigationTypes;
        $this->data['id']               = $id;
        $this->data['groupNavigation']  = $groupNavigation;
        $this->data['productCategory']  = $productCategory;
        $this->data['product']          = $product;
        $this->data['status']           = $this->status;

        $this->viewName = 'admin/' . $this->module . '/index.phtml';
        $this->viewTemplate = 'partial/view_simple.phtml';

        return $this->viewModel();
    }

    public function addAction()
    {
        $this->init();

        $this->save();

        $paramPosts = $this->params()->fromPost();

        $this->flashMessenger()->addMessage('Thêm mới thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['group_navigation_id' => $paramPosts['group_navigation_id']]]);

        return $this->response();
    }

    public function editAction()
    {
        $this->init();

        $paramPosts = $this->params()->fromPost();

        $this->save($paramPosts['id']);

        $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['group_navigation_id' => $paramPosts['group_navigation_id']]]);

        return $this->viewModel();
    }

    public function save($id = null)
    {
        $url = $this->getServiceLocator()->get('viewhelpermanager')->get('url');
        $functions = new \Application\View\Helper\Functions();
        $paramPosts = $this->params()->fromPost();

        $dataSave = [];
        $dataSave['navigation_name']        = $paramPosts['navigation_name'];
        $dataSave['navigation_url_id']      = $paramPosts['navigation_url_id'];

        $routeName = '';
        switch($paramPosts['navigation_type']) {
            case 1:
               $routeName = 'home-page';
                break;

            case 2:
                $routeName = 'home-news-detail';
                break;

            case 3:
                $routeName = 'home-news-category';
                break;

            case 5:
                $routeName = 'home-product-category';
                break;

            case 6:
                $routeName = 'home-product-detail';
                break;

            default;
                break;
        }

        if ($routeName != '') {
            $navigationName = $url($routeName, array('name' => $functions->formatTitle($paramPosts['navigation_url_name']), 'id' => $paramPosts['navigation_url_id']));
        } else {
            $navigationName = $paramPosts['navigation_url_name'];
        }

        $dataSave['navigation_url_name']    = $navigationName;
        $dataSave['navigation_position']    = $paramPosts['navigation_position'];
        $dataSave['navigation_parent']      = $paramPosts['navigation_parent'];
        $dataSave['navigation_type']        = $paramPosts['navigation_type'];
        $dataSave['group_navigation_id']    = $paramPosts['group_navigation_id'];
        $dataSave['navigation_status']      = $paramPosts['navigation_status'];;

        $this->model->savePrimary($dataSave, $id);
    }


    public function deleteAction()
    {
        $this->init();

        $groupNavigationId = $this->params()->fromQuery('group_navigation_id');

        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
        } else {
            $id[] = $this->params()->fromQuery('id');
        }

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $this->model->deletePrimary($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['group_navigation_id' => $groupNavigationId]]);

        return $this->response();
    }
}
