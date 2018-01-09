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
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class PropertyDetailController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'property-detail';
        $this->moduleName   = 'Chi tiết thuộc tính';
        $this->modelName    = 'PropertyDetailModel';
        $this->formName     = '';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
    }

    public function indexAction()
    {
        $this->init();

        $propertyId = $this->params()->fromQuery('property_id');
        $id       = $this->params()->fromQuery('id', null);

        $propertyModel = $this->getServiceLocator()->get('ModelGateway')->getModel('PropertyModel');
        $propertyDetailModel = $this->getServiceLocator()->get('ModelGateway')->getModel('PropertyDetailModel');

        $property = $propertyModel->fetchPrimary($propertyId);
        $propertyDetail = $propertyDetailModel->fetchWhere(' property_id = ' . $propertyId);

        if ($id != null) {
            $record = $this->model->fetchPrimary($id);
            $this->data['record'] = $record;
        }

        $this->data['property'] = $property;
        $this->data['propertyDetail'] = $propertyDetail;
        $this->data['id'] = $id;

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
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['property_id' => $paramPosts['property_id']]]);

        return $this->response();
    }

    public function editAction()
    {
        $this->init();

        $paramPosts = $this->params()->fromPost();

        $this->save($paramPosts['id']);

        $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['property_id' => $paramPosts['property_id']]]);

        return $this->viewModel();
    }

    public function deleteAction()
    {
        $this->init();

        $propertyId = $this->params()->fromQuery('property_id');

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
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index'], ['query' => ['property_id' => $propertyId]]);

        return $this->response();
    }

    public function save($id = null)
    {
        $paramPosts = $this->params()->fromPost();

        if ($paramPosts['property_detail_default'] == 1) {
            $this->model->saveWhere(['property_detail_default' => 0], ['property_id' => $paramPosts['property_id']]);
        }

        $dataSave = [];
        $dataSave['property_detail_name']    = $paramPosts['property_detail_name'];
        $dataSave['property_detail_value']   = $paramPosts['property_detail_value'];
        $dataSave['property_detail_default'] = $paramPosts['property_detail_default'];
        $dataSave['property_id']             = $paramPosts['property_id'];

        $this->model->savePrimary($dataSave, $id);
    }
}
