<?php
namespace Admin\Form;

use Zend\Form\Form;


class PropertyForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('property');

        $this->add([
            'name' => 'property_name',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
                'required' => 'required',
            ],
            'options' => [
                'label' => 'Thuộc tính',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
            ],
        ]);

        $this->add([
            'name' => 'property_type',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Loại',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
                'disable_inarray_validator' => true,
            ],
        ]);

        $this->add([
            'name' => 'property_status',
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

        $this->add([
            'name' => 'property_code',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Mã thuộc tính',
                'label_attributes' => ['class' => 'control-label col-md-3 col-sm-3 col-xs-12'],
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