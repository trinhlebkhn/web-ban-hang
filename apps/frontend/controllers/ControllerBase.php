<?php
namespace Graduate\Frontend\Controllers;
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {
        $mainMenu = $this->getMainMenu();
        $this->view->setVars([
           'mainMenu' => $mainMenu
        ]);
    }

    public function getMainMenu(){
        $menuBlockObj = new \MenuBlock();
        $optional = [
            'q' => 'is_main=1'
        ];
        $rsMainBlock = $menuBlockObj->getListObj($optional);
        $menuObj = new \Menu();
        $rsMainMenu = $menuObj->getListObj($rsMainBlock->data[0]['id']);
        return $rsMainMenu->data;
    }

}
