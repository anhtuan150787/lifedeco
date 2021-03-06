<?php
namespace Admin\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\Validator\NotEmpty;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class ProductModel extends MasterModel implements InputFilterAwareInterface
{
    protected $inputFilter;

    public function __construct($services)
    {
        $this->tableName = 'product'; //VIEW product
        $this->primary  = 'product_id';

        $this->tableView = 'view_product';

        parent::__construct($services);
    }

    public function fetchPage($page, $pageItemPerCount, $search)
    {
        /*
         * Select
         */
        $select = 'SELECT ' . $this->tableView . '.product_id, product_name, product_picture, product_view, product_date_updated, product_users_updated, product_status, product_hot, users_fullname, product_category.product_category_name as product_category_name';

        /*
         * From
         */
        $from = ' FROM ' . $this->tableView . ' LEFT JOIN product_category ON product_category.product_category_id=' . $this->tableView . '.product_category_id ';

        /*
         * Where
         */
        $where = ' WHERE 1=1 ';

        if (isset($search['product_name_search'])) {
            $where .= ' AND product_name like "%' . $search['product_name_search']  . '%"';
        }

        if (isset($search['product_category_search'])) {
            $where .= ' AND product_category.product_category_id=' . $search['product_category_search'];
        }

        /*
         * Limit page
         */
        $start = ($page - 1) * $pageItemPerCount;
        $end = $pageItemPerCount;
        $limit = ' LIMIT ' . $start . ',' . $end;
        $orderBy = ' ORDER BY ' . $this->tableView . '.product_id DESC';

        $sql = $select . $from . $where . $orderBy . $limit;

        /*
         * Result
         * Get in Cache
         */
        $paramsCache = ['name' => 'countFetchPage', 'params' => $this->tableName . '.' . $this->primary . '.' . $sql];
        $keyCache = $this->getKeyCache($paramsCache);

        if (!$this->cache->setNameSpace($this->tableName)->checkItem($keyCache)) {
            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();
            $resultArray = iterator_to_array($result);
            $this->cache->setNameSpace($this->tableName)->set($keyCache, $resultArray);
        } else {
            $resultArray = $this->cache->setNameSpace($this->tableName)->get($keyCache);
        }


        /*
         * Paging
         */
        $paging = new Paginator(new ArrayAdapter($resultArray));
        $paging->setCurrentPageNumber($page);
        $paging->setItemCountPerPage($pageItemPerCount);

        /*
         * Total
         * Get in Cache
         */
        $sqlTotal = 'SELECT count(' . $this->tableView . '.product_id) as total ' . $from . $where;
        $paramsCache = ['name' => 'countFetchPage', 'params' => $this->tableName . '.' . $this->primary . '.' . $sqlTotal];
        $keyCache = $this->getKeyCache($paramsCache);

        if (!$this->cache->setNameSpace($this->tableName)->checkItem($keyCache)) {
            $statement = $this->tableGateway->getAdapter()->query($sqlTotal);
            $resultTotal = $statement->execute();
            $resultTotal = $resultTotal->current();
            $total = $resultTotal['total'];
            $this->cache->setNameSpace($this->tableName)->set($keyCache, $total);
        } else {
            $total = $this->cache->setNameSpace($this->tableName)->get($keyCache);
        }

        return ['paging' => $paging, 'data' => $resultArray, 'total' => $total];
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
                'name' => 'product_name',
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

            $inputFilter->add([
                'name' => 'product_picture',
                'required' => false,
                'allow_empty' => true,
                'validators' => [
                    [
                        'name' => 'Zend\Validator\File\Size',
                        'options' => [
                            'max' => '1MB'
                        ],
                    ],
                    [
                        'name' => 'Zend\Validator\File\Extension',
                        'options' => [
                            'extension' => 'png,jpg,gif,jpeg',
                        ],
                    ],
                ],
            ]);

            $inputFilter->add([
                'name' => 'product_category_id',
                'required' => false,
                'allow_empty' => true,
            ]);

            $inputFilter->add([
                'name' => 'product_hot',
                'required' => false,
                'allow_empty' => true,
            ]);

            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }


}