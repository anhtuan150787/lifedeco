<?php
namespace Admin\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Validator\NotEmpty;

class ProductCategoryModel extends MasterModel implements InputFilterAwareInterface
{
    protected $inputFilter;

    public function __construct($services)
    {
        $this->tableName = 'product_category';
        $this->primary  = 'product_category_id';

        parent::__construct($services);
    }

    public function getProductCategories($parent = 0, $level = -1, $data = array())
    {
        $paramsCache = ['name' => __FUNCTION__, 'params' => $this->tableName . '.' . $this->primary . '.' . $parent . '.' . $level . '.' . serialize($data)];
        $keyCache = $this->getKeyCache($paramsCache);

        if (!$this->cache->setNameSpace($this->tableName)->checkItem($keyCache)) {

            $result = $this->getProductCategory($parent, $level, $data);

            $this->cache->setNameSpace($this->tableName)->set($keyCache, $result);

            return $result;

        } else {
            return $this->cache->setNameSpace($this->tableName)->get($keyCache);
        }
    }

    public function getProductCategory($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE product_category_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $product_category_id = $row[$this->primary];

            $data[$product_category_id] = (array) $row;
            $data[$product_category_id]['product_category_level'] = $level;

            $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE product_category_parent = ' . $product_category_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getProductCategory($product_category_id, $level, $data);
            }
        }
        return $data;
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
                'name' => 'product_category_name',
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