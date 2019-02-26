<?php

namespace app\event;
use kali\core\log;


class test_event
{
    public function test($event)
    {
        log::info("tigger in event".$event);
    }
}
