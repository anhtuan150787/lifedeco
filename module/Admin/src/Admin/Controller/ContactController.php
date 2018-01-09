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

class ContactController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'contact';
        $this->moduleName   = 'Liên hệ';
        $this->modelName    = 'ContactModel';
       // $this->formName     = '\Admin\Form\PropertyForm';
       // $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
       // $this->typeProperty = ['text' => 'Text', 'selectbox' => 'Select box', 'dropbox' => 'Drop box', 'textarea' => 'Textarea', 'checkbox' => 'Checkbox'];
    }

    public function indexAction()
    {
        $this->init();

        $page = $this->params()->fromQuery('page', 1);

        $records = $this->model->fetchPage($page, $this->pageItemPerCount);

        $this->data['records']      = $records;
        $this->data['paginator']    = true;
        $this->data['status']       = $this->status;
        $this->data['type']       = $this->typeProperty;
        $this->data['countTable']   = $this->countTable($page);

        $this->viewName = 'admin/' . $this->module . '/index.phtml';
        $this->viewTemplate = 'partial/table_normal.phtml';

        return $this->viewModel();
    }

    public function editAction()
    {
        $this->init();

        $id = $this->params()->fromQuery('id');
        $record = $this->model->fetchPrimary($id);

        $this->model->savePrimary(['contact_viewed' => 1], $id);

        $this->data['record']      = $record;

        $this->viewName = 'admin/' . $this->module . '/form.phtml';
        $this->viewTemplate = 'partial/view_simple.phtml';

        return $this->viewModel();
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
}
