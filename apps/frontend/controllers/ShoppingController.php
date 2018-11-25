<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/29/2018
 * Time: 9:58 AM
 */

namespace Graduate\Frontend\Controllers;


class ShoppingController extends ControllerBase
{
    use \MailService;

    public function initialize()
    {
        parent::initialize();
        $viettelPostService = new \ViettelPostService();
        $loginVTP = $viettelPostService->login();
        $this->session->set('vtp_token', $loginVTP->TokenKey);
    }

    public function cartAction()
    {
//        d($this->cart->getContent());
    }

    public function order_infoAction()
    {
        $total_product = $this->cart->getTotalProduct();
        if ($total_product == 0) {
            $this->response->redirect(base_uri() . '/');
        }
        $cityObj = new \City();
        $rsCities = $cityObj->getListObj();

        /* get list store viettel post */
        $viettelPostObj = new \ViettelPostService();
        $vtpToken = $this->session->get('vtp_token');
        $listStore = $viettelPostObj->getListStore($vtpToken);
        $listService = $viettelPostObj->getListService();
        $this->view->setVars([
            'listStore' => $listStore,
            'listService' => $listService,
            'listCity' => $rsCities->data
        ]);

        if ($this->request->isPost()) {
            $data = $this->request->getPost('info_payment');
            $auth = $this->session->get('auth');
            $cart = $this->session->get('cart');
            $data['email'] = $auth['email'];
            $data['price'] = $data['total_price'];
            $data['source_bill'] = 1;
            $data['ship_price'] = $this->session->get('ship_price');
            $this->session->set('info_order', $data);

            $billObj = new \Bill();
            $rsCreateBill = $billObj->createObj($data);
            if ($rsCreateBill->status == 1) {
                /* Tạo product-bill*/
                foreach ($cart as &$value) {
                    $dataProductBill = [
                        'bill_id' => $rsCreateBill->data['id'],
                        'product_id' => $value['id'],
                        'product_name' => $value['name'],
                        'quantity' => $value['quantity'],
                        'price' => $value['price_sell'],
                        'subtotal' => $value['total_price'],
                    ];
                    $productBillObj = new \ProductBill();
                    $rsCreateProductBill = $productBillObj->createObj($dataProductBill);
                    if (!$rsCreateProductBill->status) {
                        return $this->flash->error($rsCreateProductBill->message);
                    }
                }

                $order_code = $rsCreateBill->data['id'];
                $this->response->redirect(base_uri() . '/shopping/nlCheckout?order_id=' . $order_code);
            }
        }
    }

