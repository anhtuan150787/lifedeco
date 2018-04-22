<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Frontend\Controller;

use Frontend\Form\Contact;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends MasterController
{
    public function indexAction()
    {
        $view = new ViewModel();

        $productCategoryModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductCategoryModel');
        $productCategories = $productCategoryModel->fetchWhere('product_category_status = 1 AND product_category_picture !=""', 6);

        $dataProductcategories = [];
        foreach($productCategories as $v) {
            $dataProductcategories[$v['product_category_id']] = $v;
        }

        $productModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ProductModel');
        $products = $productModel->fetchWhere('product_status = 1', 3);

        $productHots = $productModel->fetchWhere('product_hot = 1', 3);

        $pageModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PageModel');
        $pages = $pageModel->fetchWhere('post_type = 2');

        $dataPages = [];
        foreach($pages as $v) {
            $dataPages[$v['post_id']] = $v;
        }

        $websiteGeneralModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('WebsiteGeneralModel');
        $websiteGeneral = $websiteGeneralModel->fetchPrimary(1);
        $this->layout()->setVariable('websiteGeneral', $websiteGeneral);


        $form = new Contact();

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $form->setData($data);
            if ($form->isValid()) {
                $params = [];
                $params['contact_fullname'] = $this->params()->fromPost('contact_fullname');
                $params['contact_email']    = $this->params()->fromPost('contact_email');
                $params['contact_phone']    = $this->params()->fromPost('contact_phone');
                $params['contact_content']  = $this->params()->fromPost('contact_content');
                $params['contact_date']     = date('Y-m-d H:i:s');

                $contactModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('ContactModel');
                $contactModel->savePrimary($params);

                $patterns = [];
                $patterns[0] = '/{fullname}/';
                $patterns[1] = '/{email}/';
                $patterns[2] = '/{phone}/';
                $patterns[3] = '/{content}/';

                $replacements = [];
                $replacements[0] = $params['contact_fullname'];
                $replacements[1] = $params['contact_email'];
                $replacements[2] = $params['contact_phone'];
                $replacements[3] = $params['contact_content'];

                $bodyMail = file_get_contents('data/email-template/contact.php');
                $bodyMail = preg_replace($patterns, $replacements, $bodyMail);

                $sendMail = $this->getServiceLocator()->get('SendMail');

                $websiteEmailModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('WebsiteEmailModel');
                $websiteEmail = $websiteEmailModel->fetchPrimary(1);

                $sendMail->setTo($websiteEmail['website_email_primary_email']);
                $sendMail->setSubject('Liên hệ');
                $sendMail->setBody($bodyMail);
                $sendMail->send();

                $view->requestSuccess = true;
            }
        }

        $view->productCategories = $dataProductcategories;
        $view->products = $productHots;
        $view->form = $form;
        $view->pages = $dataPages;

        return $view;
    }

}
