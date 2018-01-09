<?php
return array(
    'router' => array(
        'routes' => array(
            'admin' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/admin',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Admin\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/[:controller[/:action]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Message' => 'Admin\Controller\MessageController',
            'Admin\Controller\Index' => 'Admin\Controller\IndexController',
            'Admin\Controller\Login' => 'Admin\Controller\LoginController',
            'Admin\Controller\Logout' => 'Admin\Controller\LogoutController',
            'Admin\Controller\Forget' => 'Admin\Controller\ForgetController',
            'Admin\Controller\Menu' => 'Admin\Controller\MenuController',
            'Admin\Controller\Acl' => 'Admin\Controller\AclController',
            'Admin\Controller\User' => 'Admin\Controller\UserController',
            'Admin\Controller\GroupUser' => 'Admin\Controller\GroupUserController',
            'Admin\Controller\WebsiteGeneral' => 'Admin\Controller\WebsiteGeneralController',
            'Admin\Controller\WebsiteEmail' => 'Admin\Controller\WebsiteEmailController',
            'Admin\Controller\Post' => 'Admin\Controller\PostController',
            'Admin\Controller\Page' => 'Admin\Controller\PageController',
            'Admin\Controller\PostCategory' => 'Admin\Controller\PostCategoryController',
            'Admin\Controller\GroupNavigation' => 'Admin\Controller\GroupNavigationController',
            'Admin\Controller\Navigation' => 'Admin\Controller\NavigationController',
            'Admin\Controller\GroupTemplate' => 'Admin\Controller\GroupTemplateController',
            'Admin\Controller\Template' => 'Admin\Controller\TemplateController',
            'Admin\Controller\ProductCategory' => 'Admin\Controller\ProductCategoryController',
            'Admin\Controller\Product' => 'Admin\Controller\ProductController',
            'Admin\Controller\GroupProperty' => 'Admin\Controller\GroupPropertyController',
            'Admin\Controller\Property' => 'Admin\Controller\PropertyController',
            'Admin\Controller\PropertyDetail' => 'Admin\Controller\PropertyDetailController',
            'Admin\Controller\Contact' => 'Admin\Controller\ContactController',
        ),
    ),

    'view_manager' => array(
        'template_map' => array(
            'layout/admin' => __DIR__ . '/../view/layout/layout.phtml',
            'layout/login' => __DIR__ . '/../view/layout/login.phtml',

            'admin/partial/paginator' => __DIR__ . '/../view/partial/paginator.phtml',
            'admin/partial/paginator2' => __DIR__ . '/../view/partial/paginator2.phtml',
            'admin/partial/message' => __DIR__ . '/../view/partial/message.phtml',

            'admin/partial/form_title' => __DIR__ . '/../view/partial/form_title.phtml',
            'admin/partial/form_button' => __DIR__ . '/../view/partial/form_button.phtml',
            'admin/partial/form_action_title' => __DIR__ . '/../view/partial/form_action_title.phtml',
            'admin/partial/form_normal' => __DIR__ . '/../view/partial/form_normal.phtml',
            'admin/partial/form_element/input' => __DIR__ . '/../view/partial/form_element/input.phtml',
            'admin/partial/form_element/input2' => __DIR__ . '/../view/partial/form_element/input2.phtml',
            'admin/partial/form_element/picture' => __DIR__ . '/../view/partial/form_element/picture.phtml',
            'admin/partial/form_element/picture_multi' => __DIR__ . '/../view/partial/form_element/picture_multi.phtml',
            'admin/partial/form_element/text' => __DIR__ . '/../view/partial/form_element/text.phtml',
            'admin/partial/form_element/textarea' => __DIR__ . '/../view/partial/form_element/textarea.phtml',
            'admin/partial/form_element/checkbox' => __DIR__ . '/../view/partial/form_element/checkbox.phtml',

            'admin/partial/table_normal' => __DIR__ . '/../view/partial/table_normal.phtml',
            'admin/partial/table_simple' => __DIR__ . '/../view/partial/table_simple.phtml',
            'admin/partial/table_paging_special' => __DIR__ . '/../view/partial/table_paging_special.phtml',
            'admin/partial/table_title' => __DIR__ . '/../view/partial/table_title.phtml',
            'admin/partial/table_column_name' => __DIR__ . '/../view/partial/table_column_name.phtml',
            'admin/partial/table_column_data' => __DIR__ . '/../view/partial/table_column_data.phtml',
            'admin/partial/table_column_action' => __DIR__ . '/../view/partial/table_column_action.phtml',
            'admin/partial/table_count_table' => __DIR__ . '/../view/partial/table_count_table.phtml',
            'admin/partial/table_paginator' => __DIR__ . '/../view/partial/table_paginator.phtml',
            'admin/partial/table_paginator2' => __DIR__ . '/../view/partial/table_paginator2.phtml',

            'admin/partial/view_simple' => __DIR__ . '/../view/partial/view_simple.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
);