    public function nlCheckoutAction()
    {
        $info = $this->session->get('info_order');
        $money = $this->cart->getTotalPrice() / 2;
        $order_id = $this->request->get('order_id');
        $ship_price = $this->session->get('ship_price');
        if ($this->request->isPost()) {
            $nlcheckout = $this->nl_api;
            $total_amount = $_POST['total_amount'];
            $array_items[0] = array(
                'item_name1' => 'Đơn hàng ngân lượng',
                'item_quantity1' => 1,
                'item_amount1' => $total_amount,
                'item_url1' => 'http://nganluong.vn/'
            );

            $array_items = array();
            $payment_method = $_POST['option_payment'];
            $bank_code = @$_POST['bankcode'];
            $order_code = $_POST['order_id'];
            $payment_type = 1;
            $discount_amount = 0;
            $order_description = '';
            $tax_amount = 0;
            $fee_shipping = 0;
            $return_url = base_uri() . '/shopping/paymentSuccess';
            $cancel_url = urlencode(base_uri() . '/shopping/nlCheckout?order_id=' . $order_code);

            $buyer_fullname = $_POST['buyer_fullname'];
            $buyer_email = $_POST['buyer_email'];
            $buyer_mobile = $_POST['buyer_mobile'];
            $buyer_address = '';
            if ($payment_method != '' && $buyer_email != "" && $buyer_mobile != "" && $buyer_fullname != "" && filter_var($buyer_email, FILTER_VALIDATE_EMAIL)) {
                if ($payment_method == "VISA") {
                    $nl_result = $nlcheckout->VisaCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount,
                        $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile,
                        $buyer_address, $array_items, $bank_code);

                } elseif ($payment_method == "NL") {
                    $nl_result = $nlcheckout->NLCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount,
                        $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile,
                        $buyer_address, $array_items);

                } elseif ($payment_method == "ATM_ONLINE" && $bank_code != '') {
                    $nl_result = $nlcheckout->BankCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount,
                        $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile,
                        $buyer_address, $array_items);
                } elseif ($payment_method == "NH_OFFLINE") {
                    $nl_result = $nlcheckout->officeBankCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                } elseif ($payment_method == "ATM_OFFLINE") {
                    $nl_result = $nlcheckout->BankOfflineCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);

                } elseif ($payment_method == "IB_ONLINE") {
                    $nl_result = $nlcheckout->IBCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                } elseif ($payment_method == "CREDIT_CARD_PREPAID") {

                    $nl_result = $nlcheckout->PrepaidVisaCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items, $bank_code);
                }

                if ($nl_result->error_code == '00') {
                    $rsSendEmail = $this->setUpSendMail((string)$nl_result->checkout_url, $info, $order_code, $buyer_email);
                    if ($rsSendEmail !== 1) $this->flash->error('Có lỗi xảy ra khi thiết lập gửi mail!');
                    else {
                        $this->view->payed = 1;
                        unset($_SESSION['cart']);
                        unset($_SESSION['ship_price']);
                    }
                } else {
                    $this->flash->error($nl_result->error_message);
                }

            } else {
                $this->flash->error("Thông tin đơn hàng không đầy đủ");
            }
        }
        $this->view->setVars([
            'user_info' => $info,
            'money' => $money,
            'order_id' => $order_id,
            'ship_price' => $ship_price,
        ]);
    }

    public function paymentSuccessAction()
    {
        $nlcheckout = $this->nl_api;
        $nl_result = $nlcheckout->GetTransactionDetail($_GET['token']);
        $nl_message = '';
        $nl_status = 0;
        if ($nl_result) {
            $this->view->nl_result = $nl_result;
            $nl_errorcode = (string)$nl_result->error_code;
            $nl_transaction_status = (string)$nl_result->transaction_status;
            if ($nl_errorcode == '00') {
                if ($nl_transaction_status == '00') {
                    $nl_status = 1;
                    $bilObj = new \Bill();
                    $dataUpdateBill = [
                        'id' => (string)$nl_result->order_code,
                        'status' => 2
                    ];
                    $rsUpdate = $bilObj->updateObj($dataUpdateBill);
                    if ($rsUpdate->status) {
                        $data = [
                            'cus_name' => (string)$nl_result->buyer_fullname,
                            'cus_email' => (string)$nl_result->buyer_email,
                            'cus_phone' => (string)$nl_result->buyer_mobile,
                            'total' => (string)$nl_result->total_amount,
                            'time' => date("d/m/Y H:i:s", intval(time()))
                        ];
                        $this->view->setVars([
                            'payment_success' => 1,
                            'data' => $data
                        ]);
                    } else {
                        $this->flash->error("Có lỗi xảy ra, Vui lòng liên hệ nhà quản trị!");
                    }
                }
            } else {
                $nl_message = $nlcheckout->GetErrorMessage($nl_errorcode);
            }

            $this->view->setVars([
                'nl_status' => $nl_status,
                'nl_result' => $nl_result,
                'nl_message' => $nl_message,
            ]);
        }
    }

    public function setUpSendMail($url, $info_order, $order_code, $buyer_email)
    {
        $mail = file_get_contents(__DIR__ . "/../../../public/template_email/order.html");
        $mail = str_replace("{link_nl}", $url, $mail);
        $mail = str_replace("{cus_name}", $info_order['customer_name'], $mail);
        $mail = str_replace("{email}", $info_order['email'], $mail);
        $mail = str_replace("{phone}", $info_order['phone'], $mail);
        $mail = str_replace("{address}", $info_order['address'], $mail);
        $mail = str_replace("{order_code}", $order_code, $mail);
        $mail = str_replace("{time}", date("d/m/Y H:i:s", intval(time())), $mail);
        $info_product = '';
        $listProduct = $this->session->get('cart');
        foreach ($listProduct as $product) {
            $info_product .= '
                     <tr>
                        <td>' . $product['name'] . '</td>
                        <td>' . number_format($product['price_sell']) . '</td>
                        <td class="text-center">' . $product['quantity'] . '</td>
                        <td class="total-price">' . number_format(($product['price_sell'] * $product['quantity'])) . '</td>
                    </tr>
            ';
        }
        $mail = str_replace("{info_product}", $info_product, $mail);
        $ship_price = $this->session->get('ship_price');
        $mail = str_replace("{subtotal}", number_format($info_order['total_price']), $mail);
        $mail = str_replace("{ship_price}", number_format($ship_price), $mail);
        $mail = str_replace("{total}", number_format($info_order['price'] + $ship_price), $mail);
        $rs = $this->sendMail($buyer_email, $mail);
        return $rs;
    }
}