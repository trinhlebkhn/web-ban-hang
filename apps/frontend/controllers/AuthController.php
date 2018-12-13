<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/29/2018
 * Time: 1:54 PM
 */

namespace Graduate\Frontend\Controllers;
class AuthController extends ControllerBase
{
    use \MailService;

    public function initialize(){
        parent::initialize();
    }

    public function loginAction()
    {
        $auth = $this->getAuth();
        if(!empty($auth)) return $this->response->redirect(base_uri());

        if ($this->request->isPost()) {
            $data = $this->request->getPost('data');
            $userObj = new \User();
            $rs = $userObj->checkLogin($data);
            if ($rs->status) {
                $this->setAuth($rs->data);
                $check_redirect = $this->session->get('pay');
                if ($check_redirect == 1) {
                    $this->response->redirect(base_uri() . '/dat-hang.html');
                } else $this->response->redirect(base_uri() . '/');
            } else {
                $this->view->data = $data;
                $this->flash->error($rs->message);
            }
        }
    }

    public function registerAction()
    {
        if ($this->request->isPost()) {
            $data = $this->request->getPost('pageRegister');
            $dataDob = $this->request->getPost('pageRegister_birth');
            $data['role'] = 1;
            $data['dob'] = $dataDob['year'] . '-' . $dataDob['month'] . '-' . $dataDob['day'];
            $userObj = new \User();
            $rs = $userObj->createObj($data);
            if ($rs->status) {
                $this->setAuth($rs->data);
                if (!$this->getPay()) {
                    $this->response->redirect(base_uri());
                } else {
                    $this->response->redirect(base_uri() . '/thanh-toan.html');
                }
            } else {
                $this->flash->error($rs->message);
                $this->view->data = $data;
            }
        }
    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect(base_uri());
    }

    public function forgot_passwordAction()
    {
        $this->view->success = 0;
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email');
            $userObj = new \User();
            $optional = [
                'q' => 'email like "' . $email . '"'
            ];

            $rsCheck = $userObj->getListObj($optional);
            if(empty($rsCheck->data)) return $this->flash->error('Tài khoản của bạn không tồn tại trên hệ thống!');
            $token = $this->str_rand(20);
            $data = $rsCheck->data[0];
            $data['token'] = $token;
            $rsSaveToken = $userObj->updateObj($data);
            if (!$rsSaveToken->status) return $this->flash->error($rsSaveToken->message);

            $userName = $data['fullname'];
            $url = base_uri() . '/thay-doi-mat-khau?token=' . $token . '&email=' . $email;
            $this->setUpSendMailForgotPassword($url, $userName, base_uri(), $email);
            $this->view->success = 1;
            $this->flash->success('Bạn vui lòng kiểm tra email để lấy đường dẫn thay đổi mật khẩu!');
        }
    }

    public function reset_passAction()
    {
        $token = $this->request->get('token');
        $email = $this->request->get('email');
        $userObj = new \User();
        $optional = [
            'q' => 'email like "' . $email . '"'
        ];
        $rsCheck = $userObj->getListObj($optional);
        $dataCheck = $rsCheck->data[0];
        if(empty($dataCheck)) return $this->flash->error('Email của bạn không tồn tại trên hệ thống!');
        if($dataCheck['token'] != $token) return $this->flash->error('Token của bạn không tồn tại hoặc đã hết hạn. Vui lòng kiểm tra lại!');
        $this->view->success = 1;
        if($this->request->isPost()) {
            $data = $this->request->getPost('data');
            $data['id'] = $dataCheck['id'];
            $data['email'] = $dataCheck['email'];
            $data['phone'] = $dataCheck['phone'];
            $data['token'] = '';
            $rsChangePass = $userObj->updateObj($data);
            if($rsChangePass->status) {
                $this->view->success = 2;
                return $this->flash->success('Bạn đã thay đổi thanh công!');
            } else {
                return $this->flash->error($rsChangePass->message);
            }
        }
    }

    public function str_rand($len)
    {
        $str = '';
        for ($i = 0; $i < $len; $i++) {
            $str .= md5(rand());
        }
        return $str;
    }

    public function setUpSendMailForgotPassword($url, $user_name, $domain, $send_email)
    {
        $mail = file_get_contents(__DIR__ . "/../../../public/template_email/forgotpass.html");
        $mail = str_replace("{user_name}", $user_name, $mail);
        $mail = str_replace("{domain}", $domain, $mail);
        $mail = str_replace("{link}", $url, $mail);
        $rs = $this->sendMail($send_email, $mail);
        return $rs;
    }

    /**
     * Điều hướng khi người dùng chưa đăng nhập mà muốn thanh toán
     */
    public function payAction()
    {
        $this->session->set('pay', '1');
        if ($this->cart->getTotalProduct() > 0) {
            $this->response->redirect("/dang-nhap.html");
        } else {
            $this->response->redirect('/');
        }
    }

}