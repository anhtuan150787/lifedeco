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

class MenuController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'menu';
        $this->moduleName   = 'Menu';
        $this->modelName    = 'MenuModel';
        $this->formName     = '\Admin\Form\MenuForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
    }

    public function indexAction()
    {
        $this->init();

        $this->data['records'] = $this->model->getMenus();
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

        $this->viewName = 'admin/' . $this->module . '/form.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function save($id = null)
    {
        $paramPosts = $this->params()->fromPost();

        $dataSave = [];
        $dataSave['menu_name']      = $paramPosts['menu_name'];
        $dataSave['menu_parent']    = $paramPosts['menu_parent'];
        $dataSave['menu_status']    = $paramPosts['menu_status'];
        $dataSave['menu_url']       = $paramPosts['menu_url'];
        $dataSave['menu_icon']      = $paramPosts['menu_icon'];
        $dataSave['menu_position']      = $paramPosts['menu_position'];

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
                $this->model->deletePrimary($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index']);

        return $this->response();
    }

    public function setFormSelectOptions()
    {
        $menuRoot = $this->model->getMenus();
        $optionsMenuRoot = array(0 => '--- Gốc ---');
        foreach ($menuRoot as $k => $v) {
            $optionsMenuRoot[$v['menu_id']] = str_repeat('__', $v['menu_level']) . ' ' . $v['menu_name'];
        }

        $this->form->get('menu_parent')->setOptions(array('value_options' => $optionsMenuRoot));
        $this->form->get('menu_status')->setOptions(array('value_options' => $this->status));
    }

}
