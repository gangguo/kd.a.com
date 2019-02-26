<?php

namespace admin\event;
use kali\core\log;


class test_event
{
    public function test($event)
    {
        log::info("tigger in event".$event);
    }
}
