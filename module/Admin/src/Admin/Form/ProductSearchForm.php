<?php
namespace Admin\Form;

use Zend\Form\Form;


class ProductSearchForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('product_search');

        $this->add([
            'name' => 'product_name_search',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Tên dự án',
            ],
        ]);

        $this->add([
            'name' => 'product_category_search',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Danh mục',
                'disable_inarray_validator' => true,
            ],
        ]);

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf',
            'options' => array(
                'csrf_options' => array(
                    'timeout' => 600
                )
            )
        ));

        $this->add([
            'name' => 'frmSubmit',
            'type' => 'Submit',
            'attributes' => [
                'value' => 'Tìm kiếm',
                'id' => 'frmSubmit',
                'class' => 'btn btn-primary',
            ],
        ]);
    }
}