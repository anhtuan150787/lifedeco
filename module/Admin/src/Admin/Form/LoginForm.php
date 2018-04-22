<?php
namespace Admin\Form;

use Zend\Form\Form;
use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;

class LoginForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('users');

        $this->add(array(
            'name' => 'users_email',
            'type' => 'email',
            'attributes' => [
                'placeholder' => 'Email',
                'class' => 'form-control',
                'required' => 'required',
               // 'value' => 'anhtuan150787@gmail.com',
            ],
        ));

        $this->add(array(
            'name' => 'users_password',
            'type' => 'Password',
            'attributes' => [
                'placeholder' => 'Mật khẩu',
                'class' => 'form-control',
                'required' => 'required',
            ],
        ));

        $configCaptcha = include 'config/captcha.php';

        $captchaImage = new CaptchaImage($configCaptcha);

        $this->add(array(
            'type' => 'Zend\Form\Element\Captcha',
            'name' => 'Captcha',
            'options' => [
                'captcha' => $captchaImage,
            ],
            'attributes' => [
                'placeholder' => 'Mã xác thực',
                'class' => 'form-control captcha-input',
                'required' => 'required',
            ],
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf',
            'options' => array(
                'csrf_options' => array(
                    'timeout' => 600
                )
            )
        ));

        $this->add(array(
            'name' => 'users_submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Đăng nhập',
                'id' => 'submitbutton',
                'class' => 'btn btn-default submit',
            ),
        ));
    }
}