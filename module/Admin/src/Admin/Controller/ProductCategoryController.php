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

class ProductCategoryController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'product-category';
        $this->moduleName   = 'Danh mục dự án';
        $this->modelName    = 'ProductCategoryModel';
        $this->formName     = '\Admin\Form\ProductCategoryForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
        $this->uploadPath   = 'public/pictures/product_categories';
        $this->imgPrefix    = 'product_category_';
    }

    public function indexAction()
    {
        $this->init();

        $this->data['records'] = $this->model->getProductCategories();
        $this->data['status']  = $this->status;
        $this->data['countTable']   = $this->countTable();

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

                $this->save();

                $this->flashMessenger()->addMessage('Thêm mới thành công', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'add']);
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

        $this->data['id'] = $id;
        $this->data['record'] = $record;

        $this->viewName = 'admin/' . $this->module . '/form.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function save($id = null)
    {
        $paramPosts = $this->params()->fromPost();

        $dataSave = [];

        $pictureUploadName = $this->uploadImage($this->params()->fromFiles('product_category_picture'), 'product_category_picture', $id);
        if ($pictureUploadName != '') {
            $dataSave['product_category_picture'] = $pictureUploadName;
        }

        $dataSave['product_category_name']      = $paramPosts['product_category_name'];
        $dataSave['product_category_parent']    = $paramPosts['product_category_parent'];
        $dataSave['product_category_status']    = $paramPosts['product_category_status'];
        //$dataSave['group_property_id']          = $paramPosts['group_property_id'];

        if ($id == null) {
            $dataSave['product_category_date_created']  = $this->timeNow;
            $dataSave['product_category_users_created'] = $this->user->users_id;
        } else {
            $dataSave['product_category_date_updated']  = $this->timeNow;
            $dataSave['product_category_users_updated'] = $this->user->users_id;
        }

        $this->model->savePrimary($dataSave, $id);
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
                $record = $this->model->fetchPrimary($v);
                unlink($this->uploadPath . '/' . $record['product_category_picture']);
                $this->model->deletePrimary($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index']);

        return $this->response();
    }

    public function setFormSelectOptions()
    {
        $list = $this->model->getProductCategories();
        $optionsList = array(0 => '--- Gốc ---');
        foreach ($list as $k => $v) {
            $optionsList[$v['product_category_id']] = str_repeat('__', $v['product_category_level']) . ' ' . $v['product_category_name'];
        }

//        $groupPropertyModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupPropertyModel');
//        $groupProperty = $groupPropertyModel->fetchAll();
//
//        $optionsListGroupProperty = array(0 => '--- Nhóm thuộc tính ---');
//        foreach ($groupProperty as $k => $v) {
//            $optionsListGroupProperty[$v['group_property_id']] = $v['group_property_name'];
//        }

        $this->form->get('product_category_parent')->setOptions(array('value_options' => $optionsList));
        $this->form->get('product_category_status')->setOptions(array('value_options' => $this->status));
//        $this->form->get('group_property_id')->setOptions(array('value_options' => $optionsListGroupProperty));
    }

}
