<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Frontend\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class PostController extends MasterController
{
    public function categoryAction()
    {
        $view = new ViewModel();

        $data   = $this->params()->fromRoute();
        $postCategoryId = $data['id'];

        $postCategoryModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PostCategoryModel');
        $postModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PostModel');
        $escaper = new \Zend\Escaper\Escaper('utf-8');

        $page = $this->params()->fromQuery('page', 1);
        $posts = $postModel->fetchPage($page, 5, 'post_category_id = ' . $postCategoryId);

        $postCategory = $postCategoryModel->fetchPrimary($postCategoryId);

        $crum = '<ul class="crumb">
                    <li><a href="/">Trang chủ</a></li>
                    <li class="sep">/</li>
                    <li>' . $escaper->escapeHtml($postCategory['post_category_name']) . '</li>
                </ul>';

        $view->setVariables([
            'posts'          => $posts,
            'postCategory'   => $postCategory,
            'name'              => $data['name'],
            'id'                => $data['id'],
            'crum'              => $crum,
        ]);

        return $view;
    }

    public function detailAction()
    {
        $view = new ViewModel();

        $data = $this->params()->fromRoute();
        $id = $data['id'];

        $url = $this->getServiceLocator()->get('viewhelpermanager')->get('url');
        $functions = new \Application\View\Helper\Functions();
        $postCategoryModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PostCategoryModel');
        $postModel = $this->getServiceLocator()->get('FrontendModelGateway')->getModel('PostModel');
        $post = $postModel->fetchPrimary($id);
        $postCategory = $postCategoryModel->fetchPrimary($post['post_category_id']);
        $postOther = $postModel->fetchWhere('post_status = 1 AND post_type = 1 AND post_id <>' . $post['post_id']);
        $escaper = new \Zend\Escaper\Escaper('utf-8');

        $crum = '<ul class="crumb">
                    <li><a href="/">Trang chủ</a></li>
                    <li class="sep">/</li>
                    <li><a href="' . $url('home-news-category', array('name' => $functions->formatTitle($postCategory['post_category_name']), 'id' => $postCategory['post_category_id'])) . '">' . $escaper->escapeHtml($postCategory['post_category_name']) . '</a></li>
                    <li class="sep">/</li>
                    <li>' . $escaper->escapeHtml($post['post_title']) . '</li>
                </ul>';

        $view->setVariables([
            'post' => $post,
            'crum' => $crum,
            'postCategory' => $postCategory,
            'postOther' => $postOther,
        ]);

        return $view;
    }

}
