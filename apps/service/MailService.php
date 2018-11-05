<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 11/6/2018
 * Time: 12:08 AM
 */

trait MailService
{

    public function sendMail($to,$body)
    {
        $transport = (new Swift_SmtpTransport('smtp.gmail.com', 465,'ssl'))
            ->setUsername("hdb.a12k34@gmail.com")
            ->setPassword("ngoctrinha12k34")
            ->setAuthMode('PLAIN');
        ;
        $mailer = new Swift_Mailer($transport);

        $message = (new Swift_Message('ABC đơn hàng'))
            ->setFrom(['hdb.a12k34@gmail.com' => 'Admin'])
            ->setTo([$to])
            ->setContentType('text/html; charset=utf-8')
            ->setBody($body)
        ;
        $transport->setStreamOptions([
            'ssl' => [
                'allow_self_signed' => true,
                'verify_peer' => false
            ]
        ]);
        $result = $mailer->send($message);
        return $result;
    }
}