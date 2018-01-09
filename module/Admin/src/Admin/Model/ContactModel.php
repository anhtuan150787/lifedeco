<?php
namespace Admin\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Validator\NotEmpty;

class ContactModel extends MasterModel implements InputFilterAwareInterface
{
    protected $inputFilter;

    public function __construct($services)
    {
        $this->tableName = 'contact';
        $this->primary  = 'contact_id';

        parent::__construct($services);
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
       return;
    }


}