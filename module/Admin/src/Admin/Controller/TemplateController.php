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

class TemplateController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'template';
        $this->moduleName   = 'Tùy chỉnh giao diện';
        $this->modelName    = 'TemplateModel';
        $this->formName     = '\Admin\Form\TemplateForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
        $this->uploadPath   = 'public/pictures/templates';
        $this->imgPrefix    = 'template_';
    }

    public function indexAction()
    {
        $groupTemplateId = $this->params()->fromQuery('group_template_id');

        if ($groupTemplateId != '') {
            switch($groupTemplateId) {
                case 1:
                    $actionTemplateUpdate = 'picture';
                    break;
                case 2:
                    $actionTemplateUpdate = 'content';
                    break;
                case 3:
                    $actionTemplateUpdate = 'slide';
                    break;
            }
            $this->redirect()->toRoute('admin/default', ['controller' => 'template', 'action' => $actionTemplateUpdate], array('query' => array('group_template_id' => $groupTemplateId)));
        } else {
            $this->redirect()->toRoute('admin/default', ['controller' => 'group-template', 'action' => 'index']);
        }
        $this->response;
    }

    public function pictureAction()
    {
        $this->init();

        $this->actionName = 'Cập nhật';

        $groupTemplateId = $this->params()->fromQuery('group_template_id', null);
        $groupTemplateModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupTemplateModel');
        $groupTemplate = $groupTemplateModel->fetchPrimary($groupTemplateId);

        $id = $this->params()->fromQuery('id', null);

        if ($id == null) {

            $recordWhere = $this->model->fetchWhere('group_template_id = ' . $groupTemplateId);

            if (count($recordWhere) <= 0) {
                $id = $this->model->savePrimary([
                    'template_name' => $groupTemplate['group_template_name'],
                    'group_template_id' => $groupTemplateId,
                    'template_status' => 1
                ]);

            } else {
                $recordWhere = current($recordWhere);
                $id = $recordWhere['template_id'];
            }
            $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'picture'], ['query' => ['group_template_id' => $groupTemplateId, 'id' => $id]]);
        }

        $record = $this->model->fetchPrimary($id);

        if ($this->getRequest()->isPost()) {

            $dataPost = $this->getRequest()->getPost();
            $this->form->setInputFilter($this->model->getInputFilter());
            $this->form->setData($dataPost);

            if ($this->formIsValid()) {

                $dataSave = [];

                $pictureUploadName = $this->uploadImage($this->params()->fromFiles('template_picture'), 'template_picture', $id);
                if ($pictureUploadName != '') {
                    $dataSave['template_picture'] = $pictureUploadName;
                }

                $dataSave['template_name']      = $dataPost['template_name'];
                $dataSave['template_status']    = $dataPost['template_status'];

                $this->model->savePrimary($dataSave, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'picture'], ['query' => ['group_template_id' => $groupTemplateId, 'id' => $id]]);
            }
        }

        $this->form->get('template_status')->setOptions(array('value_options' => $this->status));
        $this->form->get('frmSubmit')->setAttributes(array('value' => $this->actionName));
        $this->form->setData($record);

        $this->data['record'] = $record;
        $this->actionName .= ' ' . $groupTemplate['group_template_name'];

        $this->viewName = 'admin/' . $this->module . '/picture.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();
    }

    public function contentAction()
    {

        $this->init();

        $this->actionName = 'Cập nhật';

        $groupTemplateId = $this->params()->fromQuery('group_template_id', null);
        $groupTemplateModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupTemplateModel');
        $groupTemplate = $groupTemplateModel->fetchPrimary($groupTemplateId);

        $id = $this->params()->fromQuery('id', null);

        if ($id == null) {

            $recordWhere = $this->model->fetchWhere('group_template_id = ' . $groupTemplateId);

            if (count($recordWhere) <= 0) {
                $id = $this->model->savePrimary([
                    'template_name' => $groupTemplate['group_template_name'],
                    'group_template_id' => $groupTemplateId,
                    'template_status' => 1
                ]);

            } else {
                $recordWhere = current($recordWhere);
                $id = $recordWhere['template_id'];
            }
            $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'content'], ['query' => ['group_template_id' => $groupTemplateId, 'id' => $id]]);
        }

        $record = $this->model->fetchPrimary($id);

        if ($this->getRequest()->isPost()) {

            $dataPost = $this->getRequest()->getPost();
            $this->form->setInputFilter($this->model->getInputFilter());
            $this->form->setData($dataPost);

            if ($this->formIsValid()) {

                $dataSave = [];
                $dataSave['template_name']      = $dataPost['template_name'];
                $dataSave['template_status']    = $dataPost['template_status'];
                $dataSave['template_content']    = $dataPost['template_content'];

                $this->model->savePrimary($dataSave, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'content'], ['query' => ['group_template_id' => $groupTemplateId, 'id' => $id]]);
            }
        }

        $this->form->get('template_status')->setOptions(array('value_options' => $this->status));
        $this->form->get('frmSubmit')->setAttributes(array('value' => $this->actionName));
        $this->form->setData($record);

        $this->data['record'] = $record;
        $this->actionName .= ' ' . $groupTemplate['group_template_name'];

        $this->viewName = 'admin/' . $this->module . '/content.phtml';
        $this->viewTemplate = 'partial/form_normal.phtml';

        return $this->viewModel();

    }

    public function slideAction()
    {
        $this->init();

        $groupTemplateId = $this->params()->fromQuery('group_template_id', null);

        $uploadService  = $this->getServiceLocator()->get('UploadFile');

        $groupTemplateModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupTemplateModel');

        $groupTemplate = $groupTemplateModel->fetchPrimary($groupTemplateId);

        $records = $this->model->fetchWhere('group_template_id = ' . $groupTemplateId);

        if ($this->getRequest()->isPost()) {

            $dataPost = $this->getRequest()->getPost();
            $isValidateFile = true;

            foreach($this->params()->fromFiles('slide') as $pictureInfo) {

                $pictureNewName = '';
                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {

                    $validateFile = new \Zend\Validator\ValidatorChain();
                    $validateFile->attach(new \Zend\Validator\File\Extension(['png', 'jpg', 'jpeg', 'gif']))
                                 ->attach(new \Zend\Validator\File\Size(['max' => '1MB']));

                    if (!$validateFile->isValid($pictureInfo)) {
                        $isValidateFile = false;
                        break;
                    }
                }
            }

            if ($isValidateFile == true) {
                foreach($this->params()->fromFiles('slide') as $pictureInfo) {

                    $pictureNewName = '';
                    if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                        $uploadService->setPath($this->uploadPath);
                        $uploadService->setFile($pictureInfo['name']);
                        $uploadService->setPrefix($this->imgPrefix . 'slide_');
                        $uploadService->upload();
                        $pictureNewName = $uploadService->getNewFile();

                        $dataSave = [];
                        $dataSave['template_picture'] = $pictureNewName;
                        $dataSave['template_status'] = 1;
                        $dataSave['group_template_id'] = $groupTemplateId;

                        $this->model->savePrimary($dataSave);
                    }
                }

                $this->flashMessenger()->addMessage('Cập nhật thành công', 'msgInfo');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'slide'], ['query' => ['group_template_id' => $groupTemplateId]]);

            } else {
                $this->flashMessenger()->addMessage('Cập nhật thất bại do hình ảnh không hợp lệ', 'msgError');
                $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'slide'], ['query' => ['group_template_id' => $groupTemplateId]]);
            }
        }

        if (isset($_GET['id'])) {
            $template_id = $_GET['id'];

            $record = $this->model->fetchPrimary($template_id);
            unlink($this->uploadPath . '/' . $record['template_picture']);
            $this->model->deletePrimary($template_id);

            $this->flashMessenger()->addMessage('Xóa thành công', 'msgInfo');
            $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'slide'], ['query' => ['group_template_id' => $groupTemplateId]]);
        }

        $this->data['records'] = $records;
        $this->actionName = $groupTemplate['group_template_name'];

        $this->viewName = 'admin/' . $this->module . '/slide.phtml';
        $this->viewTemplate = 'partial/view_simple.phtml';

        return $this->viewModel();
    }
}
