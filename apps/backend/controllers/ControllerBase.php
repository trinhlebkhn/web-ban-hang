<?php
namespace Graduate\Backend\Controllers;
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    use \SessionExt;
    public function initialize()
    {
    }

    public function render_template($controller, $action, $data = null)
    {
        $view = $this->view;
        $content = $view->getRender($controller, $action, ["object" => $data], function ($view) {
            $view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_LAYOUT);
        });
        return $content;
    }

    public function setAdmin($data){
        $this->session->set('auth_admin', $data);
    }

    public function getAdmin() {
        return $this->session->get('auth_admin');
    }
}
