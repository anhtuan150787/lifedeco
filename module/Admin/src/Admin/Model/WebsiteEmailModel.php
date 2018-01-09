<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

use Zend\Validator\Db\NoRecordExists;
use Zend\Validator\EmailAddress;
use Zend\Validator\NotEmpty;

class WebsiteEmailModel extends MasterModel
{
    public function __construct($services)
    {
        $this->tableName = 'website_email';
        $this->primary  = 'website_email_id';

        parent::__construct($services);
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
                'name' => 'website_email_system_name',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_system_host',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_system_port',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_system_username',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_system_password',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_system_ssl',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_primary_email',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_from',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $inputFilter->add([
                'name' => 'website_email_from_name',
                'required' => false,
                'filters' => [
                    ['name' => 'StripTags'],
                    ['name' => 'Stringtrim'],
                ],
            ]);

            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }
}