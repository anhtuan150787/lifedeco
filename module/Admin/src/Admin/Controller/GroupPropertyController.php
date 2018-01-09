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

class GroupPropertyController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'group-property';
        $this->moduleName   = 'Nhóm thuộc tính';
        $this->modelName    = 'GroupPropertyModel';
        $this->formName     = '\Admin\Form\GroupPropertyForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
    }

    public function indexAction()
    {
        $this->init();

        $page = $this->params()->fromQuery('page', 1);

        $records = $this->model->fetchPage($page, $this->pageItemPerCount);

        $this->data['records']      = $records;
        $this->data['paginator']    = true;
        $this->data['status']       = $this->status;
        $this->data['countTable']   = $this->countTable($page);

        $this->viewName = 'admin/' . $this->module . '/index.phtml';
        $this->viewTemplate = 'partial/table_normal.phtml';

        return $this->viewModel();
    }

    public function addAction()
    {
        $this->actionName = 'Thêm';

        $this->init();

        if ($this->getRequest()->isPost()) {

            $dataPost = $this->getRequest()->getPost();
            $this->form->setInputFilter($this->model->getInputFilter());
            $this->form->setData($dataPost);

            if ($this->formIsValid()) {

                $idLastInsert = $this->save();

                $this->flashMessenger()->addMessage('Thêm mới thành công.', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index']);
            }
        }

        $this->setFormSelectOptions();

        $this->viewName = 'admin/' . $this->module . '/form.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function editAction()
    {
        $this->actionName = 'Cập nhật';

        $this->init();

        $id = $this->params()->fromQuery('id');
        $record = $this->model->fetchPrimary($id);

        if ($this->getRequest()->isPost()) {

            $dataPost = $this->getRequest()->getPost();
            $this->form->setInputFilter($this->model->getInputFilter());
            $this->form->setData($dataPost);

            if ($this->formIsValid()) {

                $this->save($id);

                $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'edit'], ['query' => ['id' => $id]]);
            }
        }

        $this->setFormSelectOptions();

        $this->form->get('frmSubmit')->setAttributes(array('value' => $this->actionName));
        $this->form->setData($record);

        $this->viewName = 'admin/' . $this->module . '/form.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function propertyAction()
    {
        $this->actionName = 'Cập nhật';

        $this->init();

        $groupPropertyId = $this->params()->fromQuery('group_property_id');

        $propertyModel =  $this->getServiceLocator()->get('ModelGateway')->getModel('PropertyModel');
        $groupPropertyDetailModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupPropertyDetailModel');

        if ($this->getRequest()->isPost()) {
            $properties = $this->params()->fromPost('property');

            $groupPropertyDetailModel->saveWhere(['group_property_detail_status' => 0], ['group_property_id' => $groupPropertyId]);
            foreach($properties as $k => $v) {
                $checkExist = $groupPropertyDetailModel->checkExistProperty($groupPropertyId, $k);

                if ($checkExist > 0) {
                    $groupPropertyDetailModel->saveWhere(['group_property_detail_status' => $v], ['group_property_id' => $groupPropertyId, 'property_id' => $k]);
                } else {
                    $groupPropertyDetailModel->savePrimary(['group_property_id' => $groupPropertyId, 'property_id' => $k, 'group_property_detail_status' => $v]);
                }
            }

            $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
            $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'property'], ['query' => ['group_property_id' => $groupPropertyId]]);
        }

        $groupProperty = $this->model->fetchPrimary($groupPropertyId);

        $properties = $propertyModel->fetchAll();

        $groupPropertyDetail = $groupPropertyDetailModel->fetchWhere('group_property_id = ' . $groupPropertyId . ' AND group_property_detail_status = 1');
        $groupPropertyDetails = [];
        foreach($groupPropertyDetail as $v) {
            $groupPropertyDetails[$v['property_id']] = $v;
        }

        $this->form->get('frmSubmit')->setAttributes(array('value' => $this->actionName));

        $this->data['properties'] = $properties;
        $this->data['groupProperty'] = $groupProperty;
        $this->data['status'] = $this->status;
        $this->data['groupPropertyDetail'] = $groupPropertyDetails;

        $this->viewName = 'admin/' . $this->module . '/property.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function save($id = null)
    {
        $paramPosts = $this->params()->fromPost();

        $dataSave = [];
        $dataSave['group_property_name']      = $paramPosts['group_property_name'];
        $dataSave['group_property_status']    = $paramPosts['group_property_status'];

        $idLastInsert = $this->model->savePrimary($dataSave, $id);

        return $idLastInsert;
    }

    public function deleteAction()
    {
        $this->init();

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
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index']);

        return $this->response();
    }

    public function setFormSelectOptions()
    {
        $this->form->get('group_property_status')->setOptions(array('value_options' => $this->status));
    }
}
