<?php
namespace Admin\Form;

use Zend\Form\Form;


class ProductForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('product');

        $this->add([
            'name' => 'product_name',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
                'required' => 'required',
            ],
            'options' => [
                'label' => 'Tên Dự án',
                'label_attributes' => ['class' => 'control-label col-md-2 col-sm-2 col-xs-12'],
            ],
        ]);

//        $this->add([
//            'name' => 'product_price',
//            'type' => 'Text',
//            'attributes' => [
//                'class' => 'form-control',
//                'onkeyup' => 'this.value=addCommas(this.value)'
//            ],
//            'options' => [
//                'label' => 'Giá',
//                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
//            ],
//        ]);

        $this->add([
            'name' => 'product_tag',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Từ khóa',
                'label_attributes' => ['class' => 'control-label col-md-2 col-sm-2 col-xs-12'],
            ],
        ]);


        $this->add([
            'name' => 'product_hot',
            'type' => 'Zend\Form\Element\Checkbox',
            'attributes' => [
                //'class' => 'form-control',
                'style' => 'margin-left: 0'
            ],
            'options' => [
                'label' => 'Tiêu biểu',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
                'use_hidden_element' => false,
                'disable_inarray_validator' => true,
            ],
        ]);

        $this->add([
            'name' => 'product_push_time',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Giờ đăng bài',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
            ],
        ]);


        $this->add([
            'name' => 'product_description',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => [
                'class' => 'form-control description',
            ],
            'options' => [
                'label' => 'Mô tả ngắn',
                'label_attributes' => ['class' => 'control-label col-md-1 col-sm-1 col-xs-12'],
            ],
        ]);

        $this->add([
            'name' => 'product_body',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => [
                'class' => 'form-control content',
            ],
            'options' => [
                'label' => 'Mô tả chi tiết',
                'label_attributes' => ['class' => 'control-label col-md-1 col-sm-1 col-xs-12'],
            ],
        ]);

        $this->add([
            'name' => 'product_category_id',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Danh mục',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
                'disable_inarray_validator' => true,
            ],
        ]);

        $this->add([
            'name' => 'product_picture',
            'type' => 'file',
            'attributes' => [
                'class' => 'form-control',
                //'onchange' => 'readURL(this);',
            ],
            'options' => [
                'label' => 'Hình đại diện (700x466 pixel)',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
            ],
        ]);

        $this->add([
            'name' => 'product_picture_multi',
            'type' => 'file',
            'attributes' => [
                'class' => 'form-control',
                'id' => 'gallery-photo-add',
                'multiple' => 'multiple',
            ],
            'options' => [
                'label' => 'Hình slide (980x380 pixel)',
                'label_attributes' => ['class' => 'control-label col-md-32 col-sm-2 col-xs-12'],
            ],
        ]);


        $this->add([
            'name' => 'product_status',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Trạng thái',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
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
            'name' => 'frmReset',
            'type' => 'Submit',
            'attributes' => [
                'value' => 'Làm lại',
                'id' => 'frmReset',
                'class' => 'btn btn-primary',
            ],
        ]);

        $this->add([
            'name' => 'frmSubmit',
            'type' => 'Submit',
            'attributes' => [
                'value' => 'Thêm mới',
                'id' => 'frmSubmit',
                'class' => 'btn btn-success',
            ],
        ]);
    }
}