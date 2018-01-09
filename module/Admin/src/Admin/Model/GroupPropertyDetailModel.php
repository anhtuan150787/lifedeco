<?php
namespace Admin\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Validator\NotEmpty;

class GroupPropertyDetailModel extends MasterModel implements InputFilterAwareInterface
{
    protected $inputFilter;

    public function __construct($services)
    {
        $this->tableName = 'group_property_detail';
        $this->primary  = 'group_property_detail_id';

        parent::__construct($services);
    }

    public function checkExistProperty($groupPropertyId, $propertyId)
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE group_property_id = ' . $groupPropertyId . ' AND property_id = ' . $propertyId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result->count();
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $inputFilter->add([
                'name' => 'group_property_detail_id',
                'required' => true,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
                'validators' => [
                    [
                        'name' => 'not_empty',
                        'options' => [
                            'messages' => [
                                NotEmpty::IS_EMPTY => 'Vui lòng nhập thông tin',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                ],
            ]);

            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }


}