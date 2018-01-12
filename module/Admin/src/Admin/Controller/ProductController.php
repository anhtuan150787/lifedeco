<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Admin\Form\ProductSearchForm;
use Admin\View\Helper\Currency;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class ProductController extends MasterController
{
    public function __construct()
    {
        $this->module       = 'product';
        $this->moduleName   = 'Dự án';
        $this->modelName    = 'ProductModel';
        $this->formName     = '\Admin\Form\ProductForm';
        $this->status       = ['1' => 'Kích hoạt', '0' => 'Tạm dừng'];
        $this->uploadPath   = 'public/pictures/products';
        $this->imgPrefix    = 'product_';
    }

    public function indexAction()
    {
        $this->init();

        $session = new Container();

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search');
        }

        if ($session->offsetExists('search')) {
            $search = $session->offsetGet('search');
        }

        $page = $this->params()->fromQuery('page', 1);

        $formSearch = new ProductSearchForm();
        $formSearch = $this->setFormProductCategoryOptions($formSearch);


        if ($this->getRequest()->isPost()) {
            $paramsSearch = $this->params()->fromPost();

            $search['product_name_search']        = ($paramsSearch['product_name_search'] != '') ? $paramsSearch['product_name_search'] : null;
            $search['product_category_search']     = ($paramsSearch['product_category_search'] != '') ? $paramsSearch['product_category_search'] : null;

            $formSearch->setData($search);
            $session->offsetSet('search', $search);
        }

        $result = $this->model->fetchPage($page, $this->pageItemPerCount, $search);

        $this->data['records']      = $result['paging'];
        $this->data['data']         = $result['data'];
        $this->data['paginator']    = true;
        $this->data['status']       = $this->status;
        $this->data['countTable']   = $this->countTable($page, $result['total']);
        $this->data['formSearch']   = $formSearch;

        $this->data['total']        = $result['total'];
        $this->data['pageNo']       = $page;
        $this->data['pageSize']     = $this->pageItemPerCount;

        $this->viewName = 'admin/' . $this->module . '/index.phtml';
        $this->viewTemplate = 'partial/table_paging_special.phtml';

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
        $currency = new Currency();

        $this->init();

        $id = $this->params()->fromQuery('id');
        $record = $this->model->fetchPrimary($id);
        $record['product_price'] = $currency->__invoke($record['product_price']);

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

        $this->setFormSelectOptions($id);

        $productPictureModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductPictureModel');
        $productPictures = $productPictureModel->fetchWhere('product_id = ' . $id);
        $record['productPictures'] = $productPictures;

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

        $pictureUploadName = $this->uploadImage($this->params()->fromFiles('product_picture'), 'product_picture', $id);
        if ($pictureUploadName != '') {
            $dataSave['product_picture'] = $pictureUploadName;
        }

        if ($id == null) {
            $dataSave['product_date_created']  = $this->timeNow;
            $dataSave['product_users_created'] = $this->user->users_id;

            $dataSave['product_date_updated']  = $this->timeNow;
            $dataSave['product_users_updated'] = $this->user->users_id;
        } else {
            $dataSave['product_date_updated']  = $this->timeNow;
            $dataSave['product_users_updated'] = $this->user->users_id;
        }
        $dataSave['product_name']     = $paramPosts['product_name'];
//        $dataSave['product_price']     = str_replace('.', '', $paramPosts['product_price']);
        $dataSave['product_body']      = $paramPosts['product_body'];
        $dataSave['product_status']    = $paramPosts['product_status'];
        $dataSave['product_category_id']     = $paramPosts['product_category_id'];

        $idLastInsert = $this->model->savePrimary($dataSave, $id);

        /*
        * Insert picture slide product
        */
        $productPictureModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductPictureModel');
        $uploadService = $this->getServiceLocator()->get('UploadFile');
        $pictureInfo = $this->params()->fromFiles('product_picture_multi');
        $pictureNewName = '';

        if (!empty($pictureInfo)) {
            foreach ($pictureInfo as $v) {
                if (!empty($v) && $v['name'] != '') {
                    $uploadService->setPath($this->uploadPath);
                    $uploadService->setFile($v['name']);
                    $uploadService->setPrefix($this->imgPrefix);
                    $uploadService->upload();
                    $pictureNewName = $uploadService->getNewFile();

                    $productPictureModel->savePrimary(['product_id' => $idLastInsert, 'product_picture_name' => $pictureNewName]);
                }
            }
        }



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
                unlink($this->uploadPath . '/' . $record['product_picture']);
                $this->model->deletePrimary($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công', 'msgInfo');
        $this->redirect()->toRoute('admin/default', ['controller' => $this->module, 'action' => 'index']);

        return $this->response();
    }

    public function setFormSelectOptions()
    {
        $productCategoryModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductCategoryModel');
        $productCategories = $productCategoryModel->getProductCategories();

        $optionsProductCategory = ['' => '--- Chọn Danh mục ---'];
        foreach ($productCategories as $k => $v) {
            $optionsProductCategory[$v['product_category_id']] = str_repeat('__', $v['product_category_level']) . ' ' . $v['product_category_name'];
        }

        $this->form->get('product_status')->setOptions(array('value_options' => $this->status));
        $this->form->get('product_category_id')->setOptions(array('value_options' => $optionsProductCategory));
    }

    public function setFormProductCategoryOptions($form)
    {
        $productCategoryModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductCategoryModel');
        $productCategories = $productCategoryModel->getProductCategories();

        $optionsProductCategory = ['' => '--- Chọn Danh mục ---'];
        foreach ($productCategories as $k => $v) {
            $optionsProductCategory[$v['product_category_id']] = str_repeat('__', $v['product_category_level']) . ' ' . $v['product_category_name'];
        }

        $form->get('product_category_search')->setOptions(array('value_options' => $optionsProductCategory));

        return $form;
    }

    public function deletePictureMultiAction()
    {
        $this->init();

        $id = $this->params()->fromPost('id');

        $productPictureModel = $this->getServiceLocator()->get('ModelGateway')->getModel('ProductPictureModel');
        $record = $productPictureModel->fetchPrimary($id);

        unlink($this->uploadPath . '/' . $record['product_picture_name']);

        $productPictureModel->deletePrimary($id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
