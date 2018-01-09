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

class GroupTemplateController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'group-template';
        $this->moduleName   = 'Tùy chỉnh giao diện';
        $this->modelName    = 'GroupTemplateModel';
        $this->formName     = '\Admin\Form\GroupTemplateForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
        $this->groupTemplateTypes = ['1' => 'Hình ảnh', '2' => 'Nội dung', '3' => 'Slide ảnh'];
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

    public function save($id = null)
    {
        $paramPosts = $this->params()->fromPost();

        $dataSave = [];
        $dataSave['group_template_name']      = $paramPosts['group_template_name'];
        $dataSave['group_template_status']    = $paramPosts['group_template_status'];
        $dataSave['group_template_type']      = $paramPosts['group_template_type'];

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
        $this->form->get('group_template_status')->setOptions(array('value_options' => $this->status));
        $this->form->get('group_template_type')->setOptions(array('value_options' => $this->groupTemplateTypes));
    }
}
